import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:janiostore/models/productos_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Cart extends StatefulWidget {
  final List<ProductosModel> _cart;

  Cart(this._cart);

  @override
  State<Cart> createState() => _CartState(this._cart);
}

class _CartState extends State<Cart> {
  _CartState(this._cart);

  final _scrollController = ScrollController();
  var _fisrtScroll = true;
  bool _enabled = false;

  List<ProductosModel> _cart;

  Container pagoTotal(List<ProductosModel> _cart) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: 50, left: 50),
      height: 70,
      width: 400,
      color: Colors.amber[400],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.cashRegister),
            onPressed: () {},
            color: Colors.brown[700],
            iconSize: 30.0,
          ),
          Text(
            'Total: s/. ${valorTotal(_cart)}',
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                color: Colors.black),
          ),
        ],
      ),
    );
  }

  String valorTotal(List<ProductosModel> listProductos) {
    double total = 0.0;
    int i = 0;
    while (i < listProductos.length) {
      total += listProductos[i].price * listProductos[i].quantity;
      i++;
    }

    return total.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.liquor,
              color: Colors.black,
              size: 28,
            ),
            onPressed: null,
            color: Colors.black,
          ),
        ],
        title: Text(
          'Detalle de Compra',
          style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
            setState(() {
              _cart.length;
            });
          },
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (_enabled && _fisrtScroll) {
            _scrollController
                .jumpTo(_scrollController.position.pixels - details.delta.dy);
          }
        },
        onVerticalDragEnd: (_) {
          if (_enabled) _fisrtScroll = false;
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _cart.length,
                itemBuilder: (context, index) {
                  final String imagen = _cart[index].image;
                  var item = _cart[index];
                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 2.0),
                        child: Column(
                          children: [
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    width: 80,
                                    height: 80,
                                    child: new Image.asset(
                                      'assets/images/$imagen',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      item.name,
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                          color: Colors.black),
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            width: 140,
                                            height: 38,
                                            decoration: BoxDecoration(
                                              color: Colors.amber[700],
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 6.0,
                                                  color: Colors.blue,
                                                  offset: Offset(0.0, 1.0),
                                                ),
                                              ],
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(50.0),
                                              ),
                                            ),
                                            margin: EdgeInsets.only(top: 20.0),
                                            padding: EdgeInsets.all(2.0),
                                            child: new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                SizedBox(
                                                  height: 8.0,
                                                ),
                                                IconButton(
                                                  icon: Icon(Icons.remove),
                                                  onPressed: () {
                                                    _removeProduct(index);
                                                    valorTotal(_cart);
                                                  },
                                                  color: Colors.black,
                                                  iconSize: 20.0,
                                                ),
                                                Text(
                                                  '${_cart[index].quantity}',
                                                  style: new TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                IconButton(
                                                  icon: Icon(Icons.add),
                                                  onPressed: () {
                                                    _addProduct(index);
                                                    valorTotal(_cart);
                                                  },
                                                  color: Colors.black,
                                                  iconSize: 20.0,
                                                ),
                                                SizedBox(
                                                  height: 8.0,
                                                )
                                              ],
                                            ),
                                          ),
                                        ]),
                                  ],
                                ),
                                SizedBox(
                                  width: 38.0,
                                ),
                                Text(
                                  's/.' + item.price.toString() + '.00',
                                  style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.amber[700],
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                width: 10.0,
              ),
              pagoTotal(_cart),
              SizedBox(
                width: 20.0,
              ),
              Container(
                height: 100,
                width: 200,
                padding: EdgeInsets.only(top: 50),
                child: ElevatedButton(
                  child: Text("Pagar"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.amber[700],
                    ),
                  ),
                  onPressed: () => {
                    CoolAlert.show(
                      context: context,
                      title: "Confirmar la compra",
                      type: CoolAlertType.confirm,
                      confirmBtnColor: Colors.green,
                      confirmBtnText: "Confirmar",
                      cancelBtnText: "Cancelar",
                      onConfirmBtnTap: () => CoolAlert.show(
                        context: context,
                        type: CoolAlertType.success,
                        autoCloseDuration: Duration(seconds: 2),
                      ),
                      autoCloseDuration: Duration(seconds: 5),
                    ),
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /* Agregar Producto*/
  _addProduct(int index) {
    setState(() {
      _cart[index].quantity++;
    });
  }

  _removeProduct(int index) {
    setState(() {
      _cart[index].quantity--;
    });
  }
}
