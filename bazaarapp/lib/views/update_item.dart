import 'dart:math';

import 'package:bazaarboxapp/providers/update_item_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class UpdateItemScreen extends StatefulWidget {
  const UpdateItemScreen(
      {super.key,
      required this.itemID,
      required this.title,
      required this.price,
      required this.category,
      required this.description,
      required this.imageUrl});
  final int itemID;
  final String title;
  final String price;
  final String category;
  final String description;
  final String imageUrl;

  @override
  State<UpdateItemScreen> createState() => _UpdateItemScreenState();
}

class _UpdateItemScreenState extends State<UpdateItemScreen> {
  List<String> stringList = [
    'https://pyxis.nymag.com/v1/imgs/3ff/7ee/ac9dbcc2ad5a8f679072c2d8ce0fef4063-bic-pregnancy.2x.rhorizontal.w700.jpg',
    'https://www.apple.com/newsroom/images/product/iphone/standard/Apple-iPhoneSE-hero-3up-220308_big.jpg.large_2x.jpg',
    'https://www.apple.com/newsroom/images/product/iphone/standard/Apple-iPhoneSE-color-lineup-4up-220308_big.jpg.large_2x.jpg',
    'https://st3.depositphotos.com/4528771/34916/i/450/depositphotos_349160394-stock-photo-top-view-fruits-texture-close.jpg',
    "https://c.pxhere.com/photos/43/2e/art_materials_colored_pens_colorful_coloring_pens_colors_colourful_pens_stationery-1076436.jpg!d",
    "https://assets.haribo.com/image/upload/s--zUQJjt3r--/ar_4:3,c_fill,f_auto/w_1500/v1/consumer-sites/general/Facts/fruchtgummi_baeren_bunt.jpg",
    "https://media.cnn.com/api/v1/images/stellar/prod/210520053920-restricted-02-lego-lgbtq-set-pride-intl.jpg?q=w_4016,h_3011,x_0,y_0,c_fill/w_1280",
    "https://www.parents.com/thmb/ho9yzQCcRUvY3xeAQ3pVupkVhEU=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/BestSkinCareKids2021-2000-397af51d647640629d86023230584e79.jpg",
    "https://storage.googleapis.com/gweb-uniblog-publish-prod/images/2022-Devices_Header.width-2000.format-webp.webp",
    "https://usercontent.one/wp/mariannetaylor.co.uk/wp-content/uploads/2019/09/Colourful-content-creation-for-Peaches-Cream-cosmetics.-Styled-stills-product-photography-by-Marianne-Taylor._0005.jpg?media=1637181377",
    "https://cdn.shopify.com/s/files/1/0070/7032/files/trending-products_c8d0d15c-9afc-47e3-9ba2-f7bad0505b9b.png?format=jpg&quality=90&v=1614559651",
    "https://wpblog.zyro.com/cdn-cgi/image/w=700,q=85/wp-content/uploads/2020/05/body-oil-beauty-product.jpg",
    "https://www.dropee.com/pages/wp-content/uploads/2023/02/pexels-karolina-grabowska-4202926-1024x683.jpg",
    "https://luxurywatchesusa.com/wp-content/uploads/2021/02/buy-watches-luxury-watches-usa.jpg",
    "https://i.insider.com/5f3165fe1918241f043100be?width=700",
    "https://images.pexels.com/photos/35967/mini-cooper-auto-model-vehicle.jpg?cs=srgb&dl=pexels-pixabay-35967.jpg&fm=jpg",
    "https://assets-eu-01.kc-usercontent.com/3b3d460e-c5ae-0195-6b86-3ac7fb9d52db/819061b6-7d77-4e3b-96af-1075fb2de5cb/Bugatti%20Chiron%20Super%20Sport%20300%2B.jpeg?width=800&fm=jpg&auto=format",
    "https://food-guide.canada.ca/themes/custom/wxtsub_bootstrap/images/food_guide_visual_en.png",
    "https://cdn.britannica.com/98/235798-050-3C3BA15D/Hamburger-and-french-fries-paper-box.jpg",
  ];

