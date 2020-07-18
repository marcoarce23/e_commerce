import 'dart:io';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:e_commerce/src/model/Const.dart';

import 'package:e_commerce/src/model/Preference.dart';
import 'package:e_commerce/src/page/core/Shopping/CardSellers.dart';
import 'package:e_commerce/src/page/core/Shopping/ShoppingPage.dart';
import 'package:e_commerce/src/page/core/category/CategoryPage.dart';
import 'package:e_commerce/src/page/core/foldable/FoldablePage.dart';
import 'package:e_commerce/src/page/faq/FaqPage.dart';
import 'package:e_commerce/src/page/general/ViewPage.dart';
import 'package:e_commerce/src/page/image/ImagePanoramaPage.dart';
import 'package:e_commerce/src/page/people/ClientListPage.dart';
import 'package:e_commerce/src/style/Style.dart';
import 'package:e_commerce/src/theme/Theme.dart';
import 'package:e_commerce/src/widget/drawer/DrawerWidget.dart';
import 'package:e_commerce/src/widget/general/OpenWebWidget.dart';
import 'package:e_commerce/src/widget/image/ImageWidget.dart';

class HomePage extends StatefulWidget {
  static final String routeName = 'home';
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final prefs = new Preferense();
  //final generic = new Generic();
  int _selectedIndex = 0;
  int valorExpedido = 60;
  File photo;

