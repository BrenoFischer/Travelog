import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travelog/components/my_app_bar.dart';
import 'package:travelog/components/round_button.dart';
import 'package:travelog/components/text_form_field.dart';
import 'package:travelog/services/database.dart';
import 'package:travelog/ui/constants.dart';
import 'package:travelog/ui/size_styling.dart';

class NewDiaryScreen extends StatefulWidget {
  NewDiaryScreen({this.uid});
  final String uid;

  @override
  _NewDiaryScreenState createState() => _NewDiaryScreenState();
}

class _NewDiaryScreenState extends State<NewDiaryScreen> {
  final GlobalKey<FormState> _newDiaryKey = GlobalKey<FormState>();
  final _controllerTitle = TextEditingController();
  File _image;
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final Image banner = Image.asset(
      "assets/images/defaultBanner.png",
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );

    Future getImage() async {
      final image = await picker.getImage(source: ImageSource.gallery);

      setState(() {
        _image = File(image.path);
      });
    }

    Size size = MediaQuery.of(context).size;

    String titleValidator(String value) {
      if (value.length < 3 || value.length > 13) {
        return "O título deve ter entre 3 e 13 caracteres";
      } else {
        return null;
      }
    }

    void handleSubmit() async {
      String path;
      if (_newDiaryKey.currentState.validate()) {
        if (_image != null) {
          path = "users/${widget.uid}/diaryBanner/${_controllerTitle.text}";
          final firebase_storage.FirebaseStorage storage =
              firebase_storage.FirebaseStorage.instance;
          final firebase_storage.Reference ref = storage.ref().child(path);

          try {
            await ref.putFile(_image);
          } catch (e) {
            print(e);
          }
          path = await ref.getDownloadURL();
        } else {
          path = "assets/images/defaultBanner.png";
        }
        await Database().createDiary(widget.uid, _controllerTitle.text, path);
        Get.back();
      }
    }

    return Scaffold(
      appBar: MyAppBar(
        title: "Novo diário",
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _newDiaryKey,
          child: Container(
            margin: EdgeInsets.only(top: AppStyles.smallPadding),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: AppStyles.smallPadding),
                  child: Text(
                    "Escolha um título",
                    style: AppStyles.fieldStyle,
                  ),
                ),
                MyTextFormField(
                  controller: _controllerTitle,
                  type: 'title',
                  size: size,
                  label: "Título do diário",
                  validator: titleValidator,
                ),
                Container(
                  child: Text(
                    "Agora, escolha a capa",
                    style: AppStyles.fieldStyle,
                  ),
                ),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      margin: EdgeInsets.only(bottom: AppStyles.smallPadding),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 1.5, color: Colors.black),
                            left: BorderSide(width: 1.5, color: Colors.black),
                            right: BorderSide(width: 1.5, color: Colors.black),
                            bottom: BorderSide(width: 1.5, color: Colors.black),
                          ),
                        ),
                        child: SizedBox(
                          height: AppStyles.imageCardSize,
                          child: (_image != null)
                              ? Image.file(_image, fit: BoxFit.cover)
                              : banner,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        right: AppStyles.mediumPadding - 30,
                        bottom: AppStyles.mediumPadding - 15,
                      ),
                      child: GestureDetector(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 28,
                          child: Icon(
                            Icons.photo,
                            size: AppStyles.mediumPadding - 20,
                            color: secondaryColor,
                          ),
                        ),
                        onTap: () {
                          getImage();
                        },
                      ),
                    ),
                  ],
                ),
                RoundButton(
                  text: "Criar diário",
                  onPress: handleSubmit,
                  style: true,
                  width: AppStyles.buttonWidth * 1.4,
                  fontSize: AppStyles.buttonText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
