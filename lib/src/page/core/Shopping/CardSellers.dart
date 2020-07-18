import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:e_commerce/src/model/entity/EntityMap/SellersGroundModule.dart';
import 'package:e_commerce/src/widget/ranking/RankingWidget.dart';
import 'package:intl/intl.dart';

import 'ProductDetail.dart';

class CardSellers extends StatefulWidget {
  @override
  _CardSellersState createState() => _CardSellersState();
}

class _CardSellersState extends State<CardSellers> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
              child: Column(
        children: <Widget>[
          buildHeader(),
          listSellersGround(),
        ],
      ))),
    );
  }

  Widget buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, right: 10, left: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Catálogo',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 26,
                  color: Colors.black,
                ),
              ),
              Spacer(),
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: IconButton(
                  icon: Icon(
                    Icons.notifications_none,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget listSellersGround() {
    List<SellersGroundModule> listSellers = [
      SellersGroundModule(
          colorNews: Colors.green,
          descriptionNews: 'Disponible inmediatamente',
          nameProduct: 'Casa en villa pagador',
          detailProduct: 'Oferta por fin de mes',
          price: 25685,
          image:
              'https://cdn2.infocasas.com.uy/repo/img/fbb8adf396372ce4bb19c17f7ae3a8e3e19463a5.jpg.th460.jpg',
          discount: 20600,
          locationProduct: 'Cochabamba - Villa pagador',
          meters: 15686),
      SellersGroundModule(
          colorNews: Colors.greenAccent,
          descriptionNews: 'Disponible',
          nameProduct: 'Casa en villa Adela ',
          detailProduct: 'Oferta por fin de mes con saneamiento de los papeles',
          price: 35685,
          image:
              'https://cdn2.infocasas.com.uy/repo/img/5c2e23be35f8b_dsc_0780.jpg.th460.jpg',
          discount: 30600,
          locationProduct: 'Cochabamba - Villa adela',
          meters: 5686),
      SellersGroundModule(
          colorNews: Colors.green,
          descriptionNews: 'Disponible',
          nameProduct: 'Terreno en Venta en Zona Ex Fundo ',
          detailProduct:
              'Venta de Terrenos Amurallados al frente del complejo petrlero',
          price: 55685,
          image:
              'https://www.bienesonline.com/bolivia/photos/terreno-en-venta-achumani-TEV40811593017486-525.jpg',
          discount: 0,
          locationProduct: 'Cochabamba - Villa taquiña',
          meters: 1686),
    ];

    return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: listSellers.length,
          itemBuilder: (_, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
              child: tileSellersGround(listSellers[index])),
        ));
  }

  Widget tileSellersGround(SellersGroundModule sellersGroundModule) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetail(sellersGroundModule)),
            ),
            leading: Image.network(
              sellersGroundModule.image,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(sellersGroundModule.nameProduct),
                Text(
                  sellersGroundModule.locationProduct,
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(sellersGroundModule.detailProduct),
                Row(
                  children: <Widget>[
                    FaIcon(
                      FontAwesomeIcons.dollarSign,
                      color: Colors.orange,
                      size: 10,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(NumberFormat.simpleCurrency(name: 'BOB')
                        .format(sellersGroundModule.price)),
                  ],
                ),
                Row(
                  children: <Widget>[
                    FaIcon(
                      FontAwesomeIcons.solidBuilding,
                      color: Colors.orange,
                      size: 10,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(sellersGroundModule.meters.toString() + ' M2'),
                  ],
                ),
              ],
            ),
            trailing: Icon(Icons.more_vert),
            isThreeLine: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GFButton(
                size: 18,
                color: sellersGroundModule.colorNews,
                onPressed: () {},
                text: sellersGroundModule.descriptionNews,
                shape: GFButtonShape.pills,
              ),
              SizedBox(
                width: 10,
              ),
              RankingWidget(rating: 4.5, size: 20),
              FaIcon(
                FontAwesomeIcons.shareAlt,
                color: Colors.orange,
                size: 20,
              )
            ],
          )
        ],
      ),
    );
  }
}
