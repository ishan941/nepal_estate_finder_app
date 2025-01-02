import 'package:flutter/material.dart';
import 'package:provider_with_clean_architecture/ets/paypal/paypal_service.dart';
import 'package:url_launcher/url_launcher.dart';

class PaypalPayment extends StatefulWidget {
  final Function onFinish;

  PaypalPayment({required this.onFinish});

  @override
  State<StatefulWidget> createState() {
    return PaypalPaymentState();
  }
}

class PaypalPaymentState extends State<PaypalPayment> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? checkoutUrl;
  String? executeUrl;
  String? accessToken;
  bool isLoading = true;
  PaypalServices services = PaypalServices();
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      try {
        accessToken = await services.getAccessToken();

        final transactions = getOrderParams();
        final res =
            await services.createPaypalPayment(transactions, accessToken);

        if (res != null) {
          setState(() {
            checkoutUrl = res["approvalUrl"];
            executeUrl = res["executeUrl"];
            setState(() {
              isLoading = false;
            });
          });
        }
      } catch (e) {
        final snackBar = SnackBar(
          content: Text(e.toString()),
          duration: const Duration(seconds: 10),
          action: SnackBarAction(
            label: 'Close',
            onPressed: () {},
          ),
        );
        //_scaffoldKey.currentState?.showSnackBar(snackBar);
      }
    });
  }

  // item name, price, and quantity
  String itemName = 'iPhone X';
  String itemPrice = '1.99';
  int quantity = 1;

  Map<String, dynamic> getOrderParams() {
    return {
      "intent": "sale",
      "payer": {"payment_method": "paypal"},
      "transactions": [
        {
          "amount": {
            "total": "30.11",
            "currency": "USD",
            "details": {
              "subtotal": "30.00",
              "tax": "0.07",
              "shipping": "0.03",
              "handling_fee": "1.00",
              "shipping_discount": "-1.00",
              "insurance": "0.01"
            }
          },
          "description": "The payment transaction description.",
          "custom": "EBAY_EMS_90048630024435",
          "invoice_number": "48787589673",
          "payment_options": {
            "allowed_payment_method": "INSTANT_FUNDING_SOURCE"
          },
          "soft_descriptor": "ECHI5786786",
          "item_list": {
            "items": [
              {
                "name": "hat",
                "description": "Brown hat.",
                "quantity": "5",
                "price": "3",
                "tax": "0.01",
                "sku": "1",
                "currency": "USD"
              },
              {
                "name": "handbag",
                "description": "Black handbag.",
                "quantity": "1",
                "price": "15",
                "tax": "0.02",
                "sku": "product34",
                "currency": "USD"
              }
            ],
            "shipping_address": {
              "recipient_name": "Brian Robinson",
              "line1": "4th Floor",
              "line2": "Unit #34",
              "city": "San Jose",
              "country_code": "US",
              "postal_code": "95131",
              "phone": "011862212345678",
              "state": "CA"
            }
          }
        }
      ],
      "note_to_payer": "Contact us for any questions on your order.",
      "redirect_urls": {
        "return_url": "https://www.sandbox.paypal.com/return",
        "cancel_url": "https://www.sandbox.paypal.com/cancel"
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    if (checkoutUrl != null) {
      return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: const Icon(Icons.arrow_back_ios),
            onTap: () => Navigator.pop(context),
          ),
        ),
        body: _buildWebView(context),
      );
    } else {
      return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Colors.black12,
          elevation: 0.0,
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
  }

  Widget _buildWebView(BuildContext context) {
    return FutureBuilder<void>(
      future: _launchCheckoutUrl(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.connectionState == ConnectionState.done) {
          widget.onFinish();
          // Transaction completed, invoke the onFinish callback
          // Call the onFinish callback
          return Container(); // Add your UI content here if needed
        } else {
          return Container();
        }
      },
    );
  }

  Future<void> _launchCheckoutUrl(BuildContext context) async {
    await launch(checkoutUrl!);
  }
}
