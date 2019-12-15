import 'dart:math';

import 'package:credit_card/widgets/card_back_view.dart';
import 'package:credit_card/widgets/card_front_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardPayment extends StatefulWidget {
  @override
  _CardPaymentState createState() => _CardPaymentState();
}

class _CardPaymentState extends State<CardPayment> with SingleTickerProviderStateMixin {
  double _rotaionFactor = 0;

  String _cardnumber = '';
  String _ccvNumber = '';
  String _cardHolderName= 'Account Name';

  //Animation
  AnimationController _flipAnimationController;
  Animation<double> _flipAnimation;

  FocusNode ccvFoucs;



  TextEditingController _cardNumberController;
  TextEditingController _ccvNumberController;
  TextEditingController _cardHolderNameControlller;

  _CardPaymentState() {
    _cardNumberController = TextEditingController();
    _ccvNumberController = TextEditingController();
    _cardHolderNameControlller =TextEditingController();

    ccvFoucs = FocusNode();
    _cardNumberController.addListener(() {
      _cardnumber = _cardNumberController.text;

      setState(() {});
    });

    _ccvNumberController.addListener(() {
      _ccvNumber = _ccvNumberController.text;
      setState(() {});
    });

    ccvFoucs.addListener((){
      ccvFoucs.hasFocus ? _flipAnimationController.forward():_flipAnimationController.reverse();


    });
    _cardHolderNameControlller.addListener((){
      _cardHolderName =_cardHolderNameControlller.text;
      setState(() { });
    });
  }

  @override
  void initState() {
    super.initState();
    _flipAnimationController =AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 350)
    );

    _flipAnimation = Tween<double>(begin: 0,end :1).animate(_flipAnimationController)
    ..addListener((){
      setState(() {
      });
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Payemnt")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
           
            children: <Widget>[
              Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, .001)
                  ..rotateY(pi * _flipAnimation.value),
                origin: Offset(MediaQuery.of(context).size.width / 2, 0),
                child: _flipAnimation.value < .5
                    ? CardFrontVIew(
                        cardNumber: _cardnumber,
                        cardholderName: _cardHolderName,
                      )
                    : CardBackView(
                        ccvNumber: _ccvNumber,
                      ),
              ),
              // Slider(
              //   onChanged: (double value){
              //     setState(() {
              //       _rotaionFactor =value;
              //     });
              //   },
              //   value:_rotaionFactor ,
              // ),

              Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Card Number',
                      ),
                      controller: _cardNumberController,
                      keyboardType: TextInputType.number,
                      maxLength: 16,
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: 'Card Holder Name'),
                      controller: _cardHolderNameControlller,
                      maxLength: 16,
                    ),
                    Row(
                      
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            decoration:
                                InputDecoration(hintText: 'Expiray Date'),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          flex: 1,
                       
                          child: TextFormField(
                            decoration: InputDecoration(hintText: 'CCV'),
                            controller: _ccvNumberController,
                            maxLength: 3,
                            focusNode: ccvFoucs,
                          ),
                        ),
                      ],
                    )
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
