import 'package:bazaarboxapp/services/item_entity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenProvider with ChangeNotifier {
  HomeScreenProvider() {
    getItemsNow();
  }

  bool isLoading = false;
  void updateLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  // bool errorCheck = false;
  // void updateErrorHappenened(bool value) {
  //   errorCheck = value;
  //   notifyListeners();
  // }

  List<ItemEntity> itemsList = [];
  void updateItemList(List<ItemEntity> itemEntityTemp) {
    itemsList = itemEntityTemp;

    notifyListeners();
  }

  String generalErrorMessage = "";
  void updateErrorMessage(String value) {
    generalErrorMessage = value;
    notifyListeners();
  }

  final http.Client client = http.Client();
  Future<void> getItemsNow() async {
    try {
      updateLoading(true);
      print("hey");
      final response = await client.get(
        Uri.parse("http://10.0.2.2:3004/getAllItems"),
      );
      print(response.body);
      if (response.statusCode == 200) {
        try {
          updateItemList(itemEntityFromJson(response.body));
        } catch (e) {
          debugPrint(e.toString());
        }
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      updateErrorMessage("Something went wrong");
    } finally {
      updateLoading(false);
    }
  }
}
