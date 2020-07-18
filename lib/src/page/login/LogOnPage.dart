import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:impulse/src/page/general/ViewPage.dart';
import 'package:impulse/src/page/intro/IntroPage.dart';
import 'package:impulse/src/page/login/LoginClipperPage.dart';
import 'package:impulse/src/theme/Theme.dart';
import 'package:impulse/src/widget/general/CallWidget.dart';
import 'package:impulse/src/widget/general/GeneralWidget.dart';
import 'package:impulse/src/widget/general/OpenWebWidget.dart';
import 'package:impulse/src/widget/general/SenWidget.dart';
import 'package:page_transition/page_transition.dart';

class LogOnPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(),
            Image.asset(
              "assets/image/babycare1.jpg",
              fit: BoxFit.cover,
              height: size.height * 0.70,
              width: size.width,
            ),
            Positioned(
              bottom: 0,
              child: ClipPath(
                clipper: LoginCustomClipper(),
                child: _buttonsSignUp(size, context),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buttonsSignUp(Size size, BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 80),
      height: size.height * 0.5,
      width: size.width,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Bienvenido a Impulse",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.w500),
          ),
          _gmailButton(),
          //   _facebookButton(context),
          //_emailButton(context),
          _button(context, 'Visita Impulse', 18.0, 20.0),
          _twitterEvelopeButtons(context),
          sizedBox(0.0, 8.0),
          _egree(context),
          copyRigth(),
        ],
      ),
    );
  }

  Widget _gmailButton() {
    return OutlineButton(
      splashColor: Colors.black,
      onPressed: () {}, // handleSignIn, // _handleSignIn,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"), height: 20.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Iniciar con Google',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row _twitterEvelopeButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 40,
          height: 40,
          child: RaisedButton(
            color: Colors.blueAccent,
            padding: EdgeInsets.all(0),
            shape: CircleBorder(),
            onPressed: () {
              ViewPage(
                  title: 'Facebook - Impulse',
                  url: 'https://www.facebook.com/Impulse.Bo/');
            },
            child: Icon(
              FontAwesomeIcons.facebookF,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 40,
          height: 40,
          child: RaisedButton(
            color: Colors.red,
            padding: EdgeInsets.all(0),
            shape: CircleBorder(),
            onPressed: () {
              ViewPage(
                  title: 'Instagram - Impulse',
                  url: 'https://www.instagram.com/impulse_oficial/');
            },
            child: Icon(
              FontAwesomeIcons.instagram,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 40,
          height: 40,
          child: RaisedButton(
            color: Colors.green,
            padding: EdgeInsets.all(0),
            shape: CircleBorder(),
            onPressed: () {
              callWhatsAppText(61677470,
                  '*Amigos Impulse:* \nSoy un cliente, me gustaría ponerme en contacto con uds. \nEnviado desde la aplicación \n*Impulse Digital*.');
            },
            child: Icon(
              FontAwesomeIcons.whatsapp,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 40,
          height: 40,
          child: RaisedButton(
            color: Colors.grey,
            padding: EdgeInsets.all(0),
            shape: CircleBorder(),
            onPressed: () {
              sendEmailAdvanced(
                  'info@impulse.bo',
                  "Impluse - Consulta para la compra de catálogo",
                  "Amigos de Impulse: \nDeseo saber sobre las promociones y vanta de catálogos. \nFavor su colaboración. Gracias");
            },
            child: Icon(
              FontAwesomeIcons.solidEnvelope,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }

  _egree(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            child: Text('Política de Privacidad'),
            onPressed: () => Navigator.push(
              context,
              PageTransition(
                curve: Curves.bounceOut,
                type: PageTransitionType.rotate,
                alignment: Alignment.topCenter,
                child: ViewPage(
                    title: 'Políticas de Privacidad',
                    url: 'https://www.impulse.bo/politicas-de-privacidad'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _button(
      BuildContext context, String text, double fontSize, double edgeInsets) {
    return GFButton(
      padding: EdgeInsets.symmetric(horizontal: edgeInsets),
      text: text,
      textStyle: TextStyle(fontSize: fontSize),
      textColor: AppTheme.themeWhite,
      color: AppTheme.themeGrey,
      icon: FaIcon(FontAwesomeIcons.checkCircle, color: AppTheme.themeWhite),
      shape: GFButtonShape.pills,
      onPressed: () => navegation(context, IntroPage()),
    );
  }
}
