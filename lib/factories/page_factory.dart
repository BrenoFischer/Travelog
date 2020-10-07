import 'package:flutter/material.dart';
import 'package:travelog/classes/location.dart';
import 'package:travelog/classes/date.dart';
import 'package:travelog/classes/page.dart';
import 'package:travelog/factories/location_factory.dart';

class PageFactory {
  PageFactory({Key key, this.dates});
  final List<Date> dates;

  String textPage1 = "Chegamos em Dublin, depois de partir do aeroporto de Paris. " +
      "O vôo foi complicado! Tudo começou na noite anterior, partimos para o aeroporto durante a madrugada. " +
      "Um aeroporto isolado do centro de Paris, feito para vôos baratos da Raynair. " +
      "Chegando lá, cobraram uma taxa absurda, em euros. Uma taxa muito além do nosso orçamento. " +
      "O voo em si, não foi ruim. Chegamos rápido e sem turbulências. Porém, só de voar pela Rayanair já é uma aventura. " +
      "Não servem um copo d'água, sem cobrar. Capaz de até cobrarem para usar o banheiro." +
      " A diversão do vôo foi acompanhar o leilão de um perfume. Nunca imaginei que fosse presenciar isso enquanto passava pelo famoso Canal da Mancha. " +
      "Para piorar tudo, a imigração irlandesa resolveu encrencar com a Paola. " +
      "Esquecemos da regra básica: 'Ter passagem de saída do país comprada.'" +
      "Nós não tínhamos e começamos a nos enrolar conversando com o agente de imigração. " +
      "Nosso discurso não tava ensaiado e a cada resposta dada, a situação ia piorando. " +
      "Chegou um momento, inclusive, que ele leu que íamos trabalhar lá!" +
      "Fomos para Irlanda com um work exchange marcado. Era um trabalho ajudando um airbnb. O dono, Patrick," +
      " ia precisar de ajuda na época de festividades de final de ano. " +
      "Então, durante a conversa com o agente de imigração, acabamos mostrando a conversa do 'nosso amigo hospedeiro Patrick', " +
      "e ele leu a palavra 'trabalhar'... Resultado, tivemos que comprar uma passagem de saída, logo ali, na frente dele. " +
      "Enfim conseguimos entrar no país, com um belo carimbo de 'Vaza daqui até dia 25!' no passaporte da Paola. " +
      "Apesar do início conturbado, conseguimos realizar nosso sonho e estávamos livres para entrar na Irlanda. " +
      "Logo na saída do desembarque, fomos recebidos por um coral de crianças cantandando as tradicionais natalinas. Bem esteriótipo de filme mesmo.";

  List<DiaryPage> createPages() {
    List<DiaryPage> pages = new List();
    for (int i = 0; i < 3; i++) {
      List<Location> locations = new List();
      if (i == 0) {
        locations = LocationFactory.createLocationPage1();
      } else if (i == 1) {
        locations = LocationFactory.createLocationPage2();
      } else {
        locations = LocationFactory.createLocationPage3();
      }
      pages.add(DiaryPage(
        text: textPage1,
        date: dates[i],
        locations: locations,
      ));
    }
    return pages;
  }
}
