import 'package:bazaarboxapp/providers/navbar_provider.dart';
import 'package:bazaarboxapp/views/home.dart';
import 'package:bazaarboxapp/views/navbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

Future<void> deleteThisNow(int itemID, BuildContext context) async {
  final http.Client client = http.Client();
  try {
    final response = await client.delete(
      Uri.parse("http://10.0.2.2:3004/item/$itemID"),
    );

    if (response.statusCode == 204) {
      try {
        Get.back();
      } catch (e) {
        debugPrint(e.toString());
      }
    } else {
      debugPrint(response.reasonPhrase);
      debugPrint(response.statusCode.toString());
    }
  } catch (e) {
    debugPrint("Something went wrong");
  }
}
