import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(children: [
          SizedBox(
            height: 5.h,
          ),
          Image.asset("assets/images/bbicon.png"),
          SizedBox(
            width: 100.w,
            child: Padding(
              padding: EdgeInsets.only(left: 3.h, bottom: 1.h, top: 2.h),
              child: const Text(
                "Welcome to BazaarBox!",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 3.h, left: 3.h),
            child: const Text(
              "Here you can manage your apps inventory. Feature like Viewing All Items, Adding Items, Updating Items, Deleting Items, Searching For a Particular Item and Modifying it's Information",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Container(
            width: 100.w,
            child: Padding(
              padding: EdgeInsets.only(right: 3.h, left: 3.h),
              child: const Text(
                "Assignment: ",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          SizedBox(
            width: 100.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 3.h),
                  child: const Text(
                    "Course: ",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const Text(
                  "Software Construction",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          SizedBox(
            width: 100.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 3.h),
                  child: const Text(
                    "Task: ",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const Text(
                  "Frameworks & RESTful Web Services",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          SizedBox(
            width: 100.w,
            child: Padding(
              padding: EdgeInsets.only(left: 3.h),
              child: const Text(
                "Description:",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Padding(
            padding: EdgeInsets.only(right: 3.h, left: 3.h),
            child: const Text(
              "This is a Flutter Application (Frontend) which is connected to a NodeJS Express Backend. The Backend is implemented by using RESTful Web Services, it retrieves data from PostgreSQL database. This app mainly has FIVE functionalities: ",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          SizedBox(
            width: 100.w,
            child: Padding(
              padding: EdgeInsets.only(right: 3.h, left: 3.h),
              child: const Text(
                '''
 - Get all Items + Get one item
 - Add Item   (RESTful Web Services)
 - Update Item
 - Delete Item (RESTful Web Services)
 - Search for Item  
            ''',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 3.h, left: 3.h),
            child: const Text(
              "Two of those features are implemented in RESTful Web services, the rest of the functionalities are created normally. ",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
        ]),
      ),
    );
  }
}
