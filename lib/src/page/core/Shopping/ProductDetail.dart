import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:e_commerce/src/model/entity/EntityMap/SellersGroundModule.dart';
import 'package:e_commerce/src/page/core/Shopping/ShoppingPage.dart';
import 'package:e_commerce/src/widget/general/GeneralWidget.dart';
import 'package:e_commerce/src/widget/general/OpenWebWidget.dart';
import 'package:e_commerce/src/widget/general/SharedWidget.dart';

import 'package:intl/intl.dart';

class ProductDetail extends StatefulWidget {
  SellersGroundModule sellersGroundModule;

  ProductDetail(@required sellers) {
    this.sellersGroundModule = sellers;
  }

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        /*
        bottomNavigationBar: Container(
          color: Theme.of(context).backgroundColor,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 11,
          child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: Colors.black12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      child: Divider(
                        color: Colors.black26,
                        height: 4,
                      ),
                      height: 24,
                    ),
                    Text(
                      NumberFormat.simpleCurrency(name: 'BOB')
                          .format(widget.sellersGroundModule.price),
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                  ],
                ),
//
                SizedBox(
                  width: 6,
                ),
              ],
            ),
          ),
        ),
        */
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                actions: <Widget>[
                  /* Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  Stack(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.markunread),
                        color: Colors.black,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  */
                ],
                iconTheme: IconThemeData(
                  color: Colors.black, //change your color here
                ),
                backgroundColor: Colors.white,
                expandedHeight: 250,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      widget.sellersGroundModule.nameProduct,
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 16.0,
                      ),
                    ),
                    background: Padding(
                      padding: EdgeInsets.only(top: 18.0),
                      child: Container(
                        height: 120,
                        width: double.infinity,
                        child: Image.network(widget.sellersGroundModule.image),
                      ),
                    )),
              ),
            ];
          },
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              InkWell(
                                child: FaIcon(
                                  FontAwesomeIcons.video,
                                  color: Colors.green,
                                  size: 25,
                                ),
                                onTap: () {
                                  openWeb(
                                      'https://www.youtube.com/watch?v=TAtVhOgE5xE');
                                },
                              ),
                              InkWell(
                                child: FaIcon(
                                  FontAwesomeIcons.filePdf,
                                  color: Colors.green,
                                  size: 25,
                                ),
                                onTap: () {
                                  openWeb(
                                      'http://www.terrasurecoaventura.com/document/terrasur2.pdf');
                                },
                              ),
                              InkWell(
                                child: FaIcon(
                                  FontAwesomeIcons.shareAlt,
                                  color: Colors.green,
                                  size: 25,
                                ),
                                onTap: () {
                                  sharedText(
                                      'Comparte el lote de terreno',
                                      'Visitanos y conoce el terreno ubicado en ' +
                                          widget.sellersGroundModule
                                              .locationProduct +
                                          ' con un sup. de ' +
                                          widget.sellersGroundModule.meters
                                              .toString() +
                                          ' a ' +
                                          NumberFormat.simpleCurrency(
                                                  name: 'BOB')
                                              .format(widget
                                                  .sellersGroundModule.price) +
                                          ' comunicate con nosotros a nuestra página en Facebook ' +
                                          'https://www.facebook.com/TerrasurBolivia/',
                                      'text/html');
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  width: 130,
                                  child: Text(
                                    "Precio",
                                    style: TextStyle(fontSize: 25),
                                  )),
                              SizedBox(
                                width: 48,
                              ),
                              Text(
                                NumberFormat.simpleCurrency(name: 'BOB')
                                    .format(widget.sellersGroundModule.price),
                                style: TextStyle(
                                    fontSize: 25, color: Colors.green),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(width: 130, child: Text("Ubicado en")),
                              SizedBox(
                                width: 48,
                              ),
                              Text(widget.sellersGroundModule.locationProduct),
                            ],
                          ),
                          divider(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Descripcion del terreno',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(widget.sellersGroundModule.detailProduct),
                            ],
                          ),
                          divider(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Ubicación',
                                style: TextStyle(fontSize: 20),
                              ),
                              Center(
                                child: Image.network(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRW-9PEq9vcnt-w5V2Z0bAIx9Sqf3e6asPR2Q&usqp=CAU',
                                  height: 250,
                                ),
                              )
                            ],
                          ),
                          divider(),
                          Text(
                            'Galería de fotos',
                            style: TextStyle(fontSize: 20),
                          ),
                          multimedia(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        /*
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 420,
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      'https://cdn.pixabay.com/photo/2017/01/06/17/49/honey-1958464__340.jpg',
                      fit: BoxFit.cover,
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text('Nombre del producto',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            )),
                        Text(
                            'Detalle del producto seleccionado ademas del nombre del producto',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(
                  'Sonof T1 EU AC90V-250V Smart WIFI wall Touch Ligth Switch 6 celdas para Laptop Dell XPS 15 9560',
                  maxLines: 2,
                  minFontSize: 15.0,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AutoSizeText(
                    NumberFormat.simpleCurrency(name: 'BOB').format(71.7),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    maxLines: 2,
                    minFontSize: 15.0,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              GFAccordion(
                  title: 'Acerca del producto',
                  content:
                      'GetFlutter is an open source library that comes with pre-build 1000+ UI components.',
                  collapsedIcon: Icon(Icons.add),
                  expandedIcon: Icon(Icons.minimize)),
              GFAccordion(
                  title: 'Descripción del producto',
                  content:
                      'GetFlutter is an open source library that comes with pre-build 1000+ UI components.'
                      'GetFlutter is an open source library that comes with pre-build 1000+ UI components.'
                      'GetFlutter is an open source library that comes with pre-build 1000+ UI components.'
                      'GetFlutter is an open source library that comes with pre-build 1000+ UI components.',
                  collapsedIcon: Icon(Icons.add),
                  expandedIcon: Icon(Icons.minimize))
            ],
          ),
        ),
        */
      ),
    );
  }

  Widget multimedia() {
    final List<CardMostWanted> imageList = [
      CardMostWanted(
          'https://cdn2.infocasas.com.uy/repo/img/5a6c7ca64b7f3_img-20180125-wa0058-1.jpg.th460.jpg',
          '',
          ''),
      CardMostWanted(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcShqXra2FqZU0AK8SR1hphQKtVERJZHW1wRoQ&usqp=CAU',
          '',
          ''),
      CardMostWanted(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQK7_tTbHfvvd22tkycp5cBkqtHcEu8c7vB-A&usqp=CAU',
          '',
          '')
    ];

    return GFCarousel(
      autoPlay: true,
      autoPlayCurve: Curves.fastOutSlowIn,
      enableInfiniteScroll: true,
      passiveIndicator: Colors.white,
      activeIndicator: Colors.blueAccent,
      pagerSize: 7,
      pagination: true,
      items: imageList.map(
        (cardMostWanted) {
          return Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(2.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Image.network(
                    cardMostWanted.url,
                    fit: BoxFit.cover,
                    width: 500.0,
                    height: 200,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      cardMostWanted.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 30),
                    ),
                  ),
                  Center(
                    child: Text(
                      cardMostWanted.subtitle,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                  ),
                  Center(
                    child: Text(
                      cardMostWanted.subtitle,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                  )
                ],
              ),
            ],
          );
        },
      ).toList(),
      onPageChanged: (index) {
        setState(() {
          index;
        });
      },
    );
  }
}
