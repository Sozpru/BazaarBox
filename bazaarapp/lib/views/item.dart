import 'dart:io';

import 'package:bazaarboxapp/providers/delete_item_provider.dart';
import 'package:bazaarboxapp/providers/get_item_provider.dart';
import 'package:bazaarboxapp/views/update_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sizer/sizer.dart';

class ItemScreen extends StatefulWidget {
  ItemScreen({super.key, required this.itemID}) {
    print("asdf");
  }
  final int itemID;

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  bool _isShown = false;
  ItemScreenProvider isp = ItemScreenProvider();
  int temp = 9;

  void _delete(BuildContext context) {
    if (!Platform.isIOS) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Please Confirm'),
          content: const Text('This item will be deleted, you sure?'),
          actions: <Widget>[
            TextButton(
              child: const Text("No"),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            TextButton(
              child: const Text(
                "Yes",
                style: TextStyle(color: Colors.redAccent),
              ),
              onPressed: () async {
                await deleteThisNow(widget.itemID, context);
                Navigator.of(context).pop(true);
              },
            ),
          ],
        ),
      );
    } else {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Please Confirm'),
          content: const Text('This item will be deleted, you sure?'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text("No"),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            CupertinoDialogAction(
              child: const Text(
                "Yes",
                style: TextStyle(color: Colors.redAccent),
              ),
              onPressed: () async {
                await deleteThisNow(widget.itemID, context);
                Navigator.of(context).pop(true);
              },
            ),
          ],
        ),
      );
    }

    // todo : showDialog for ios
  }

  @override
  void initState() {
    // setState(() {
    //   isp.getItemNow(widget.itemID);
    // });
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   print("asdf");
    //   print(widget.itemID);
    //   setState(() {
    //     isp.getItemNow(widget.itemID);
    //   });
    // });
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          isp.getItemNow(widget.itemID);
        }));
  }

  @override
  Widget build(BuildContext context) {
    // temp = 8;
    // setState(() {
    //   isp.getItemNow(widget.itemID);
    // });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 219, 254, 255),
        leading: GestureDetector(
            onTap: () {
              isp.disposeAll();
              setState(() {});
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.only(left: 4.h),
              child: const Icon(
                Icons.arrow_back_ios,
                size: 30.0,
              ),
            )),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isp.getItemNow(widget.itemID);
                  });
                },
                child: const Icon(
                  Icons.refresh,
                  size: 30.0,
                  color: Colors.black,
                ),
              )),
          isp.itemsList.isNotEmpty
              ? Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      _delete(context);
                    },
                    child: const Icon(
                      Icons.delete_rounded,
                      size: 30.0,
                      color: Color.fromARGB(255, 254, 113, 113),
                    ),
                  ))
              : const SizedBox.shrink(),
          isp.itemsList.isNotEmpty
              ? Padding(
                  padding: EdgeInsets.only(right: 4.h),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(UpdateItemScreen(
                        itemID: widget.itemID,
                        title: isp.itemsList.elementAt(0).itemName,
                        category: isp.itemsList.elementAt(0).category,
                        description: isp.itemsList.elementAt(0).description,
                        price: isp.itemsList.elementAt(0).price.toString(),
                        imageUrl: isp.itemsList.elementAt(0).imageUrl,
                      ));
                    },
                    child: const Icon(Icons.edit_note, size: 30.0),
                  ))
              : const SizedBox.shrink(),
        ],
        automaticallyImplyLeading: true,
      ),
      body: Container(
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
                      imageUrl: isp.itemsList.isNotEmpty
                          ? isp.itemsList.elementAt(0).imageUrl
                          : "https://www.searchenginejournal.com/wp-content/uploads/2019/07/the-essential-guide-to-using-images-legally-online-1520x800.webp",
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => Image.asset(
                        "assets/images/car.jpeg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  width: 85.w,
                  constraints: BoxConstraints(maxWidth: 84.w),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 1.h),
                    child: Text(
                      isp.itemsList.isNotEmpty
                          ? isp.itemsList.elementAt(0).itemName
                          : "...",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Container(
                  width: 84.w,
                  constraints: BoxConstraints(maxWidth: 84.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Price: ",
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        isp.itemsList.isNotEmpty
                            ? isp.itemsList.elementAt(0).price.toString()
                            : "...",
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "\$",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  width: 84.w,
                  constraints: BoxConstraints(maxWidth: 84.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Category: ",
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        isp.itemsList.isNotEmpty
                            ? isp.itemsList.elementAt(0).category
                            : "...",
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  width: 84.w,
                  constraints: BoxConstraints(maxWidth: 84.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Description: ",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        isp.itemsList.isNotEmpty
                            ? isp.itemsList.elementAt(0).description
                            : "..........  Please Refresh  ........",
                        textAlign: TextAlign.justify,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          )),
    );
  }
}
