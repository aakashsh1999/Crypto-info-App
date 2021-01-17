import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Currency extends StatelessWidget {
  final currency;

  const Currency({Key key, this.currency}) : super(key: key); //Constructor
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.yellow[300], Colors.purple[400]],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leadingWidth: 20.0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(currency["name"],
              style: GoogleFonts.workSans(
                textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              )),
          elevation: 0.0,
        ),
        body: Container(
          margin: EdgeInsets.only(top: 30),
          child: Center(
              child: Column(children: [
            Stack(children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.white,
                        blurRadius: 2.0,
                        offset: Offset(0, 0))
                  ],
                  color: Colors.white,
                ),
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  top: 70,
                  left: 17.5,
                ),
                width: 375,
                height: 470,
              ),
              Hero(
                tag: currency,
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(currency['image']),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 130),
                alignment: Alignment.center,
                child: Text(
                  'Current ${currency['id']} Price',
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 170),
                child: Text('₹ ${currency['current_price']}',
                    style: GoogleFonts.poppins(
                        letterSpacing: 1.5,
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.lightGreenAccent,
                        border: Border.all(
                          width: 1.0,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                     boxShadow: [BoxShadow(
                      color:Colors.grey, offset: Offset(0,0),
                      blurRadius:5.0,
                    )],),
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      top: 210,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      '1D Highest : ₹ ${currency['high_24h']}',
                      style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700)),
                    ),
                  ),
                  SizedBox(width: 5.0),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        border: Border.all(
                          width: 1.0,
                          color: Colors.white,
                        ),
                     boxShadow: [BoxShadow(
                      color:Colors.grey, offset: Offset(0,0),
                      blurRadius:5.0,
                    )],
                        borderRadius: BorderRadius.circular(8.0)),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    margin: EdgeInsets.only(top: 210),
                    child: Text(
                      '1D Lowest : ₹ ${currency['low_24h']}',
                      style: GoogleFonts.sourceSansPro(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                    color:Colors.pink,
                    
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [BoxShadow(
                      color:Colors.grey, offset: Offset(0,0),
                      blurRadius:5.0,
                    )],
                    ),                  
  
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 10),
                margin: EdgeInsets.only(
                  top: 290,
                  left: 30,
                  right: 30,
                ),
                child: Text(
                  'About ${currency['symbol']}',
                  style: GoogleFonts.sourceSansPro(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 350,
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                        bottom: BorderSide(color: Colors.black, width: 2.5),
                      )),
                      padding: EdgeInsets.only(bottom: 5),
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Market Rank :',
                                style: GoogleFonts.ptSans(
                                    textStyle: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ))),
                            Text('# ${currency['market_cap_rank']}',
                                style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500))),
                          ]),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                        bottom: BorderSide(color: Colors.black, width: 2.5),
                      )),
                      padding: EdgeInsets.only(bottom: 5, top: 15),
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Market Capital :',
                                style: GoogleFonts.ptSans(
                                    textStyle: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ))),
                            Text('₹ ${currency['market_cap']}',
                                style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500))),
                          ]),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                        bottom: BorderSide(color: Colors.black, width: 2.5),
                      )),
                      padding: EdgeInsets.only(bottom: 5, top: 15),
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Circulating Supply :',
                                style: GoogleFonts.ptSans(
                                    textStyle: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ))),
                            Text(
                              '₹ ${currency['circulating_supply']}',
                              style: GoogleFonts.nunitoSans(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ]),
                    ),
                  ],
                ),
              )
            ]),
          ])),
        ),
      ),
    );
  }
}
