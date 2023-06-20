import 'package:bazaarboxapp/providers/navbar_provider.dart';
import 'package:bazaarboxapp/services/item_entity.dart';
import 'package:bazaarboxapp/views/home.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AddItemScreenProvider with ChangeNotifier {
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
  Future<void> addItemNow(BuildContext context) async {
    try {
      if (titleController.text == "" ||
          priceController.text == "" ||
          categoryController.text == "" ||
          descriptionController.text == "") {
        updateErrorMessage("Please enter all the fields above!");
      } else if (!containsOnlyNumbers(priceController.text)) {
        updateErrorMessage("Price should be a number");
      } else {
        final body = {
          'item_name': titleController.text,
          'description': descriptionController.text,
          'price': priceController.text,
          'image_url': selectedURL,
          'category': categoryController.text
        };

        final response = await client
            .post(Uri.parse("http://10.0.2.2:3004/item"), body: body);

        if (response.statusCode == 201) {
          try {
            //adsf
            updateErrorMessage("");
            print("works");
            final provider = Provider.of<BottomNavigationBarProvider>(context,
                listen: false);
            provider.updateCurrentIndex(0);
          } catch (e) {
            debugPrint(e.toString());
          }
        } else {
          debugPrint(response.reasonPhrase);
          debugPrint(response.statusCode.toString());
        }
      }
    } catch (e) {
      updateErrorMessage("Something went wrong");
    }
  }
}
