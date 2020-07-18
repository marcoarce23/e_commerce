import 'package:http/http.dart' as http;
import 'package:impulse/src/model/api/apiDelete.dart';
import 'package:impulse/src/provider/dataMap.dart';


class Removable {
  Future<Map<String, dynamic>> delete(int id) async {
    //print('Eliminarrrr: $url');
    final response = await http.post(ApiDelete().toString());
    dataMap(response);
    return dataMap(response);
  }
}
