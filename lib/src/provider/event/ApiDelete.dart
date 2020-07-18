import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:impulse/src/model/entity/IEntity.dart';
import 'package:impulse/src/provider/ApiResource.dart';
import 'package:impulse/src/provider/dataMap.dart';




class ApiDeleteEvent {
  Future<Map<String, dynamic>> delete(IEntityMap entity) async {
    String _body = json.encode(entity.toJson());
    print('body: $_body');
    final apiRest = eventResource['delete'][0].toString() ;// eventResourceAdd['add'][0].toString()   ;
    //RouteAdd().postEvent(); // METODO QUE OBTENFA EL POST DEL EVENTO; MULTIMEDIA, VOLUTNARIO; HORARIO
    print('url: $apiRest');
    final response = await http.post(apiRest,
        headers: {"Content-Type": "application/json"}, body: _body);
    return dataMap(response);
  }
} //FIN DE LA CLASE
