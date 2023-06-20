import 'package:bazaarboxapp/providers/home_provider.dart';
import 'package:bazaarboxapp/providers/navbar_provider.dart';
import 'package:bazaarboxapp/views/item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<HomeScreenProvider>(context, listen: false);
      provider.getItemsNow();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ChangeNotifierProvider(
                create: (context) =>
                    HomeScreenProvider(), //change builder to create
                child: Consumer<HomeScreenProvider>(
                    builder: (context, homeProvider, child) {
                  return homeProvider.isLoading
                      ? const Center(
                          child: Text(
                            "Loading...",
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      : homeProvider.generalErrorMessage != ""
                          ? Center(
                              child: Text(
                                homeProvider.generalErrorMessage,
                                style: const TextStyle(fontSize: 20),
                              ),
                            )
                          : Center(
                              child: Padding(
                                padding: EdgeInsets.only(left: 3.w, right: 3.w),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                            width: 70.w,
                                            child: Image.asset(
                                                "assets/images/bbicon.png")),
                                        Padding(
                                          padding: EdgeInsets.only(right: 5.w),
                                          child: GestureDetector(
                                            onTap: () {
                                              homeProvider.getItemsNow();
                                            },
                                            child: const Icon(
                                              Icons.refresh,
                                              size: 30.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Expanded(
                                      child: GridView.count(
                                        // crossAxisCount is the number of columns
                                        crossAxisCount: 2,
                                        // This creates two columns with two items in each column
                                        children: List.generate(
                                            homeProvider.itemsList.length,
                                            (index) {
                                          return GestureDetector(
                                            onTap: () async {
                                              setState(() {});
                                              Get.to(ItemScreen(
                                                      itemID: homeProvider
                                                          .itemsList
                                                          .elementAt(index)
                                                          .id))
                                                  ?.then(
                                                (value) => setState(() {
                                                  print("asdfasdf");
                                                  final provider = Provider.of<
                                                          BottomNavigationBarProvider>(
                                                      context,
                                                      listen: false);
                                                  provider
                                                      .updateCurrentIndex(0);
                                                }),
                                              );
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: 100,
                                                //width: MediaQuery.of(context).size.width * 0.45,
                                                decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      255, 217, 217, 217),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      blurRadius: 4,
                                                      color: Color(0x3600000F),
                                                      offset: Offset(0, 2),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          0),
                                                              topLeft: Radius
                                                                  .circular(8),
                                                              topRight: Radius
                                                                  .circular(8),
                                                            ),
                                                            child: homeProvider
                                                                    .isLoading
                                                                ? Image.asset(
                                                                    "assets/images/car.jpeg",
                                                                    height:
                                                                        14.h,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  )
                                                                : CachedNetworkImage(
                                                                    imageUrl: homeProvider
                                                                        .itemsList
                                                                        .elementAt(
                                                                            index)
                                                                        .imageUrl,
                                                                    height:
                                                                        14.h,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                  8, 4, 0, 0),
                                                          child: Container(
                                                            constraints:
                                                                BoxConstraints(
                                                                    maxWidth:
                                                                        40.w),
                                                            child: Text(
                                                              homeProvider
                                                                  .itemsList
                                                                  .elementAt(
                                                                      index)
                                                                  .itemName,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 1,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      1.3.h.sp),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                  8, 4, 0, 0),
                                                          child: Container(
                                                            constraints:
                                                                BoxConstraints(
                                                                    maxWidth:
                                                                        40.w),
                                                            child: Text(
                                                              '\$${homeProvider.itemsList.elementAt(index).price}',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 1,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      10.sp),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                }))));
  }
}
