import 'package:flutter/material.dart';
import 'package:impulse/src/model/entity/EntityMap/CardSlideProduct.dart';
import 'package:impulse/src/model/entity/EntityMap/ListCategory.dart';
import 'package:impulse/src/widget/card/CardSlideProductWidget.dart';
import 'package:impulse/src/widget/general/GeneralWidget.dart';
import 'package:impulse/src/widget/gfWidget/GfWidget.dart';
import 'package:impulse/src/widget/ranking/RankingWidget.dart';
import 'dart:ui';
import 'package:vector_math/vector_math.dart' as vector;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';

import 'ProductDetail.dart';

class Shoe {
  final String name;
  final String image;
  final double price;
  final Color color;

  const Shoe({
    this.name,
    this.image,
    this.price,
    this.color,
  });
}

class ProductsRecentlyViewed {
  String _url;
  String _name;
  double _price;
  double _discount;

  get url {
    return this._url;
  }

  get name {
    return this._name;
  }

  get price {
    return this._price;
  }

  get discount {
    return this._discount;
  }

  ProductsRecentlyViewed(
      String url, String name, double price, double discount) {
    this._url = url;
    this._name = name;
    this._price = price;
    this._discount = discount;
  }
}

class CardMostWanted {
  String _url;
  String _title;
  String _subtitle;

  get url {
    return this._url;
  }

  get title {
    return this._title;
  }

  get subtitle {
    return this._subtitle;
  }

  CardMostWanted(String url, String title, String subtitle) {
    this._url = url;
    this._title = title;
    this._subtitle = subtitle;
  }
}

class CardCategorie {
  String _url;
  String _title;
  String _subtitle;

  get url {
    return this._url;
  }

  get title {
    return this._title;
  }

  get subtitle {
    return this._subtitle;
  }

  CardCategorie(String url, String title, String subtitle) {
    this._url = url;
    this._title = title;
    this._subtitle = subtitle;
  }
}

