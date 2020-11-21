import 'package:flutter/material.dart';
import "package:velocity_x/velocity_x.dart";
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  final List currencies;
  HomePage(this.currencies);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List currencies;
  final List<MaterialColor> _colors = [Colors.blue, Colors.teal, Colors.yellow];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "CRYPTO".text.xl2.make(),
      ),
      body: _cryptoWidget(),
    );
  }

  Widget _cryptoWidget() {
    return Container(
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: widget.currencies.length,
              itemBuilder: (BuildContext context, int index) {
                final Map currency = widget.currencies[index];
                final MaterialColor color = _colors[index % _colors.length];

                return _getListItemUi(currency, color);
              },
            ),
          ),
        ],
      ),
    );
  }

  ListTile _getListItemUi(Map currency, MaterialColor color) {
    var value = checkDouble(currency['current_price']);
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        //child: Text(currency['name'][0]),
        child: Image.network(currency['image']),
      ),
      title: Text(
        currency['name'],
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle:
          _getSubtitleText(value, currency['price_change_percentage_24h']),
      isThreeLine: true,
    );
  }

  static double checkDouble(dynamic value) {
    if (value is int) {
      return value + .0;
    } else {
      return value;
    }
  }

  Widget _getSubtitleText(price, double percentageChange) {
    TextSpan priceTextWidget =
        TextSpan(text: "\$$price\n", style: TextStyle(color: Colors.black));
    String percentageChangeText = "24 hour : $percentageChange%";
    TextSpan percentageChangeTextWidget;

    if (percentageChange > 0) {
      percentageChangeTextWidget = TextSpan(
          text: percentageChangeText, style: TextStyle(color: Colors.green));
    } else {
      percentageChangeTextWidget = TextSpan(
          text: percentageChangeText, style: TextStyle(color: Colors.red));
    }

    return RichText(
        text:
            TextSpan(children: [priceTextWidget, percentageChangeTextWidget]));
  }
}
