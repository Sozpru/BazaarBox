import 'package:bazaarboxapp/providers/get_item_provider.dart';
import 'package:bazaarboxapp/providers/search_provider.dart';
import 'package:bazaarboxapp/views/item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:debounce_builder/debounce_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.only(left: 3.w, right: 3.w),
              child:
                  // ChangeNotifierProvider(
                  //     create: (context) =>
                  //         SearchScreenProvider(), //change builder to create
                  //     child:
                  Consumer<SearchScreenProvider>(
                      builder: (context, searchProvider, child) {
                return searchProvider.isLoading
                    ? const Center(
                        child: Text(
                          "Loading...",
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    : searchProvider.generalErrorMessage != ""
                        ? Center(
                            child: Text(
                              searchProvider.generalErrorMessage,
                              style: const TextStyle(fontSize: 20),
                            ),
                          )
                        : Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 2.w,
                                      right: 2.w,
                                      bottom: 2.h,
                                      top: 1.5.h),
                                  child: DebounceBuilder(
                                      delay: const Duration(milliseconds: 500),
                                      builder: (context, debounce) {
                                        return TextFormField(
                                          autocorrect: false,
                                          //initialValue: '',
                                          controller:
                                              searchProvider.keywordController,
                                          onChanged: (str) {
                                            Provider.of<SearchScreenProvider>(
                                                    context,
                                                    listen: false)
                                                .searchItemsNow(str.trim());
                                            debounce(() => Provider.of<
                                                        SearchScreenProvider>(
                                                    context,
                                                    listen: false)
                                                .searchItemsNow(str.trim()));
                                          },
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              hintText: "Search Here...",
                                              //labelText: 'Label text',
                                              errorText: null,
                                              //border: OutlineInputBorder(),
                                              suffixIcon:
                                                  const Icon(Icons.search)),
                                        );
                                      }),
                                ),
                                searchProvider.keywordController.text == ""
                                    ? const Expanded(
                                        child: Center(
                                          child: Text(
                                            "Type Something to Search",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      )
                                    : searchProvider.itemsList.isEmpty
                                        ? const Expanded(
                                            child: Center(
                                              child: Text(
                                                "There are no items!",
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          )
                                        : Expanded(
                                            child: GridView.count(
                                              // crossAxisCount is the number of columns
                                              crossAxisCount: 2,
                                              // This creates two columns with two items in each column
                                              children: List.generate(
                                                  searchProvider.itemsList
                                                      .length, (index) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ItemScreen(
                                                                itemID: searchProvider
                                                                    .itemsList
                                                                    .elementAt(
                                                                        index)
                                                                    .id,
                                                              )),
                                                    );
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      height: 100,
                                                      //width: MediaQuery.of(context).size.width * 0.45,
                                                      decoration: BoxDecoration(
                                                        color: const Color
                                                                .fromARGB(
                                                            255, 217, 217, 217),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            blurRadius: 4,
                                                            color: Color(
                                                                0x3600000F),
                                                            offset:
                                                                Offset(0, 2),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            8),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8),
                                                                  ),
                                                                  child: searchProvider
                                                                          .isLoading
                                                                      ? Image
                                                                          .asset(
                                                                          "assets/images/car.jpeg",
                                                                          height:
                                                                              14.h,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        )
                                                                      : CachedNetworkImage(
                                                                          imageUrl: searchProvider
                                                                              .itemsList
                                                                              .elementAt(index)
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
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                        8,
                                                                        4,
                                                                        0,
                                                                        0),
                                                                child:
                                                                    Container(
                                                                  constraints:
                                                                      BoxConstraints(
                                                                          maxWidth:
                                                                              40.w),
                                                                  child: Text(
                                                                    searchProvider
                                                                        .itemsList
                                                                        .elementAt(
                                                                            index)
                                                                        .itemName,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    maxLines: 1,
                                                                    style: TextStyle(
                                                                        fontSize: 1.3
                                                                            .h
                                                                            .sp),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                        8,
                                                                        4,
                                                                        0,
                                                                        0),
                                                                child:
                                                                    Container(
                                                                  constraints:
                                                                      BoxConstraints(
                                                                          maxWidth:
                                                                              40.w),
                                                                  child: Text(
                                                                    '\$${searchProvider.itemsList.elementAt(index).price}',
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
                          );
              })) //
          ),
    );
  }
}
