import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:candlesticks/candlesticks.dart';
import 'package:http/http.dart' as http;

class CoinGraph extends StatefulWidget {
  final String CoinName;
  final String Coinid;
  final String CoinSymbol;
  final int CoinInterval = 7;
  CoinGraph(
      {required this.CoinName, required this.Coinid, required this.CoinSymbol});

  @override
  _CoinGraphState createState() => _CoinGraphState();
}

class _CoinGraphState extends State<CoinGraph> {
  List<Candle> candles = [];
  bool themeIsDark = false;

  @override
  void initState() {
    fetchCandles().then((value) {
      setState(() {
        candles = value;
      });
    });
    super.initState();
  }

  Future<List<Candle>> fetchCandles() async {
    String symbolcoin = widget.CoinSymbol.toUpperCase();

    final uri = Uri.parse(
        "https://api.binance.com/api/v3/klines?symbol=${symbolcoin}USDT&interval=1h");
    final res = await http.get(uri);

    return (jsonDecode(res.body) as List<dynamic>)
        .map((e) => Candle.fromJson(e))
        .toList()
        .reversed
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeIsDark ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.CoinName),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  themeIsDark = !themeIsDark;
                });
              },
              icon: Icon(
                themeIsDark
                    ? Icons.wb_sunny_sharp
                    : Icons.nightlight_round_outlined,
              ),
            )
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height / 1.8,
          child: Candlesticks(
            candles: candles,
          ),
        ),
      ),
    );
  }
}
