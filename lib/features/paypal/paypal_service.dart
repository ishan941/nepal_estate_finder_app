import 'dart:convert';

import 'package:dio/dio.dart';

import 'dart:async';
import 'dart:convert' as convert;

class PaypalServices {
  String domain = "https://api.sandbox.paypal.com"; // for sandbox mode
  // String domain = "https://api.paypal.com"; // for production mode

  // change clientId and secret with your own, provided by PayPal
  String clientId =
      'Aa0PnMKym804WSwmsfDJZkEiGZO0zr_GFxHlRl58qXut5qKgL0k4hvmZ7yXrPgwS_Wx2LSKjaPcnFe0h';
  String secret =
      'EFYdHdmJmZOZxLstkS7ZM7Uzhmu-x3uayAeMHMqJaV_-aw7nwzVJ5hTqOI8IGqMhIbzLDeADx_goflfw';

  Dio dio = Dio();

  // for getting the access token from PayPal
  Future<String?> getAccessToken() async {
    try {
      var response = await dio.post(
        '$domain/v1/oauth2/token',
        data: {
          'grant_type': 'client_credentials',
        },
        options: Options(
          headers: {
            Headers.contentTypeHeader: 'application/x-www-form-urlencoded',
            'Authorization':
                'Basic ${base64Encode(utf8.encode('$clientId:$secret'))}',
          },
        ),
      );

      if (response.statusCode == 200) {
        return response.data['access_token'];
      }

      return null;
    } catch (e) {
      rethrow;
    }
  }

  // for creating the payment request with PayPal
  Future<Map<String, String>?> createPaypalPayment(
      transactions, accessToken) async {
    try {
      var response = await dio.post("$domain/v1/payments/payment",
          data: convert.jsonEncode(transactions),
          options: Options(
            headers: {
              Headers.contentTypeHeader: "application/json",
              'Authorization': 'Bearer $accessToken',
            },
          ));

      print(response.data);

      if (response.statusCode == 201) {
        if (response.data["links"] != null &&
            response.data["links"].length > 0) {
          List links = response.data["links"];

          String executeUrl = "";
          String approvalUrl = "";

          final item = links.firstWhere((o) => o["rel"] == "approval_url",
              orElse: () => null);
          if (item != null) {
            approvalUrl = item["href"];
          }

          final item1 = links.firstWhere((o) => o["rel"] == "execute",
              orElse: () => null);
          if (item1 != null) {
            executeUrl = item1["href"];
          }

          return {"executeUrl": executeUrl, "approvalUrl": approvalUrl};
        }

        return null;
      } else {
        throw Exception(response.data["message"]);
      }
    } catch (e) {
      rethrow;
    }
  }

  // for executing the payment transaction
  Future<String?> executePayment(url, payerId, accessToken) async {
    try {
      var response = await dio.post(url,
          data: convert.jsonEncode({"payer_id": payerId}),
          options: Options(
            headers: {
              Headers.contentTypeHeader: "application/json",
              'Authorization': 'Bearer $accessToken',
            },
          ));

      final body = convert.jsonDecode(response.data!);

      if (response.statusCode == 200) {
        return body["id"];
      }

      return null;
    } catch (e) {
      rethrow;
    }
  }
}