  String selectedImage = "";

  String getRandomString() {
    Random random = Random();
    int randomIndex = random.nextInt(stringList.length);
    setState(() {
      selectedImage = stringList[randomIndex];
    });
    return stringList[randomIndex];
  }

  @override
  void initState() {
    super.initState();
    getRandomString();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = UpdateItemScreenProvider();
      //  Provider.of<UpdateItemScreenProvider>(context, listen: false);
      provider.updateTitleController(widget.title);
      provider.updatePriceController(widget.price);
      provider.updateCategoryController(widget.category);
      provider.updateDescriptionController(widget.description);
      provider.updateImage(widget.imageUrl);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.only(left: 4.h),
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 30.0,
                ),
              )),
          backgroundColor: Color.fromARGB(255, 219, 254, 255),
          title: Text(
            "Update/Edit Item",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
        ),
        body: ChangeNotifierProvider(
            create: (context) =>
                UpdateItemScreenProvider(), //change builder to create
            child: Consumer<UpdateItemScreenProvider>(
                builder: (context, updateProvider, child) {
              return Container(
                  width: 100.w,
                  height: 100.h,
                  color: const Color.fromARGB(255, 219, 254, 255),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 3.h,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25.0),
                          child: SizedBox(
                            width: 85.w,
                            height: 30.h,
                            child: CachedNetworkImage(
                              imageUrl: updateProvider.selectedURL,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) => Image.asset(
                                "assets/images/car.jpeg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            updateProvider.updateImage(getRandomString());
                          },
                          child: const Text("Change Image"),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          width: 85.w,
                          constraints: BoxConstraints(maxWidth: 84.w),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 1.h),
                            child: const Text(
                              "Title:",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 7.5.w, right: 7.5.w),
                          child: TextFormField(
                            //initialValue: '',
                            controller: updateProvider.titleController,
                            decoration: InputDecoration(
                              hintText: "Item Title",
                              //labelText: 'Label text',
                              errorText: null,
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Container(
                          width: 85.w,
                          constraints: BoxConstraints(maxWidth: 84.w),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 1.h),
                            child: const Text(
                              "Price:",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 7.5.w, right: 7.5.w),
                          child: TextFormField(
                            controller: updateProvider.priceController,
                            decoration: const InputDecoration(
                              hintText: "Item Price",
                              errorText: null,
                              border: OutlineInputBorder(),
                              suffixIcon: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  "\$",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          width: 85.w,
                          constraints: BoxConstraints(maxWidth: 84.w),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 1.h),
                            child: const Text(
                              "Category:",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 7.5.w, right: 7.5.w),
                          child: TextFormField(
                            controller: updateProvider.categoryController,
                            decoration: const InputDecoration(
                              hintText: "Item Category",
                              errorText: null,
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          width: 85.w,
                          constraints: BoxConstraints(maxWidth: 84.w),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 1.h),
                            child: const Text(
                              "Description:",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 7.5.w, right: 7.5.w),
                          child: TextFormField(
                            controller: updateProvider.descriptionController,
                            keyboardType: TextInputType.multiline,
                            maxLines: 8,
                            decoration: const InputDecoration(
                              hintText: "Item Description",
                              errorText: null,
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3.w,
                        ),
                        updateProvider.generalErrorMessage == ""
                            ? const SizedBox.shrink()
                            : SizedBox(
                                width: 100.w,
                                child: Padding(
                                  padding: EdgeInsets.all(7.5.w),
                                  child: Text(
                                    updateProvider.generalErrorMessage,
                                    style: const TextStyle(
                                        color: Colors.red, fontSize: 15),
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: 1.w,
                        ),
                        SizedBox(
                          height: 5.h,
                          width: 85.w,
                          child: ElevatedButton(
                            child: const Text("Update Item"),
                            onPressed: () async {
                              if (await updateProvider.updateItemNow(
                                  widget.itemID, context)) {
                                Get.back();
                                setState(() {});
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                      ],
                    ),
                  ));
            })) //
        );
  }
}