const shoes = [
  const Shoe(
      name: 'NIKE EPICT-REACT',
      price: 130.00,
      image: 'images/shoes/1.png',
      color: Color(0xFF5574b9)),
  const Shoe(
      name: 'NIKE AIR-MAX',
      price: 130.00,
      image: 'images/shoes/2.png',
      color: Color(0xFF52b8c3)),
  const Shoe(
      name: 'NIKE AIR-270',
      price: 150.00,
      image: 'images/shoes/3.png',
      color: Color(0xFFE3AD9B)),
  const Shoe(
      name: 'NIKE EPICT-REACTII',
      price: 160.00,
      image: 'images/shoes/4.png',
      color: Color(0xFF444547)),
];

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({Key key}) : super(key: key);

  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  final _pageController = PageController(viewportFraction: 0.78);
  final _pageNotifier = ValueNotifier(0.0);

  final marginCenter = EdgeInsets.symmetric(horizontal: 50, vertical: 15);

  void _listener() {
    _pageNotifier.value = _pageController.page;
    setState(() {});
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController.addListener(_listener);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_listener);
    _pageController.dispose();
    _pageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              buildHeader(),
              titleProductsOutstanding(),
              Container(height: 260, child: productsOutstanding(context)),
              titlePageCategories(),
              categories(context),
              listProductCategory(context),
              titleRecentlyViewed(),
              mostWanted(),
              listProduct()
            ],
          ),
        ),
      ),
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

  Widget titleProductsOutstanding() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Productos destacados',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          // InkWell(
          //   child: FaIcon(
          //     FontAwesomeIcons.filter,
          //     size: 10,
          //   ),
          //   onTap: () {},
          // )
        ],
      ),
    );
  }

  Widget productsOutstanding(BuildContext context) {
    List<CardSlideProduct> listCard = [
      new CardSlideProduct(
          colorBackGround: Color(0xFF5574b9),
          nameProduct: 'Zapatos',
          imageProduct:
              'https://i.pinimg.com/236x/20/51/eb/2051eb2b0cdd950ccd5f691cc81facbf.jpg',
          priceProduct: 563.5,
          discountProduct: 12.5,
          favorite: true),
      new CardSlideProduct(
          colorBackGround: Color(0xFF5554b9),
          nameProduct: 'Zapatos',
          imageProduct:
              'https://http2.mlstatic.com/zapatos-nike-air-max-360-dama-deportivos-colombianos-D_NQ_NP_633266-MLV41075134388_032020-F.jpg',
          priceProduct: 563.5,
          discountProduct: 12.5,
          favorite: true),
      new CardSlideProduct(
          colorBackGround: Color(0xFF5574b9),
          nameProduct: 'Zapatos',
          imageProduct:
              'https://i.pinimg.com/236x/20/51/eb/2051eb2b0cdd950ccd5f691cc81facbf.jpg',
          priceProduct: 563.5,
          discountProduct: 12.5,
          favorite: true),
    ];

    return CardSlideProductWidget(listCard);
  }

  Widget titlePageCategories() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'Categorias',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Esto te puede interesar',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Widget titleRecentlyViewed() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'Artículos vistos recientemente',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  Widget mostWanted() {
    final List<CardMostWanted> imageList = [
      CardMostWanted(
          'https://cdn.pixabay.com/photo/2016/03/09/09/22/workplace-1245776__340.jpg',
          'titulo1',
          'subtitulo 2'),
      CardMostWanted(
          'https://cdn.pixabay.com/photo/2016/03/09/09/22/workplace-1245776__340.jpg',
          'titulo5',
          'subtitulo 5'),
      CardMostWanted(
          'https://cdn.pixabay.com/photo/2016/03/09/09/22/workplace-1245776__340.jpg',
          'titulo1',
          'subtitulo 2')
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
                    width: 1000.0,
                    height: 500,
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

  Widget iconCategory(String imageUrl, String nameCategory) {
    return Column(
      children: <Widget>[
        Container(
            width: 35,
            height: 35,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.network(
                imageUrl,
                width: 25,
                height: 25,
                fit: BoxFit.cover,
              ),
            ),
            decoration: new BoxDecoration(
              border: Border.all(width: 1, style: BorderStyle.solid),
              shape: BoxShape.circle,
            )),
        Text(
          nameCategory,
          style: TextStyle(fontSize: 12, color: Colors.black45),
        ),
      ],
    );
  }

  Widget categories(BuildContext context) {
    final List<Category> listCategory = [
      Category(
          idCategory: '0',
          nameCategory: 'All',
          imageCategory:
              'https://img.icons8.com/windows/32/000000/categorize.png'),
      Category(
          idCategory: '1',
          nameCategory: 'Clothes',
          imageCategory:
              'https://img.icons8.com/windows/32/000000/clothes.png'),
      Category(
          idCategory: '0',
          nameCategory: 'Cars',
          imageCategory:
              'https://img.icons8.com/windows/32/000000/traffic-jam.png'),
      Category(
          idCategory: '1',
          nameCategory: 'Books',
          imageCategory:
              'https://img.icons8.com/windows/32/000000/driving-guidelines.png'),
    ];
    /*
    final List<Category> listCategory = [
      Category( 's', 's'),

      // '0', 'All','https://img.icons8.com/windows/32/000000/categorize.png'),
    ];
    */

    return SizedBox(
        height: 70,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listCategory.length,
          itemBuilder: (_, index) => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: iconCategory(listCategory[index].imageCategory,
                  listCategory[index].nameCategory)),
        ));

    /*
     listCategory.map((category) {
    new CircleAvatar(
          backgroundImage: NetworkImage(category.imageCategory),
          backgroundColor: Colors.black87,
        )}).toList();
        */

    /*
    final List<CardCategorie> imageList = [
      CardCategorie(
          'https://cdn.pixabay.com/photo/2016/03/09/09/22/workplace-1245776__340.jpg',
          'titulo1',
          'subtitulo 2'),
      CardCategorie(
          'https://cdn.pixabay.com/photo/2016/03/09/09/22/workplace-1245776__340.jpg',
          'titulo2',
          'subtitulo 3'),
      CardCategorie(
          'https://cdn.pixabay.com/photo/2016/03/09/09/22/workplace-1245776__340.jpg',
          'titulo3',
          'subtitulo 4'),
      CardCategorie(
          'https://cdn.pixabay.com/photo/2016/03/09/09/22/workplace-1245776__340.jpg',
          'titulo4',
          'subtitulo 5'),
      CardCategorie(
          'https://cdn.pixabay.com/photo/2016/03/09/09/22/workplace-1245776__340.jpg',
          'titulo5',
          'subtitulo 6'),
      CardCategorie(
          'https://cdn.pixabay.com/photo/2016/03/09/09/22/workplace-1245776__340.jpg',
          'titulo6',
          'subtitulo 7'),
      CardCategorie(
          'https://cdn.pixabay.com/photo/2016/03/09/09/22/workplace-1245776__340.jpg',
          'titulo7',
          'subtitulo 8'),
      CardCategorie(
          'https://cdn.pixabay.com/photo/2016/03/09/09/22/workplace-1245776__340.jpg',
          'titulo8',
          'subtitulo 9'),
      CardCategorie(
          'https://cdn.pixabay.com/photo/2016/03/09/09/22/workplace-1245776__340.jpg',
          'titulo9',
          'subtitulo 10'),
      CardCategorie(
          'https://cdn.pixabay.com/photo/2016/03/09/09/22/workplace-1245776__340.jpg',
          'titulo10',
          'subtitulo 11'),
    ];

    return GFItemsCarousel(
      rowCount: 2,
      itemHeight: 100,
      children: imageList.map(
        (categorie) {
          return Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Image.network(
                    categorie.url,
                    fit: BoxFit.cover,
                    width: 1000.0,
                    height: 100,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        categorie.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ).toList(),
    );
    */
  }

  Widget listProduct() {
    final List<CardCategorie> imageList = [
      CardCategorie(
          'https://cdn.pixabay.com/photo/2016/03/09/09/22/workplace-1245776__340.jpg',
          'titulo1',
          'subtitulo 2'),
      CardCategorie(
          'https://cdn.pixabay.com/photo/2016/03/09/09/22/workplace-1245776__340.jpg',
          'titulo2',
          'subtitulo 3'),
      CardCategorie(
          'https://cdn.pixabay.com/photo/2016/03/09/09/22/workplace-1245776__340.jpg',
          'titulo3',
          'subtitulo 4'),
      CardCategorie(
          'https://cdn.pixabay.com/photo/2016/03/09/09/22/workplace-1245776__340.jpg',
          'titulo4',
          'subtitulo 5'),
      CardCategorie(
          'https://cdn.pixabay.com/photo/2016/03/09/09/22/workplace-1245776__340.jpg',
          'titulo5',
          'subtitulo 6'),
      CardCategorie(
          'https://cdn.pixabay.com/photo/2016/03/09/09/22/workplace-1245776__340.jpg',
          'titulo6',
          'subtitulo 7'),
      CardCategorie(
          'https://cdn.pixabay.com/photo/2016/03/09/09/22/workplace-1245776__340.jpg',
          'titulo7',
          'subtitulo 8'),
      CardCategorie(
          'https://cdn.pixabay.com/photo/2016/03/09/09/22/workplace-1245776__340.jpg',
          'titulo8',
          'subtitulo 9'),
      CardCategorie(
          'https://cdn.pixabay.com/photo/2016/03/09/09/22/workplace-1245776__340.jpg',
          'titulo9',
          'subtitulo 10'),
      CardCategorie(
          'https://cdn.pixabay.com/photo/2016/03/09/09/22/workplace-1245776__340.jpg',
          'titulo10',
          'subtitulo 11'),
    ];

    return GFItemsCarousel(
      rowCount: 2,
      itemHeight: 100,
      children: imageList.map(
        (categorie) {
          return Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Image.network(
                    categorie.url,
                    fit: BoxFit.cover,
                    width: 1000.0,
                    height: 100,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        categorie.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ).toList(),
    );
  }

  Widget cardProduct(ProductCategory productCategory) {
    return Stack(
      children: <Widget>[
        Container(
          width: 150,
          child: Card(
            elevation: 2,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RotatedBox(
                        quarterTurns: 0,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18.0, vertical: 4),
                            child: Text(
                              'Nuevo',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          color: Colors.green,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        productCategory.favorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                      )
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          width: 130,
                          height: 75,
                          child: Image.network(
                            productCategory.imageCategory,
                            width: 180,
                            height: 110,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      textSimple1(
                          FaIcon(FontAwesomeIcons.checkCircle,
                              color: Colors.orange),
                          productCategory.nameCategory,
                          Colors.orange),
                      Text(
                        productCategory.nameProduct,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 11),
                      ),
                      //StarRating(rating: product.rating, size: 10),
                      Row(
                        children: <Widget>[
                          Text(productCategory.priceProductDiscount.toString(),
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red)),
                          Text(
                            productCategory.priceProduct.toString(),
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                                decoration: TextDecoration.lineThrough),
                          )
                        ],
                      ),
                      RankingWidget(
                        rating: productCategory.ranking,
                        size: 20,
                      )
                    ],
                  ),
                  sizedBox(0, 10.00),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        child: FaIcon(
                          FontAwesomeIcons.phone,
                          color: Colors.black26,
                          size: 18,
                        ),
                        onTap: () {},
                      ),
                      InkWell(
                        child: FaIcon(
                          FontAwesomeIcons.envelopeOpenText,
                          color: Colors.black26,
                          size: 18,
                        ),
                        onTap: () {},
                      ),
                      InkWell(
                        child: FaIcon(
                          FontAwesomeIcons.whatsapp,
                          color: Colors.black26,
                          size: 18,
                        ),
                        onTap: () {},
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget listProductCategory(BuildContext context) {
    final List<ProductCategory> listProductOfCategory = [
      ProductCategory(
          favorite: false,
          nameCategory: 'Todos',
          imageCategory:
              'https://cdn.llumar.com/drupal/types_automotive_film.jpg',
          nameProduct: 'Auto celerio',
          priceProduct: 25666,
          priceProductDiscount: 25066,
          ranking: 2),
      ProductCategory(
          favorite: true,
          nameCategory: 'Todos',
          imageCategory:
              'https://di-uploads-pod11.dealerinspire.com/boucherautogroup/uploads/2019/02/CX5.jpg',
          nameProduct: 'Auto mazda',
          priceProduct: 45666,
          priceProductDiscount: 25006,
          ranking: 5),
      ProductCategory(
          favorite: true,
          nameCategory: 'Todos',
          imageCategory:
              'https://cdn.llumar.com/drupal/types_automotive_film.jpg',
          nameProduct: 'Auto celerio Mod 1666',
          priceProduct: 25666,
          priceProductDiscount: 25066,
          ranking: 4),
      ProductCategory(
          favorite: false,
          nameCategory: 'Todos',
          imageCategory:
              'https://di-uploads-pod11.dealerinspire.com/boucherautogroup/uploads/2019/02/CX5.jpg',
          nameProduct: 'Auto mazda Mod 2000',
          priceProduct: 35666,
          priceProductDiscount: 25066,
          ranking: 5),
    ];

    return SizedBox(
        height: 280,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listProductOfCategory.length,
          itemBuilder: (_, index) => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
              child: cardProduct(listProductOfCategory[index])),
        ));
  }

  Widget recentlyViewed(int i) {
    final List<ProductsRecentlyViewed> productsRecentlyViewed = [
      ProductsRecentlyViewed(
          'https://cdn.pixabay.com/photo/2017/01/06/17/49/honey-1958464__340.jpg',
          'Sonof T1 EU AC90V-250V Smart WIFI wall Touch Ligth Switch',
          12365,
          0),
      ProductsRecentlyViewed(
          'https://cdn.pixabay.com/photo/2016/02/19/11/35/make-up-1209798__340.jpg',
          'Cosmeticos',
          123456,
          122456),
      ProductsRecentlyViewed(
          'https://cdn.pixabay.com/photo/2016/05/04/19/05/cookies-1372607__340.jpg',
          'Galletas de soya',
          50,
          30),
    ];

    return InkWell(
      onTap: () {},
      child: GFListTile(
        margin: EdgeInsets.all(2),
        avatar: Image.network(
          productsRecentlyViewed[i].url,
          fit: BoxFit.cover,
          width: 70.0,
          height: 70,
        ),
        titleText: productsRecentlyViewed[i].name,
        description: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              NumberFormat.simpleCurrency(name: 'BOB')
                  .format(productsRecentlyViewed[0].price),
              style: TextStyle(
                  decoration: (productsRecentlyViewed[i].discount > 0)
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
            Opacity(
                opacity: productsRecentlyViewed[i].discount > 0 ? 1 : 0,
                child: Text(NumberFormat.simpleCurrency(name: 'BOB')
                    .format(productsRecentlyViewed[i].discount))),
          ],
        ),
      ),
    );
    //icon: Icon(Icons.favorite)
  }
}
