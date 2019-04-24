import 'package:flutter/material.dart';
import 'package:deramosgenerales/BLoC/comida.dart';
import 'package:deramosgenerales/Widgets/popupimage.dart';

Widget _buildFav(BuildContext context, int index, Comida comida) {
  print('Index $index');
  if (comida != null) {
    return new Card(
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Flexible(
            child: Column(children: <Widget>[
              new Padding(
                padding:
                    const EdgeInsets.only(left: 5.0, right: 15.0, top: 5.0),
                child: PopUp(
                  ruta: comida.key.toString(),
                  rutaImagen: comida.ruta,
                ),
              )
            ]),
            flex: 1,
          ),
          new Flexible(child: _buildColumn(index, comida), flex: 3),
        ],
      ),
    );
  } else {
    return CircularProgressIndicator();
  }
}

Widget _buildColumn(int index, Comida comida) {
  double price = comida.price / 100;
  int qty;
  return new Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      new Padding(
        padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
        child: new Text(
          comida.name,
          //  style: _boldStyle,
        ),
      ),
      new Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: new Text(comida.descripcion),
      ),
      new Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Text(
              "Cantidad",
            ),
            new SizedBox(
              width: 20.0,
            ),
            new DropdownButton<int>(
              items: <int>[
                1,
                2,
                3,
                4,
                5,
                6,
                7,
                8,
                9,
                10,
                11,
                12,
                13,
                14,
                15,
                16,
                17,
                18,
                19,
                20
              ].map((f) {
                return new DropdownMenuItem<int>(
                  value: f,
                  child: new Text(f.toString()),
                );
              }).toList(),
              value: null, //TODO: Bloc Nuevo valor
              onChanged: null, //TODO: Bloc a precios totales
              hint: Text('Cantidad de porciones'),
            )
          ],
        ),
      ),
      _buildBottomRow(price, qty),
    ],
  );
}

Widget _buildBottomRow(double itemPrice, int qty) {
  return new Container(
      margin: const EdgeInsets.only(bottom: 10.0, right: 10.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Flexible(
            flex: 1,
            child: new Text(
              "Precio:",
              //  style: _greyStyle,
            ),
          ),
          //  new SizedBox(width: 5.0,),
          new Flexible(
              flex: 1,
              child: new Text(
                itemPrice.toStringAsPrecision(2),
                //   style: _boldStyle,
              )),
          // new SizedBox(width: 10.0,),
          new Flexible(
            flex: 1,
            child: new Text(
              "Total:",
              //  style: _greyStyle,
            ),
          ),
          new SizedBox(
            width: 5.0,
          ),
          new Flexible(
              flex: 1,
              child: new Text(
                (qty * itemPrice).toString(),
                //  style: _boldStyle,
              ))
        ],
      ));
}

class Carrito extends StatelessWidget {
  final Comida comida;

  const Carrito({Key key, this.comida}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
            child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) =>
                    _buildFav(context, index, comida))),
        Card(
          child: Row(
            children: <Widget>[
              Icon(
                Icons.monetization_on,
                color: Colors.green,
                size: 50.0,
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Total de su pedido:',
                    style: TextStyle(fontSize: 25.0),
                  ),
                  Text(
                    'Fecha de entrega 25/12',
                    style: TextStyle(fontSize: 15.0),
                  )
                ],
              ),
              Divider(
                height: 30.0,
              ),
              Spacer(),
              Container(
                  child: Text('20.0'), padding: EdgeInsets.only(right: 20.0)),
              Container()
            ],
          ),
        )
      ],
    );
  }
}
