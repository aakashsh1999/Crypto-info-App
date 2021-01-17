import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/currency.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //Declaring the variable and initialising the api url
  var res;
  var url =
      "https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=100&page=1&sparkline=false&price_change_percentage=1h";
  List currencies;
  void initState() {
    super.initState();
    fetchData();
  }
//Fetching the Api data
  fetchData() async {
    res = await http.get(url);
    print(res.body);
    setState(() {});
    currencies = jsonDecode(res.body);
  }

  //Declaring the Subtitle widgets

  Widget details(String priceInUsd, String percentagechange) {
    TextSpan pricetextWidget = new TextSpan(
        text: "₹ $priceInUsd\n",
        style: GoogleFonts.poppins(
            letterSpacing: 1.5,
            textStyle: TextStyle(
              fontSize: 20,
              color: Colors.black,
            )));

    //used when the precentagechange is positive
    TextSpan percentagechangeText;
    if (double.parse(percentagechange) > 0) {
      percentagechangeText = new TextSpan(
          text: "$percentagechange %",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
            fontSize: 16,
            color: Colors.green,
          )));
    } else {
        //used when the precentagechange is negative
      percentagechangeText = new TextSpan(
          text: "$percentagechange %",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
            fontSize: 16,
            color: Colors.red,
          )));
    }
    return new RichText(
        text: new TextSpan(
      children: [pricetextWidget, percentagechangeText],
    ));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text('Crypto Info',
            style: GoogleFonts.poppins(
              color: Colors.black,
              textStyle: TextStyle(
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            )),
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
      ),
      body: RefreshIndicator( 
          onRefresh: () async {
            await fetchData().then((_url) {
              if (_url is Future) {
                setState(() {
                  url = _url as String;
                });
                return;
              } else {
                setState(() {
                  return AlertDialog(
                      title: Text('Please enable your Internet'));
                });
                return;
              }
            });

            return;
          },
          child: res != null
              ? Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0XFFfaaca8), Color(0XFFddd6f3)],
                          begin: Alignment.topRight,
                          end: Alignment.bottomRight)),
                  child: ListView.builder(
                    itemCount: currencies.length,
                    itemBuilder: (context, index) {
                      //getting the currency api in Map datatype
                      Map currency = currencies[index];
                      var imgurl = '${currency['image']}';
                      imgurl.toString();
                      return Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Colors.white, spreadRadius: 2.0),
                          ],
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                        ),
                        margin: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 20.0),
                        child: ListTile(
                          hoverColor: Colors.green[300],
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          leading: Hero(
                            tag: currency,
                            child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage('${currency['image']}'),
                            ),
                          ),
                          title: Container(
                            child: Text('${currency['name']}',
                                style: GoogleFonts.workSans(
                                  textStyle: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500),
                                )),
                          ),
                          subtitle: details('${currency['current_price']}',
                              '${currency['price_change_percentage_24h']}'),
                          tileColor: Colors.white,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Currency(currency: currency),
                                fullscreenDialog: true),
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Center(
                  child:
                      CircularProgressIndicator(backgroundColor: Colors.black),
                )),
    );
  }
}
