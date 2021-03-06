import 'dart:async';
import 'package:e_commerce/src/provider/ApiUpdate.dart';
import 'package:e_commerce/src/model/entity/EntityMap.dart';
import 'package:e_commerce/src/model/entity/IEntity.dart';
import 'package:e_commerce/src/provider/event/ApiAdd.dart';
import 'package:e_commerce/src/bloc/util/validator.dart';
import 'package:e_commerce/src/provider/event/ApiDelete.dart';
import 'package:rxdart/rxdart.dart';

class EventBloc with Validators {
  final _controller = new BehaviorSubject<List<EventModel>>();
  final _loadingController = new BehaviorSubject<bool>();
  final _apiAdd = new ApiAddEvent();
  final _apiDelete = new ApiDeleteEvent();
  final _apiUpdate = new ApiUpdateEvent();

  Stream<List<EventModel>> get eventStream => _controller.stream;
  Stream<bool> get loading => _loadingController.stream;

  void getAll() async {
    // final productos = await _productosProvider.cargarProductos();
    // _productosController.sink.add(productos);
  }

  Future<Map<String, dynamic>> repository(IEntityMap entity) async {
    var result;

    _loadingController.sink.add(true);
    switch (entity.states) {
      case StateEntity.Insert:
        result = await _apiAdd.add(entity);
        break;
      case StateEntity.Delete:
        result = await _apiDelete.delete(entity);
        break;
      case StateEntity.Update:
        result = await _apiUpdate.update(entity);
        break;
      default:
    }
    _loadingController.sink.add(false);
    print('DEL VALOR DE EVENT BLOC: $result');
    return result;
  }

/*
  Future<Map<String, dynamic>> add(IEntityMap entity) async {
    var result;

    _loadingController.sink.add(true);
    result = await _apiAdd.add(entity);
    _loadingController.sink.add(false);

    print('DEL VALOR DE EVENT BLOC: $result');
    return result;
  }

  void delete(String id) async {
//    await _productosProvider.borrarProducto(id);
  }
*/
  dispose() {
    _controller?.close();
    _loadingController?.close();
  }
}
