import 'package:socialhack/models/interest.dart';
import 'package:socialhack/models/request.dart';

/*
Lo que una ONG busca, ejemplo, adoptar a este perro
* */
List<Request> generateData() {
  return [
    Request.name("Adopta un perro", "content", ""),
    Request.name("Búsqueda de fondos solidaria", "content", ""),
    Request.name("Se busca recursos para hospitales", "content", ""),
    Request.name("Apadrina un abuelo", "content", "")
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
