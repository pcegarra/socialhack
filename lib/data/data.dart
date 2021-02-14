import 'package:socialhack/models/interest.dart';
import 'package:socialhack/models/request.dart';

/*
Lo que una ONG busca, ejemplo, adoptar a este perro
* */
List<Request> generateDataAdoptar() {
  return [
    Request.name(
        "ISKY",
        "A Isky o levaban alimentando na rúa uns voluntarios dende facía meses, debido a que pola saturación que estamos sufrindo non tiñamos oco para metelo no refuxio. A alguén, lle molestou a presencia de Isky e chamou o servizo de recollida, onde o seu futuro sería incerto. Por sorte, outra veciña deuse conta e nos avisou a tempo. Agora Isky está a salvo, pero precisamos atopar una familia que o queira",
        "https://img.miwuki.com/a/LQ895R/500",
        "https://petshelter.miwuki.com/adopta-a-luperca-en-sevilla-196847",
        "MoviendoelRabitosevilla"),
    Request.name(
        "BEA",
        "Bea apareceu abandoada na finca dunha señora en Arcos (Ponteareas) mentres buscaba onde refuxiarse. É unha gatiña moi cariñosa e alegre que agora espera impaciente no refuxio a oportunidade de atopar o fogar que nunca coñeceu.",
        "https://img.miwuki.com/a/W0WA8R/500",
        "https://petshelter.miwuki.com/adopta-a-xena-en-murcia-176099",
        "El Hocico"),
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
