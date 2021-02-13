import 'package:socialhack/models/interest.dart';
import 'package:socialhack/models/request.dart';

/*
Lo que una ONG busca, ejemplo, adoptar a este perro
* */
List<Request> generateData() {
  return [
    Request.name(
        "ISKY",
        "A Isky o levaban alimentando na rúa uns voluntarios dende facía meses, debido a que pola saturación que estamos sufrindo non tiñamos oco para metelo no refuxio. A alguén, lle molestou a presencia de Isky e chamou o servizo de recollida, onde o seu futuro sería incerto. Por sorte, outra veciña deuse conta e nos avisou a tempo. Agora Isky está a salvo, pero precisamos atopar una familia que o queira",
        "http://protectoraosbiosbardos.org/imas/animales/_583/thumbnail_square.jpg?17458"),
    Request.name(
        "BEA",
        "Bea apareceu abandoada en outubro do 2013 na finca dunha señora en Arcos (Ponteareas) mentres buscaba onde refuxiarse. É unha cadeliña moi cariñosa e alegre que agora espera impaciente no refuxio a oportunidade de atopar o fogar que nunca coñeceu.",
        "http://protectoraosbiosbardos.org/imas/animales/_575/thumbnail_square.jpg?17349"
    ),
  ];
}

/*
Lo que una ONG busca, ejemplo, adoptar a este perro
* */
List<Interest> generateDataInterests() {
  return [
    Interest.name("Adoptar"),
    Interest.name("Apadrinar"),
    Interest.name("Tengo tiempo libre"),
    Interest.name("Tengo recursos"),
    Interest.name("Aporto trabajo"),
  ];
}
