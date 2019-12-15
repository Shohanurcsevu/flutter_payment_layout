import 'dart:math';

import 'package:flutter/material.dart';

class CardBackView extends StatelessWidget {

  final String ccvNumber;

  const CardBackView({Key key, this.ccvNumber}) : super(key: key);




  @override
   Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, .001)
        ..rotateY(pi * 1),
      origin: Offset(MediaQuery.of(context).size.width / 2, 0),
      child: Container(
        height: 300,
        width: 500,
        color: Colors.white,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 20,
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                color: Colors.black87,
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 150,
                          height: 30,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          ccvNumber,
                          style: TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 20,
                      color: Colors.black12,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 150,
                          height: 20,
                          color: Colors.black12,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 150,
                          height: 20,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}