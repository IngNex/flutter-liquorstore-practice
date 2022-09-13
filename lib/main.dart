import 'package:flutter/material.dart';
import 'package:janiostore/models/productos_model.dart';
import 'package:janiostore/pages/otra_pagina.dart';
import 'package:janiostore/pages/pedido_lista.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

//SHA1: ED:AB:7B:F9:AB:3E:53:A4:63:A3:C4:B7:0F:97:5D:24:AA:5B:65:51

/*---Colores Globales---*/
const Color iconColor = Color.fromARGB(255, 28, 19, 3);
const Color menuColor =
    Color.fromRGBO(12, 176, 159, 1); //Color.fromRGBO(181, 3, 93, 1);
const Color letraColor = Color.fromRGBO(38, 37, 37, 1);
const Color appbarColor =
    Color.fromRGBO(0, 138, 124, 1); //Color.fromRGBO(109, 3, 53, 1); //148,6,73

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          //primarySwatch: Colors.orange,
          //primarySwatch: Colors.
          ),
      home: const MyHomePage(title: 'AppLiquoStore'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ProductosModel> _productosModel = [];
  List<ProductosModel> _listaCarro = [];

  @override
  void initState() {
    super.initState();
    _productosDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StoreLicoreria'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 8.0),
            child: GestureDetector(
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Icon(
                    Icons.shopping_cart,
                    size: 38.0,
                  ),
                  if (_listaCarro.length > 0)
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: CircleAvatar(
                        radius: 10.0,
                        backgroundColor: Color.fromARGB(255, 220, 0, 44),
                        foregroundColor: Colors.white,
                        child: Text(
                          _listaCarro.length.toString(),
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                ],
              ),
              onTap: () {
                if (_listaCarro.isNotEmpty)
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Cart(_listaCarro),
                    ),
                  );
              },
            ),
          ),
        ],
        backgroundColor: appbarColor,
      ),
      drawer: Container(
        width: 210.0,
        child: Drawer(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            color: menuColor,
            child: new ListView(
              padding: EdgeInsets.only(top: 50.0),
              children: <Widget>[
                Container(
                  height: 120,
                  child: new UserAccountsDrawerHeader(
                    accountName: new Text(''),
                    accountEmail: new Text(''),
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: AssetImage('assets/images/food.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                new Divider(),
                new ListTile(
                  title: const Text(
                    'Home',
                    style: TextStyle(color: letraColor, fontSize: 20.0),
                  ),
                  trailing: new Icon(
                    Icons.home,
                    size: 30.0,
                    color: iconColor,
                  ),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => OtraPagina())),
                ),
                new Divider(),
                new ListTile(
                  title: new Text(
                    'Cupones',
                    style: TextStyle(color: letraColor, fontSize: 20.0),
                  ),
                  trailing: new Icon(
                    Icons.card_giftcard,
                    size: 30.0,
                    color: iconColor,
                  ),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => OtraPagina())),
                ),
                new Divider(),
                new ListTile(
                  title: new Text(
                    'Tiendas',
                    style: TextStyle(color: letraColor, fontSize: 20.0),
                  ),
                  trailing: new Icon(
                    Icons.place,
                    size: 30.0,
                    color: iconColor,
                  ),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => OtraPagina())),
                ),
                new Divider(),
                new Divider(),
                new ListTile(
                  title: new Text(
                    'Productos',
                    style: TextStyle(color: letraColor, fontSize: 20.0),
                  ),
                  trailing: new Icon(
                    Icons.fastfood,
                    size: 30.0,
                    color: iconColor,
                  ),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => OtraPagina())),
                ),
                new Divider(),
                new ListTile(
                  title: new Text(
                    'QR Code',
                    style: TextStyle(color: letraColor, fontSize: 20.0),
                  ),
                  trailing: new FaIcon(
                    FontAwesomeIcons.qrcode,
                    size: 30.0,
                    color: iconColor,
                  ),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => OtraPagina())),
                ),
              ],
            ),
          ),
        ),
      ),
      body: _cuadroProductos(),
    );
  }

  GridView _cuadroProductos() {
    return GridView.builder(
      padding: const EdgeInsets.all(4.0),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: _productosModel.length,
      itemBuilder: (context, index) {
        String imagen = _productosModel[index].image;
        var item = _productosModel[index];
        return Card(
          elevation: 4.0,
          child: Stack(
            fit: StackFit.loose,
            alignment: Alignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: new Image.asset("assets/images/$imagen",
                        fit: BoxFit.contain),
                  ),
                  Text(
                    /* NOMBRE */
                    item.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        /* PRECIO */
                        's/.' + item.price.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 8.0,
                          bottom: 8.0,
                        ),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            child: (!_listaCarro.contains(item))
                                ? Icon(
                                    Icons.shopping_cart,
                                    /* TRUE */
                                    color: Color.fromARGB(255, 60, 210, 78),
                                    size: 38,
                                  )
                                : Icon(
                                    Icons.shopping_cart,
                                    /* FALSE */
                                    color: Color.fromARGB(255, 255, 24, 34),
                                    size: 38,
                                  ),
                            onTap: () {
                              setState(() {
                                if (!_listaCarro.contains(item))
                                  _listaCarro.add(item);
                                else
                                  _listaCarro.remove(item);
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  void _productosDb() {
    var list = <ProductosModel>[
      ProductosModel(
        name: 'Power Wishkey',
        image: 'food1.png',
        price: 45,
      ),
      ProductosModel(
        name: 'Crescendo Vodka',
        image: 'food2.png',
        price: 35,
      ),
      ProductosModel(
        name: 'Whashinton Vodka',
        image: 'food3.png',
        price: 55,
      ),
      ProductosModel(
        name: 'Vodka Absolut',
        image: 'food4.png',
        price: 30,
      ),
      ProductosModel(
        name: 'Whitley Neill',
        image: 'food5.png',
        price: 48,
      ),
      ProductosModel(
        name: 'Wyborowa Wodka',
        image: 'food6.png',
        price: 50,
      ),
      ProductosModel(
        name: 'Proper Twelve Wishkey',
        image: 'food7.png',
        price: 38,
      ),
      ProductosModel(
        name: 'BlackLabel',
        image: 'food8.png',
        price: 45,
      ),
      ProductosModel(
        name: 'Postre',
        image: 'food8.png',
        price: 18,
      ),
      ProductosModel(
        name: 'Postre',
        image: 'food8.png',
        price: 18,
      ),
      ProductosModel(
        name: 'Food Tailandesa',
        image: 'food5.png',
        price: 22,
      ),
      ProductosModel(
        name: 'Pizza',
        image: 'food6.png',
        price: 14,
      ),
    ];
    setState(() {
      _productosModel = list;
    });
  }
}
