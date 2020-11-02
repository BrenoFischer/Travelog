import 'package:flutter/material.dart';
import 'package:travelog/ui/size_styling.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(AppStyles.appBarHeight),
      child: AppBar(
        centerTitle: true,
        title: Text(title, style: Theme.of(context).textTheme.headline6),
      ),
    );
  }

  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
