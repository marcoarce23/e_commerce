import 'package:flutter/material.dart';

import 'package:e_commerce/src/bloc/Event/EventBloc.dart';
import 'package:e_commerce/src/bloc/login/LoginBloc.dart';
import 'package:e_commerce/src/bloc/product/ProductBloc.dart';

class Provider extends InheritedWidget {
  final _loginBloc = new LoginBloc();
  final _productBloc = new ProductBloc();
  final _eventBloc = new EventBloc();

  static Provider _instancia;

  factory Provider({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new Provider._internal(key: key, child: child);
    }

    return _instancia;
  }

  Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider)
        ._loginBloc;
  }

  static ProductBloc productosBloc(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider)
        ._productBloc;
  }

  static EventBloc eventBloc(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider)
        ._eventBloc;
  }
}
