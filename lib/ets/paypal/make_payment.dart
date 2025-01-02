import 'package:flutter/material.dart';
import 'package:provider_with_clean_architecture/features/ets/paypal/paypal_payment.dart';

class MakePayment extends StatefulWidget {
  @override
  _makePaymentState createState() => _makePaymentState();
}

class _makePaymentState extends State<MakePayment> {
  TextStyle style = TextStyle(fontFamily: 'Open Sans', fontSize: 15.0);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.transparent,
          key: _scaffoldKey,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(45.0),
            child: AppBar(
              backgroundColor: Colors.white,
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Paypal Payment Example',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.red[900],
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Open Sans'),
                  ),
                ],
              ),
            ),
          ),
          body: Container(
              width: MediaQuery.of(context).size.width,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        // make PayPal payment

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => PaypalPayment(
                              onFinish: (number) async {
                                // payment done
                                print('order id: ' + number);
                              },
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        'Pay with Paypal',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }
}
