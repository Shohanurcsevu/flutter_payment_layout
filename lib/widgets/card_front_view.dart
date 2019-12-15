import 'package:flutter/material.dart';

class CardFrontVIew extends StatelessWidget {
  final String cardNumber;
  final String  ccvNumber;
  final String cardholderName;

  CardFrontVIew({Key key, this.cardNumber, this.ccvNumber, this.cardholderName}) : super(key: key) {
    _formatedCardNumber = this.cardNumber.padRight(16, '*');
    _formatedCardNumber = _formatedCardNumber.replaceAllMapped(
        RegExp(r".{4}"), (match) => "${match.group(0)} ");
  }

  String _formatedCardNumber;

  


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 500,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 20,
        margin: EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                  alignment: Alignment.topRight,
                  child: Image.asset('images/visa.png')),
              SizedBox(
                height: 32,
              ),
              Text(
                _formatedCardNumber,
                style: TextStyle(fontSize: 20, letterSpacing: 2,wordSpacing: 2, shadows: [
                  Shadow(color: Colors.black12, offset: Offset(2, 1))
                ]),
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Card Holder'),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                       cardholderName,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Expiray'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('10/20',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
