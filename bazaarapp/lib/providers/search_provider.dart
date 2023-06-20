import 'package:bazaarboxapp/services/item_entity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchScreenProvider with ChangeNotifier {
  bool isLoading = false;
  void updateLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  List<ItemEntity> itemsList = [];
  void updateItemList(List<ItemEntity> itemEntityTemp) {
    itemsList = itemEntityTemp;

    notifyListeners();
  }

  final TextEditingController keywordController = TextEditingController();
  void updateKeywordController(String value) {
    keywordController.text = value;
    notifyListeners();
  }

  String generalErrorMessage = "";
  void updateErrorMessage(String value) {
    generalErrorMessage = value;
    notifyListeners();
  }

  final http.Client client = http.Client();
  Future<void> searchItemsNow(String keyword) async {
    try {
      final response = await client.get(
        Uri.parse("http://10.0.2.2:3004/SearchForItem/$keyword"),
      );

      if (response.statusCode == 200) {
        try {
          updateItemList(itemEntityFromJson(response.body));
        } catch (e) {
          debugPrint(e.toString());
        }
      } else {
        debugPrint(response.reasonPhrase);
      }
    } catch (e) {
      updateErrorMessage("Something went wrong");
    }
  }
}
