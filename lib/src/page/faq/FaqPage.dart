import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:e_commerce/src/page/home/HomePage.dart';
import 'package:e_commerce/src/style/Style.dart';
import 'package:e_commerce/src/theme/Theme.dart';
import 'package:e_commerce/src/widget/drawer/DrawerWidget.dart';
import 'package:e_commerce/src/widget/general/GeneralWidget.dart';
import 'package:e_commerce/src/widget/gfWidget/GfWidget.dart';

class FaqPage extends StatefulWidget {
  FaqPage({Key key}) : super(key: key);

  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  File photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarOpacity: 0.7,
        iconTheme: IconThemeData(color: AppTheme.themeBlackGrey, size: 12),
        elevation: 0,
        title: Text("ALGUNA PREGUNTA?", style: kTitleAppBar),
      ),
      drawer: DrawerMenu(),
      body: Stack(
        children: <Widget>[
          _form(context),
        ],
      ),
      floatingActionButton: floatButton(AppTheme.themeGrey, context,
          FaIcon(FontAwesomeIcons.home), HomePage()),
    );
  }

  Widget _form(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          sizedBox(0.0, 15.0),
          Container(
            width: size.width * 0.96,
            margin: EdgeInsets.symmetric(vertical: 0.0),
            decoration: containerImage(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[],
            ),
          ),
          sizedBox(0.0, 10.0),
          Container(
            width: size.width * 0.96,
            margin: EdgeInsets.symmetric(vertical: 0.0),
            child: _fields(context),
          ),
          copyRigth(),
        ],
      ),
    );
  }

  Widget _fields(BuildContext context) {
    return Column(
      children: <Widget>[
        sizedBox(0.0, 7.0),
        //   showPicture(photo, '', 130.0),
        //divider(),
        textSimple1(
            FaIcon(FontAwesomeIcons.storeAlt, color: AppTheme.themeGrey),
            'Preguntas Frecuentes',
            AppTheme.themeOrange),

        listAcordion(),
        listAcordion2(),
        listAcordion3(),
        listAcordion4(),
      ],
    );
  }

  Widget listAcordion() {
    return accordion(
        '¿Cómo puedo contactarlos?',
        'Contamos con distintos canales de atención, cualquier duda o consulta que tengas siéntete libre de preguntar mediante: \nNuestras redes sociales: Facebook Instagram \nCorreo electrónico info@e_commerce.bo \nNúmero de WhatsApp +591 61677470',
        AppTheme.themeGrey,
        AppTheme.themeOrange);
  }

  Widget listAcordion2() {
    return accordion(
        '¿Cuál es el horario de atención?',
        'Puedes contactarnos en cualquier momento, para recibir respuestas más inmediatas nuestro horario es el siguiente: 9:00 AM a 8 :00 PM de lunes a viernes.',
        AppTheme.themeGrey,
        AppTheme.themeOrange);
  }

  Widget listAcordion3() {
    return accordion(
        '¿Este es un sitio seguro?',
        'Ten la confianza de que tu información está siendo gestionada de la manera correcta y que este sitio web tiene los certificados de seguridad SSL correspondientes.',
        AppTheme.themeGrey,
        AppTheme.themeOrange);
  }

  Widget listAcordion4() {
    return accordion(
        '¿Cómo realizan el servicio de despacho?',
        'Los despachos los realizamos habiendo confirmado la información de los pedidos y realizado el empaque y procediendo de despacho hasta las 9:00 AM en días hábiles. Para que tu producto este seguro tenemos tres métodos de entrega:\nEntrega gratuita a domicilio para las principales ciudades del país.\nEntrega mediante oficinas FedEx de todo el país (si vive en una provincia o bien lo desee así).\nEntrega mediante las tiendas e_commerce.',
        AppTheme.themeGrey,
        AppTheme.themeOrange);
  }
}
