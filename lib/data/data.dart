import 'package:flutter/material.dart';
import 'package:socialhack/models/interest.dart';
import 'package:socialhack/models/request.dart';

/*
Lo que una ONG busca, ejemplo, adoptar a este perro
* */
List<Request> generateData() {
  List<Interest> interests = generateDataInterests();

  return [
    Request.name(
        title: "Neo",
        content:
            "Neo fue encontrado abandonado y con  sarna en febrero del 2011 cuando tenía 2 meses de edad, fue adoptado poco después por las mismas personas que lo encontraron. Posteriormente lo devolvieron por una enfermedad de la  adoptante y desde entonces está en el refugio, esperando que aparezca su verdadera familia.",
        image: "https://img.miwuki.com/a/AK9HEI/500",
        url: "http://protectoraosbiosbardos.org/ficha-133",
        collaborator: "Os Biosbardos",
        interest: interests[1]),
    Request.name(
        title: "Bea",
        content:
            "Bea apareció  abandoada en octubre del 2013 en la hinca de una señora en Arcos (Ponteareas) mientras buscaba dónde refugiarse. ES una  cadeliña muy cariñosa y alegre que ahora espera impaciente en el refugio a oportunidad de encontrar el hogar que nunca conoció.",
        image: "https://img.miwuki.com/a/W0WA8R/500",
        url: "https://img.miwuki.com/a/UVVJ60/500",
        collaborator: "Os biosbardos",
        interest: interests[1]),
    Request.name(
        title: "Isky",
        content:
            "A Isky lo llevaban alimentando en la calle unos voluntarios desde hacía meses, puesto que por la saturación que estamos sufriendo no teníamos hueco para meterlo en el refugio. A alguien, le molestó la presencia de Isky y llamó el servicio de recogida, donde su futuro sería incierto. Por suerte, otra vecina se dio cuenta y nos avisó a tiempo. Ahora  Isky está a salvo, pero precisamos encontrar una familia que lo quiera,  respete y cuide como todos los animales merecen.",
        image: "https://img.miwuki.com/a/D2CGUZ/500",
        url: "http://protectoraosbiosbardos.org/ficha-583",
        collaborator: "Os biosbardos",
        interest: interests[1]),
    Request.name(
        title: "Apadrina una colmena",
        content:
            "A cambio de 50 euros al año el padrino podrá realizar visitas guiadas a su colmena para poder conocer de primera mano el proceso de elaboración de la miel mediante visitas guiadas y además aprovechar para degustar la propia miel de las colmenas apadrinadas, haciéndolos partícipes de este proceso. Recibirán 3 Kg de miel elaborada en sus propias colmenas. ",
        image: "https://image.freepik.com/foto-gratis/foto-macra-colmena-abeja-panal-copyspace-abejas-producen-miel-fresca-saludable_168410-77.jpg",
        url: "https://www.cope.es/emisoras/galicia/pontevedra-provincia/vigo/noticias/apadrina-una-colmena-proyecto-muy-dulce-que-pone-marcha-apicultor-rosal-pontevedra-20201028_967527",
        collaborator: "Mel Niño do Corvo",
        interest: interests[0]),
    Request.name(
        title: "Apadrina un campo abandonado",
        content:
        "Apadrinar huertos y beneficiarse de lo que produzca un terreno que otra persona cultivará. Los padrinos de Epona Terra aportarán para preparar terreros, comprar semillas y plantas para que puedan ser aprovechados por terceras personas que cuidarán los huertos.",
        image: "https://cflvdg.avoz.es/sc/SvQGYcN9--gD_vtRDSDRXrucAwU=/x/2020/05/13/00121589383802114411608/Foto/VY14C8F1_172924.jpg",
        url: "https://www.lavozdegalicia.es/noticia/vigo/vigo/2020/05/14/apadrina-campo-abandonado/0003_202005V14C8991.htm",
        collaborator: "Epona Terra",
        interest: interests[0]),
    Request.name(
        title: "Donar comida y otros productos veterinarios",
        content:
        "Necesitamos alimentos, medicamentos, juguetes, correas, collares y arneses, material sanitario, productos de limpieza... Si deseas hacer una donación, ponte en contacto con nosotros de Lunes a Viernes: Mañanas (10:00 a 13:30) Tardes (16:30 a 20:00): 600 356 891",
        image: "https://img.mundopmmi.com/files/base/pmmi/mundo/image/2019/08/foto_shutterstock.5d4977bae47f5.png?auto=format&w=1200",
        url: "http://protectoraosbiosbardos.org/s29/otras-maneras-de-colaborar",
        collaborator: "Os biosbardos",
        interest: interests[2]),
    Request.name(
        title: "Socio de protectora de animales",
        content:
        "La super población de perros que tenemos en este momento y los gastos veterinarios que han supuesto la recogida masiva de perros en estos tres últimos meses hacen que necesitemos tu ayuda. Puedes hacerte socio de la protectora OS BIOSBARDOS. También puedes colaborar económicamente de manera puntual con el Refugio de Ponteareas.",
        image: "https://d1kvlp4er3agpe.cloudfront.net/resources/images/groups/5/9/7/0/0/large_geutrcx2xv.jpg",
        url: "http://protectoraosbiosbardos.org/s29/otras-maneras-de-colaborar",
        collaborator: "Os biosbardos",
        interest: interests[2]),
    Request.name(
        title: "Socio de protectora de animales",
        content:
        "La super población de perros que tenemos en este momento y los gastos veterinarios que han supuesto la recogida masiva de perros en estos tres últimos meses hacen que necesitemos tu ayuda. Puedes hacerte socio de la protectora OS BIOSBARDOS. También puedes colaborar económicamente de manera puntual con el Refugio de Ponteareas.",
        image: "https://d1kvlp4er3agpe.cloudfront.net/resources/images/groups/5/9/7/0/0/large_geutrcx2xv.jpg",
        url: "http://protectoraosbiosbardos.org/s29/otras-maneras-de-colaborar",
        collaborator: "Os biosbardos",
        interest: interests[3]),
  ];
}

/*
Lo que una ONG busca, ejemplo, adoptar a este perro
* */
List<Interest> generateDataInterests() {
  return [
    Interest.name(0, "Apadrinar", Colors.greenAccent, "Quiero apadrinar"),
    Interest.name(1, "Adoptar", Colors.lightBlue, "Quiero adoptar"),
    Interest.name(
        2, "Hacer donativo", Colors.lightGreen, "Quiero hacer un donativo"),
    Interest.name(3, "Asociarse", Colors.tealAccent, "Quiero asociarme"),
    Interest.name(4, "Acompañar", Colors.teal, "Quiero acompañar"),
    Interest.name(5, "Participar", Colors.lightBlueAccent, "Quiero participar"),
    Interest.name(6, "Ser voluntario o empleado", Colors.lightGreenAccent,
        "Quiero ser voluntario o empleado"),
  ];
}
