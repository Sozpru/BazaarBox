import 'package:bazaarboxapp/providers/navbar_provider.dart';
import 'package:bazaarboxapp/services/item_entity.dart';
import 'package:bazaarboxapp/views/home.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class UpdateItemScreenProvider with ChangeNotifier {
  bool isLoading = false;
  void updateLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  String selectedURL =
      'https://www.apple.com/newsroom/images/product/iphone/standard/Apple-iPhoneSE-color-lineup-4up-220308_big.jpg.large_2x.jpg';
  void updateImage(String value) {
    selectedURL = value;
    notifyListeners();
  }

  final TextEditingController titleController = TextEditingController();
  void updateTitleController(String value) {
    titleController.text = value;
    notifyListeners();
  }

  final TextEditingController priceController = TextEditingController();
  void updatePriceController(String value) {
    priceController.text = value;
    notifyListeners();
  }

  final TextEditingController categoryController = TextEditingController();
  void updateCategoryController(String value) {
    categoryController.text = value;
    notifyListeners();
  }

  final TextEditingController descriptionController = TextEditingController();
  void updateDescriptionController(String value) {
    descriptionController.text = value;
    notifyListeners();
  }

  String generalErrorMessage = "";
  void updateErrorMessage(String value) {
    generalErrorMessage = value;
    notifyListeners();
  }

  bool containsOnlyNumbers(String input) {
    final regex = RegExp(r'^[0-9]+$');
    return regex.hasMatch(input);
  }

  final http.Client client = http.Client();
  Future<bool> updateItemNow(int itemID, BuildContext context) async {
    try {
      if (titleController.text == "" ||
          priceController.text == "" ||
          categoryController.text == "" ||
          descriptionController.text == "") {
        updateErrorMessage("Please enter all the fields above!");
        return false;
      } else if (!containsOnlyNumbers(priceController.text)) {
        updateErrorMessage("Price should be a number");
        return false;
      } else {
        final body = {
          'item_name': titleController.text,
          'description': descriptionController.text,
          'price': priceController.text,
          'image_url': selectedURL,
          'category': categoryController.text
        };

        final response = await client.put(
            Uri.parse("http://10.0.2.2:3004/updateItem/$itemID"),
            body: body);

        if (response.statusCode == 200) {
          try {
            //adsf
            updateErrorMessage("");
            print("heeyyy");
            return true;
          } catch (e) {
            debugPrint(e.toString());
            return false;
          }
        } else {
          debugPrint(response.reasonPhrase);
          debugPrint(response.statusCode.toString());
          return false;
        }
      }
    } catch (e) {
      updateErrorMessage("Something went wrong");
      return false;
    }
  }
}