  @override
  void initState() {
    // generic.add(
    //     new TokenImei(
    //         correo1: prefs.correoElectronico,
    //         imei: prefs.imei,
    //         token: prefs.token),
    //     urlAddTokenImei);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    prefs.lastPage = HomePage.routeName;
    return SafeArea(
      left: true,
      right: true,
      bottom: true,
      top: true,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            toolbarOpacity: 0.7,
            iconTheme: IconThemeData(color: AppTheme.themeGrey, size: 12),
            elevation: 0,
            title: Row(
              children: <Widget>[
                Text("CATALOGO - e_commerce.", style: kTitleAppBar),
                // SizedBox(width: 10.0),
                FaIcon(
                  FontAwesomeIcons.handshake,
                  color: AppTheme.themeGrey,
                  size: 18,
                ),
              ],
            )),
        body: metodoHome(),
        drawer: DrawerMenu(), // drawer(context),
        bottomNavigationBar: _bottomNavigationBar(context),
      ),
    );
  }

  Widget metodoHome() {
    return Stack(
      children: <Widget>[
        //  fondoApp(),

        SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[],
                  ),
                ),
                //  _crearExpedido(),
                showPicture(photo, imgDefault, 130.0),
                _botonesRedondeados(),

                FlatButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  splashColor: Colors.white,
                  onPressed: () {
                    openWeb('https://chat.whatsapp.com/GULRUC5BCdF7zwenMxLnDy');
                  },
                  child: Text("WhatsApp Gerente de Ventas"),
                ),

                FlatButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  splashColor: Colors.white,
                  onPressed: () {
                    openWeb('https://chat.whatsapp.com/GULRUC5BCdF7zwenMxLnDy');
                  },
                  child: Text("WhatsApp Gerente Marketing"),
                ),

                Text(
                  'versión 1.0.0',
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (_selectedIndex == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FaqPage()),
        );
      }

      if (_selectedIndex == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CardSellers()),
        );
      }
      if (_selectedIndex == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    });
  }

  // List<DropdownMenuItem<String>> getDropDown(AsyncSnapshot snapshot) {
  //   List<DropdownMenuItem<String>> lista = new List();

  //   for (var i = 0; i < snapshot.data.length; i++) {
  //     GetClasificador item = snapshot.data[i];
  //     lista.add(DropdownMenuItem(
  //       child: Text(item.detalle),
  //       value: item.id.toString(),
  //     ));
  //   }
  //   return lista;
  // }

  Widget texto() {
    if (int.parse(prefs.idPersonal) > 0) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: AutoSizeText(
          'Ud. esta brindando atención en el Departamento de xxxx. Si desea cambiar seleccione nuevamente.',
          style: kSubTitleCardStyle,
          maxLines: 3,
          minFontSize: 15.0,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.justify,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: AutoSizeText(
          'Si desea brindar ayuda o recibirla seleccione el departamento.',
          style: kSubTitleCardStyle,
          maxLines: 2,
          minFontSize: 15.0,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.justify,
        ),
      );
    }
  }

  // Widget _crearExpedido() {
  //   return Center(
  //       child: FutureBuilder(
  //           future: generic.getAll(new GetClasificador(), urlGetDepartamento,
  //               primaryKeyGetDepartamento),
  //           builder: (context, AsyncSnapshot snapshot) {
  //             if (snapshot.hasData) {
  //               return Column(
  //                 children: <Widget>[
  //                   texto(),

  //                   Row(
  //                     children: <Widget>[
  //                       SizedBox(width: 10.0),
  //                       Text(
  //                         'Departamentos habilitados:',
  //                         style: kSigssTitleStyle,
  //                       ),
  //                       DropdownButton(
  //                         icon: FaIcon(FontAwesomeIcons.angleDown,
  //                             color: AppTheme.themeVino),
  //                         value: valorExpedido.toString(), //valor
  //                         items: getDropDown(snapshot),
  //                         onChanged: (value) {
  //                           setState(() {
  //                             valorExpedido = int.parse(value);
  //                             prefs.idDepartamento = valorExpedido;
  //                             //  prefs.departamento = child;
  //                           });
  //                         },
  //                       ),
  //                     ],
  //                   ),
  //                   // SizedBox(width: 15.0),
  //                 ],
  //               );
  //             } else {
  //               return CircularProgressIndicator();
  //             }
  //           }));
  // }

  Widget _bottomNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          canvasColor: Colors
              .white, //AppTheme.themeVino, //Color.fromRGBO(55, 57, 84, 1.0),
          primaryColor: AppTheme.themeDefault,
          textTheme: Theme.of(context)
              .textTheme
              .copyWith(caption: TextStyle(color: Colors.black45))),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_phone,
                  size: 20.0, color: AppTheme.themeDefault),
              title: Text('Preguntas')),
          BottomNavigationBarItem(
              icon: Icon(Icons.event_available,
                  size: 20.0, color: AppTheme.themeDefault),
              title: Text('Promociones')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.ondemand_video,
                size: 20.0,
                color: AppTheme.themeDefault,
              ),
              title: Text('Multimedia')),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _botonesRedondeados() {
    return Wrap(children: <Widget>[
      _crearBotonRedondeado(
          Colors.purpleAccent,
          FaIcon(FontAwesomeIcons.fileImage, color: Colors.white, size: 35.0),
          'Catálogos',
          '2',
          16.0,
          CardSellers(),
          0,
          ""),
      _crearBotonRedondeado(
          Colors.blue,
          FaIcon(FontAwesomeIcons.home, color: Colors.white, size: 35.0),
          'Productos',
          '1',
          14.0,
          ShoppingPage(),
          0,
          ""),
      _crearBotonRedondeado(
          Colors.pinkAccent,
          FaIcon(FontAwesomeIcons.image, color: Colors.white, size: 35.0),
          'Album de Servicios',
          '3',
          14.0,
          CategoyPage(),
          0,
          ""),
      _crearBotonRedondeado(
          Colors.deepPurple,
          FaIcon(FontAwesomeIcons.userTie, color: Colors.white, size: 40.0),
          'Clientes',
          '5',
          15.0,
          ClientListPage(),
          0,
          ""),
      _crearBotonRedondeado(
          Colors.deepPurple,
          FaIcon(FontAwesomeIcons.store, color: Colors.white, size: 40.0),
          '360°',
          '6',
          15.0,
          ImapePanoramaPage(),
          0,
          ""),

      _crearBotonRedondeado(
          Colors.green,
          FaIcon(FontAwesomeIcons.gratipay, color: Colors.white, size: 35.0),
          'Mis Favoritos',
          '6',
          16.0,
          FoldablePage(),
          0,
          ""),
      // _crearBotonRedondeado(
      //     Colors.deepPurple,
      //     FaIcon(FontAwesomeIcons.viber, color: Colors.white, size: 40.0),
      //     'Números de urgencia',
      //     '5',
      //     15.0,
      //     HomePage(),
      //     0,
      //     ""),
      // _crearBotonRedondeado(
      //     Colors.cyan,
      //     FaIcon(FontAwesomeIcons.tty, color: Colors.white, size: 38.0),
      //     'Violencia IntraFamiliar',
      //     '6',
      //     14.0,
      //     HomePage(),
      //     0,
      //     ""),
    ]);
  }

  Widget _crearBotonRedondeado(Color color, FaIcon icono, String texto,
      String valor, double size, Widget widget, int acceso, String link) {
    return InkWell(
      onTap: () {
        if (acceso == 1) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ViewPage(title: 'TEST DE PRUEBA', url: link)));
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget),
          );
        }
      },
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            height: 87.0,
            width: 160,
            margin: EdgeInsets.all(9.0),
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                AppTheme.themeColorNaranja,
                AppTheme.themeColorNaranja,
                AppTheme.themeColorNaranja,
                AppTheme.themeColorVerde,
              ],
            )),
            //  borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(height: 5.0),
                CircleAvatar(
                  backgroundColor: color,
                  radius: 30.0,
                  child: icono,
                  //Icon(icono, color: Colors.white, size: 42.0),
                ),
                Text(texto,
                    style: TextStyle(color: AppTheme.white, fontSize: size)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
