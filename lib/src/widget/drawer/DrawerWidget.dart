import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/src/model/Const.dart';
import 'package:e_commerce/src/model/Preference.dart';
import 'package:e_commerce/src/page/core/album/AlbumLoadPage.dart';
import 'package:e_commerce/src/page/core/album/AlbumPage.dart';
import 'package:e_commerce/src/page/core/catalog/CatalogLoadPage.dart';
import 'package:e_commerce/src/page/core/foldable/FoldablePage.dart';
import 'package:e_commerce/src/page/core/product/LoadProductPage.dart';
import 'package:e_commerce/src/page/intro/IntroPage.dart';
import 'package:e_commerce/src/page/login/LogOnPage.dart';
import 'package:e_commerce/src/page/login/LoginPage.dart';
import 'package:e_commerce/src/page/notification/NotificationLocalPage.dart';
import 'package:e_commerce/src/page/organization/OrganizationPage.dart';
import 'package:e_commerce/src/page/people/ClientPage.dart';
import 'package:e_commerce/src/theme/Theme.dart';
import 'package:e_commerce/src/widget/general/GeneralWidget.dart';
import 'package:e_commerce/src/widget/general/SharedWidget.dart';
import 'package:e_commerce/src/widget/image/imageOval.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14.0, 0, 14.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey))),
        child: InkWell(
          splashColor: Colors.orange,
          onTap: onTap,
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(children: <Widget>[
                  Icon(icon),
                  Text(
                    text,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ]),
                Icon(Icons.arrow_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerMenu extends StatelessWidget {
  final prefs = new Preferense();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        DrawerHeader(
          decoration: boxDecorationMenu(),
          child: Container(
              child: Column(
            children: <Widget>[
              Material(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  elevation: 60.0,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ImageOvalNetwork(
                        imageNetworkUrl: imgLogo,
                        sizeImage: Size.fromWidth(70)),
                  )),
              Flexible(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        'Marcelo Sanchez', //prefs.nameUser,
                        style: TextStyle(
                            color: AppTheme.themeWhite, fontSize: 18.0),
                        softWrap: true,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    AutoSizeText(
                      'marcelo.sanchez@gmail.com', //;prefs.email,
                      style:
                          TextStyle(color: AppTheme.themeWhite, fontSize: 16.0),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ],
          )),
        ),
        CustomListTile(
            Icons.notification_important,
            '   Notificaciones importantes',
            () => navegation(context, NotificationLocalPage())),
        CustomListTile(Icons.add_photo_alternate, '    Album de servicios',
            () => navegation(context, LoginPage())),
        CustomListTile(Icons.card_giftcard, '   Muestra tus Catálogos',
            () => navegation(context, AlbumFlowPage())),
        CustomListTile(Icons.art_track, '   Muestra Servicios Exclusivos',
            () => navegation(context, IntroPage())),

        CustomListTile(Icons.favorite, '   Mis proyecciones',
            () => navegation(context, FoldablePage())),
        CustomListTile(Icons.person_add, '   Mis Clientes',
            () => navegation(context, ClientAllPage())),
        CustomListTile(Icons.shop, '   Crear Catálogos',
            () => navegation(context, CatalogAllPage())),
        CustomListTile(Icons.shop, '   Crear Productos',
            () => navegation(context, ProductAllPage())),
        CustomListTile(Icons.import_contacts, '   Crear Album de Fotos',
            () => navegation(context, AlbumAllPage())),
        CustomListTile(Icons.supervised_user_circle, '    Sobre nosotros',
            () => navegation(context, OrganizationPage())),
        CustomListTile(
            Icons.share,
            '    Comparte la aplicación',
            () => sharedText(
                'Comparte la App - Terrasur',
                '🔺*e_commerce*🔺 \n Una aplicación de ventas por catálogo virtual.\n💬Atención *CATALOGO VIRTUAL* personalizada. \n 📲 Puede descargar la app desde: https://play.google.com/store/apps/details?id=bo.e_commerceBolivia',
                'text/html')),
        CustomListTile(Icons.settings, '    Configuración',
            () => navegation(context, LoginPage())),
        // CustomListTile(Icons.add_to_home_screen, '   Acerca de la aplicación',
        //     () => navegation(context, IntroPage())),
        CustomListTile(Icons.exit_to_app, '    Cerrar Sesión',
            () => navegation(context, LogOnPage())),
      ],
    ));
  }
}
