import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:impulse/src/theme/Theme.dart';
//import 'package:impulse/src/style/Style.dart' as style;

class GeneralWidget {
  GeneralWidget._();

  // Widget crearFondo(BuildContext context, String imagen) {
  //   final size = MediaQuery.of(context).size;

  //   final fondoModaro = Container(
  //     height: size.height * 0.40,
  //     width: double.infinity,
  //     decoration: BoxDecoration(
  //         gradient: LinearGradient(
  //       // begin: Alignment.topCenter,
  //       // end: Alignment.bottomRight,
  //       // stops: [1.0, 1.0, 1.0, 1.0],
  //       colors: [
  //         Color.fromRGBO(174, 214, 241, 1.0),
  //         Color.fromRGBO(174, 214, 241, 1.0),
  //         Color.fromRGBO(174, 214, 241, 1.0),
  //         Color.fromRGBO(174, 214, 241, 1.0),
  //       ],
  //     )),
  //   );

  //   return Stack(
  //     children: <Widget>[
  //       fondoModaro,
  //       ImageOpaqueNetworkCustomize(
  //           'http://res.cloudinary.com/propia/image/upload/v1592167496/djsbl74vjdwtso6zrst7.jpg',
  //           AppTheme.themeVino,
  //           Size(MediaQuery.of(context).size.width, 310),
  //           0.68,
  //           BoxFit.cover),
  //       Container(
  //         padding: EdgeInsets.only(top: 32.0),
  //         child: Column(
  //           children: <Widget>[
  //             Align(
  //               child: RadialProgress(
  //                 width: 3,
  //                 goalCompleted: 0.90,
  //                 progressColor: AppTheme.themeVino,
  //                 progressBackgroundColor: Colors.white,
  //                 child: Container(
  //                     child: ImageOvalNetwork(
  //                         imageNetworkUrl: imagen,
  //                         sizeImage: Size.fromWidth(90))),
  //               ),
  //             ),
  //           ],
  //         ),
  //       )
  //     ],
  //   );
  // }

  boxDecoration() {
    return BoxDecoration(
        gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomRight,
      stops: [0.1, 0.4, 0.7, 0.9],
      colors: [
        AppTheme.themeVino,
        AppTheme.themeVino,
        AppTheme.themeVino,
        AppTheme.themeVino,
      ],
    ));
  }

  boxDecorationAccesos() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
          stops: [0.1, 0.4, 0.7],
          colors: [
            Color.fromRGBO(231, 233, 227, 0.6),
            Color.fromRGBO(225, 226, 223, 1.0),
            Color.fromRGBO(221, 221, 220, 0.6),
          ],
        ));
  }

  boxDecorationFondo() {
    return BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            stops: [
              0.6,
              0.4,
              0.7
            ],
            colors: [
              Colors.white, Colors.white, Colors.white,
              // Color.fromRGBO(252, 252, 252, 1.0),
              //  Color.fromRGBO(251, 251, 251, 1.0),
            ]),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black26,
              blurRadius: 7.0,
              offset: Offset(2.0, 3.0),
              spreadRadius: 4.0)
        ]);
  }

  boxDecorationList() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black12,
              blurRadius: 7.0,
              offset: Offset(2.0, 3.0),
              spreadRadius: 4.0)
        ]);
  }

  BoxDecoration contenedorCabecera() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black26,
              blurRadius: 7.0,
              offset: Offset(2.0, 2.0),
              spreadRadius: 4.0)
        ]);
  }

  BoxDecoration contenedorCampos() {
    // return boxDecorationList();
    return BoxDecoration(
        color: Colors.white,
        // gradient: boxDecorationList(),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black26,
              blurRadius: 7.0,
              offset: Offset(2.0, 3.0),
              spreadRadius: 4.0)
        ]);
  }

  BoxDecoration contenedorCarretes() {
    return BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black26,
              blurRadius: 7.0,
              offset: Offset(2.0, 3.0),
              spreadRadius: 4.0)
        ]);
  }

  Container contenedorTitulo(
      BuildContext context, double height, String text, FaIcon icon) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.94,
      height: height,
      decoration: BoxDecoration(
          // color: AppTheme.themeVino,
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              stops: [
                0.1,
                0.4,
                0.7
              ],
              colors: [
                Color.fromRGBO(244, 245, 243, 1.0),
                Color.fromRGBO(247, 247, 247, 1.0),
                Color.fromRGBO(244, 245, 243, 1.0),
              ]),
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 7.0,
                offset: Offset(2.0, 3.0),
                spreadRadius: 4.0)
          ]),
      child: Row(
        children: <Widget>[
          SizedBox(width: 10.0),
          icon,
          SizedBox(width: 15.0),
          Text(text,
              style: TextStyle(
                color: AppTheme.themeVino, //Colors.white70,
                fontSize: 16.0,
                height: 1.5,
              )),
        ],
      ),
    );
  }

  Container contenedorSubTitulo(
      BuildContext context, double height, String text, FaIcon icon) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.92,
      height: height,
      decoration: BoxDecoration(
          color: AppTheme.themeVino,
          //     gradient:LinearGradient(
          // begin: Alignment.topCenter,
          // end: Alignment.bottomRight,
          // stops: [0.1, 0.4, 0.7],
          // colors: [
          //   Color.fromRGBO(244, 245, 243, 1.0),
          //   Color.fromRGBO(247, 247, 247, 1.0),
          //    Color.fromRGBO(244, 245, 243, 1.0),

          //  ]),
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 7.0,
                offset: Offset(2.0, 3.0),
                spreadRadius: 4.0)
          ]),
      child: Row(
        children: <Widget>[
          SizedBox(width: 10.0),
          icon,
          SizedBox(width: 15.0),
          Text(text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                height: 1.5,
              )),
        ],
      ),
    );
  }

  Widget fondoApp() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: boxDecorationFondo(), //(),//boxDecorationAccesos(),
    );
  }

  Divider divider() {
    return Divider(
      thickness: 1.5,
      color: AppTheme.themeVino,
      endIndent: 20.0,
      indent: 20.0,
    );
  }

  SizedBox sizedBox(double ancho, double alto) {
    return SizedBox(
      width: ancho,
      height: alto,
    );
  }
}
