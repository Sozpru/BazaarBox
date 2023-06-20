import 'package:bazaarboxapp/services/item_entity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ItemScreenProvider {
  // ItemScreenProvider() {
  //   getItemsNow();
  // }

  bool isLoading = false;
  void updateLoading(bool value) {
    isLoading = value;
  }

  // bool errorCheck = false;
  // void updateErrorHappenened(bool value) {
  //   errorCheck = value;
  //   notifyListeners();
  // }

  List<ItemEntity> itemsList = [];
  void updateItemList(ItemEntity itemEntityTemp) {
    itemsList = [];
    itemsList.add(itemEntityTemp);
  }

  void disposeAll() {
    itemsList = [];
  }

  String generalErrorMessage = "";
  void updateErrorMessage(String value) {
    generalErrorMessage = value;
  }

  final http.Client client = http.Client();
  Future<void> getItemNow(int id) async {
    try {
      updateLoading(true);

      final response = await client.get(
        Uri.parse("http://10.0.2.2:3004/getOneItem/$id"),
      );

      if (response.statusCode == 200) {
        try {
          print(response.body);
          updateItemList(singleItemEntityFromJson(response.body));
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
