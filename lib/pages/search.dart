import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:realeastapp/utils/app_assets.dart';
import 'package:realeastapp/utils/tripple_rail.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  dynamic investMentProperties = [];
  bool isloading = false;
  String _allInstallments = '';
  final List<String> _dropdownItems = ['', 'Yes', 'No'];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _sizeController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _sizeController.dispose();
    _typeController.dispose();
    _priceController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _handleSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      addPrpperties(context);
      // Close the modal after successful submission
      Navigator.of(context).pop();
    } else {
      return;
    }
  }

  Future<dynamic> addPrpperties(BuildContext context) async {
    try {
      setState(() {
        isloading = true;
      });
      final netClient = http.Client();
      final url =
          Uri.parse('https://2f86-212-100-86-17.ngrok-free.app/api/Properties');
      final Map<String, dynamic> paylaod = {
        "propertyType": _typeController.text,
        "size": int.parse(_sizeController.text),
        "price": double.parse(_priceController.text),
        "location": _locationController.text,
        "description": _descriptionController.text,
        "sellingPrice": double.parse(_priceController.text),
        "offeringPrice": double.parse(_priceController.text),
        "allowInstallments": _allInstallments == 'YES' ? 1 : 0
      };
      var response = await http.post(url, body: json.encode(paylaod),
      
       headers: {
      "content-type": "application/json",
    },);
      if (response.statusCode == 200 || response.statusCode == 201) {
        setState(() {
          isloading = false;
        });
        getPrpperties();
        if (kDebugMode) {
          print('Response status: ${response.statusCode}');
          print('Response body: ${response.body}');
        }
      } else {
        setState(() {
          isloading = false;
        });
      }
    } catch (e, stk) {
      setState(() {
        isloading = false;
      });
      print('Response body: ${stk}');
    }
  }

  Future<dynamic> getPrpperties() async {
    try {
      setState(() {
        isloading = true;
      });
      final netClient = http.Client();
      final url =
          Uri.parse('https://2f86-212-100-86-17.ngrok-free.app/api/Properties');

      var response = await netClient.get(url);
      if (response.statusCode == 200) {
        setState(() {
          isloading = false;
          investMentProperties = jsonDecode(response.body);
        });

        if (kDebugMode) {
          print('Response status: ${response.statusCode}');
          print('Response body: ${response.body}');
        }
      } else {
        setState(() {
          isloading = false;
        });
        investMentProperties = [];
      }
    } catch (e, stk) {
      setState(() {
        isloading = false;
        investMentProperties = [];
      });
      print('Response body: ${stk}');
    }
  }

  @override
  void initState() {
    super.initState();
    getPrpperties();
  }

  void showMyModal(
    BuildContext context,
// Function(String name, String email, String phone, String address, String city) onSubmit
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Enter Details'),
        content: SingleChildScrollView(
          // Allow scrolling if content overflows
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Align(
                child: isloading
                    ? const CircularProgressIndicator.adaptive(
                        backgroundColor: Color(0xff1F4C6B),
                        strokeWidth: 50,
                        value: 20,
                      )
                    : const SizedBox.shrink(),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize
                      .min, // Prevent modal from expanding unnecessarily
                  children: [
                    TextFormField(
                      controller: _typeController,
                      decoration:
                          const InputDecoration(labelText: 'Property type'),
                      validator: (value) =>
                          value!.isEmpty ? 'Type is required' : null,
                    ),
                    TextFormField(
                      controller: _sizeController,
                      decoration: const InputDecoration(labelText: 'Size'),
                      keyboardType: TextInputType.name,
                      validator: (value) =>
                          value!.isEmpty ? 'Sq. Meter size' : null,
                    ),
                    TextFormField(
                      controller: _priceController,
                      decoration: const InputDecoration(labelText: 'Ask Price'),
                      keyboardType: TextInputType.number,
                      validator: (value) =>
                          value!.isEmpty ? 'Price is required' : null,
                    ),
                    TextFormField(
                      controller: _locationController,
                      decoration: const InputDecoration(labelText: 'Location'),
                      maxLines: null, // Enable multiline input
                      validator: (value) =>
                          value!.isEmpty ? 'Location is required' : null,
                    ),
                    TextFormField(
                      controller: _descriptionController,
                      decoration:
                          const InputDecoration(labelText: 'Description'),
                      validator: (value) =>
                          value!.isEmpty ? 'Description is required' : null,
                    ),

                    const SizedBox(
                        height: 16.0), // Add some spacing after form fields
                    DropdownButtonFormField<String>(
                      value: _allInstallments, // Set initial value
                      items: _dropdownItems
                          .map((String value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              ))
                          .toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _allInstallments = newValue!;
                        });
                      },
                      decoration: const InputDecoration(
                          labelText: 'Allow installments'),
                      validator: (value) =>
                          value!.isEmpty ? 'Selection is required' : null,
                    ),
                    const SizedBox(height: 16.0),
                    const SizedBox(
                        height: 16.0), // Add some spacing after form fields
                    ElevatedButton(
                      onPressed: () => _handleSubmit(context),
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool searchisempty = false;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: ()=>getPrpperties(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => showMyModal(context),
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xff1F4C6B),
          child: const Icon(Icons.add),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TrippleRail(
                leading: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(context);
                  },
                  child: Container(
                    height: 50.0,
                    width: 61,
                    decoration: const BoxDecoration(
                        color: Color(0xffF5F4F8),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )),
                    child: Center(
                      child: SvgPicture.asset(AppAssets.back),
                    ),
                  ),
                ),
                middle: Text(
                  "Search results",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.black),
                ),
                leadingExpanded: true,
                trailExpanded: true,
                trailing: Container(
                  height: 50.0,
                  width: 61,
                  decoration: const BoxDecoration(
                      color: Color(0xffF5F4F8),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      )),
                  child: Center(
                    child: SvgPicture.asset(AppAssets.settings),
                  ),
                ),
              ),
      
              ///Search Field
              Container(
                decoration: const BoxDecoration(
                    color: Color(0xffF5F4F8),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: null,
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            filled: false,
                            hintStyle: TextStyle(
                              color: Colors.black.withOpacity(
                                0.5,
                              ),
                              fontSize: 16,
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffF5F4F8), width: 0.00001),
                            ),
      
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffF5F4F8),
                              ),
                            ),
                            // fillColor: AppColors.grey.withOpacity(0.2),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffF5F4F8), width: 0.00001),
                            ),
                            // enabledBorder: InputBorder.none,
                            hintText: 'Search',
                            // prefixIcon: const Icon(
                            //   CupertinoIcons.search,
                            //   color: Colors.black,
                            // ),
                            // suffixIcon: false
                            //     ? IconButton(
                            //         icon: const Icon(
                            //           Icons.cancel,
                            //         ),
                            //         onPressed: () {
                            //           // setState(
                            //           //   () {
                            //           //     _searchBoxController.clear();
                            //           //     _showCancelIcon = false;
                            //           //     setState(() {
                            //           //       sheetFilteredListOfBanks =
                            //           //           widget.banks!;
                            //           //     });
                            //           //   },
                            //           // );
                            //         },
                            //       )
                            //     : null,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              (investMentProperties == null || isloading)
                  ? const SizedBox.shrink()
                  : Row(
                      children: [
                        Text('Found ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black)),
                        Text('${investMentProperties['data'].length ?? 0}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                        Text(' propeties ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black)),
                      ],
                    ),
              const SizedBox(
                height: 10,
              ),
      
              searchisempty == true
                  ? Expanded(
                      child: SizedBox(
                        // color: Colors.amber,
                        height: 209,
                        width: MediaQuery.of(context).size.height,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(100)),
                                child: Center(
                                    child: Text('!',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 24))),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Search ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 25,
                                              color: Colors.black26)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Not found",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '''sorry, we can’t find the real estates \nyou are looking for. Maybe, a little \nspelling mistake?''',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            fontSize: 12, color: Colors.black38),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : (investMentProperties == null || isloading)
                      ? const Center(
                          child: CircularProgressIndicator.adaptive(
                          backgroundColor: Color(0xff1F4C6B),
                          strokeWidth: 50,
                          value: 20,
                        ))
                      : Expanded(
                          child: MasonryGridView.builder(
                              padding: const EdgeInsets.symmetric(horizontal: 0),
                              physics: const BouncingScrollPhysics(),
                              itemCount: investMentProperties['data'].length,
                              gridDelegate:
                                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                final props = investMentProperties['data'][index];
                                return Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    height: 251,
                                    width: 175,
                                    decoration: const BoxDecoration(
                                        color: Color(0xffF5F4F8),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25))),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 175,
                                            width: 160,
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      AppAssets.bungalow),
                                                  fit: BoxFit.cover,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(25))),
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: SvgPicture.asset(
                                                        AppAssets.favorite),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10,
                                                        vertical: 10),
                                                    child: Container(
                                                      height: 35,
                                                      width: 90,
                                                      decoration:
                                                          const BoxDecoration(
                                                              color: Color(
                                                                  0xff1F4C6B),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              8))),
                                                      child: Center(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              "\$",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 1,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodySmall
                                                                  ?.copyWith(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .white),
                                                            ),
                                                            SizedBox(
                                                              width: 50,
                                                              child: Text(
                                                                "${props['price']}",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 1,
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodySmall
                                                                    ?.copyWith(
                                                                        fontSize:
                                                                            12,
                                                                        color: Colors
                                                                            .white),
                                                              ),
                                                            ),
                                                            // Text(
                                                            //   "/month",
                                                            //   overflow:
                                                            //       TextOverflow
                                                            //           .ellipsis,
                                                            //   maxLines: 1,
                                                            //   style: Theme.of(
                                                            //           context)
                                                            //       .textTheme
                                                            //       .bodySmall
                                                            //       ?.copyWith(
                                                            //           fontSize:
                                                            //               12,
                                                            //           color: Colors
                                                            //               .white),
                                                            // ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 120,
                                                child: Text(
                                                  "${props['propertyType']}",
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.copyWith(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.star_rate,
                                                color: Colors.amber,
                                                size: 20,
                                              ),
                                              const SizedBox(
                                                width: 3,
                                              ),
                                              Text(
                                                '4.4',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall
                                                    ?.copyWith(
                                                        color: Colors.black),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              SvgPicture.asset(
                                                AppAssets.location,
                                                height: 10,
                                              ),
                                              const SizedBox(
                                                width: 2,
                                              ),
                                              Text(
                                                "${props['location']}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall
                                                    ?.copyWith(
                                                        color: Colors.black),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              })),
              //   ListView.builder(
              //   itemCount: 1,
              //   itemBuilder: (context, index) {
              //     return Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              // Container(
              //   height: 251,
              //   width: 175,
              //   decoration: const BoxDecoration(
              //       color: Color(0xffF5F4F8),
              //       borderRadius:
              //           BorderRadius.all(Radius.circular(25))),
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(
              //         horizontal: 10, vertical: 10),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Container(
              //           height: 175,
              //           width: 160,
              //           decoration: const BoxDecoration(
              //               image: DecorationImage(
              //                 image: AssetImage(AppAssets.bungalow),
              //                 fit: BoxFit.cover,
              //               ),
              //               borderRadius: BorderRadius.all(
              //                   Radius.circular(25))),
              //                   child: Stack(children: [
              //                     Align(
              //                       alignment: Alignment.topRight,
              //                       child: Padding(
              //                         padding: const EdgeInsets.all(8.0),
              //                         child: SvgPicture.asset(AppAssets.favorite),
              //                       ),),
      
              //                         Align(
              //                       alignment: Alignment.bottomRight,
              //                       child: Padding(
              //                         padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              //                         child:Container(
              //   height: 35,
              //   width: 90,
              //   decoration: const BoxDecoration(
              //       color: Color(0xff1F4C6B),
              //       borderRadius:
              //           BorderRadius.all(Radius.circular(8))),
              //           child: Center(
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                   Text(
              //                   "\$",
              //                   overflow: TextOverflow.ellipsis,
              //                   maxLines: 1,
              //                   style: Theme.of(context)
              //                       .textTheme
              //                       .bodySmall
              //                       ?.copyWith(
              //                           fontSize: 12,
              //                           color: Colors.white),
              //                 ),
              //               Text(
              //                   "250",
              //                   overflow: TextOverflow.ellipsis,
              //                   maxLines: 1,
              //                   style: Theme.of(context)
              //                       .textTheme
              //                       .bodySmall
              //                       ?.copyWith(
              //                           fontSize: 12,
              //                           color: Colors.white),
              //                 ),
              //                     Text(
              //                   "/month",
              //                   overflow: TextOverflow.ellipsis,
              //                   maxLines: 1,
              //                   style: Theme.of(context)
              //                       .textTheme
              //                       .bodySmall
              //                       ?.copyWith(
              //                           fontSize: 12,
              //                           color: Colors.white),
              //                 ),
              //             ],),
              //           ),
              //           ) ,
              //                       ),),
      
              //                   ],),
              //         ),
              //         const SizedBox(
              //           height: 4,
              //         ),
              //         Row(
              //           children: [
              //             SizedBox(
              //               width: 150,
              //               child: Text(
              //                 "Bungalow House",
              //                 overflow: TextOverflow.ellipsis,
              //                 maxLines: 1,
              //                 style: Theme.of(context)
              //                     .textTheme
              //                     .bodyMedium
              //                     ?.copyWith(
              //                         fontSize: 12,
              //                         fontWeight: FontWeight.bold,
              //                         color: Colors.black),
              //               ),
              //             ),
              //           ],
              //         ),
              //         const SizedBox(
              //           height: 5,
              //         ),
              //         Row(
              //           children: [
              //             const Icon(
              //               Icons.star_rate,
              //               color: Colors.amber,
              //               size: 20,
              //             ),
              //             const SizedBox(
              //               width: 3,
              //             ),
              //             Text(
              //               '4.4',
              //               style: Theme.of(context)
              //                   .textTheme
              //                   .bodySmall
              //                   ?.copyWith(color: Colors.black),
              //             ),
              //             const SizedBox(
              //               width: 5,
              //             ),
              //             SvgPicture.asset(AppAssets.location,height: 10,),
              //               const SizedBox(
              //               width: 2,
              //             ),
              //             Text(
              //               'lekki Epe',
              //               style: Theme.of(context)
              //                   .textTheme
              //                   .bodySmall
              //                   ?.copyWith(color: Colors.black),
              //             )
              //           ],
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              //          Container(
              //           height: 251,
              //           width: 175,
              //           decoration: const BoxDecoration(
              //               color: Color(0xffF5F4F8),
              //               borderRadius:
              //                   BorderRadius.all(Radius.circular(25))),
              //           child: Padding(
              //             padding: const EdgeInsets.symmetric(
              //                 horizontal: 10, vertical: 10),
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Container(
              //                   height: 175,
              //                   width: 160,
              //                   decoration: const BoxDecoration(
              //                       image: DecorationImage(
              //                         image: AssetImage(AppAssets.bungalow),
              //                         fit: BoxFit.cover,
              //                       ),
              //                       borderRadius: BorderRadius.all(
              //                           Radius.circular(25))),
              //                           child: Stack(children: [
              //                             Align(
              //                               alignment: Alignment.topRight,
              //                               child: Padding(
              //                                 padding: const EdgeInsets.all(8.0),
              //                                 child: SvgPicture.asset(AppAssets.favorite),
              //                               ),),
      
              //                                 Align(
              //                               alignment: Alignment.bottomRight,
              //                               child: Padding(
              //                                 padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              //                                 child:Container(
              //           height: 35,
              //           width: 90,
              //           decoration: const BoxDecoration(
              //               color: Color(0xff1F4C6B),
              //               borderRadius:
              //                   BorderRadius.all(Radius.circular(8))),
              //                   child: Center(
              //                     child: Row(
              //                       mainAxisAlignment: MainAxisAlignment.center,
              //                       children: [
              //                           Text(
              //                           "\$",
              //                           overflow: TextOverflow.ellipsis,
              //                           maxLines: 1,
              //                           style: Theme.of(context)
              //                               .textTheme
              //                               .bodySmall
              //                               ?.copyWith(
              //                                   fontSize: 12,
              //                                   color: Colors.white),
              //                         ),
              //                       Text(
              //                           "250",
              //                           overflow: TextOverflow.ellipsis,
              //                           maxLines: 1,
              //                           style: Theme.of(context)
              //                               .textTheme
              //                               .bodySmall
              //                               ?.copyWith(
              //                                   fontSize: 12,
              //                                   color: Colors.white),
              //                         ),
              //                             Text(
              //                           "/month",
              //                           overflow: TextOverflow.ellipsis,
              //                           maxLines: 1,
              //                           style: Theme.of(context)
              //                               .textTheme
              //                               .bodySmall
              //                               ?.copyWith(
              //                                   fontSize: 12,
              //                                   color: Colors.white),
              //                         ),
              //                     ],),
              //                   ),
              //                   ) ,
              //                               ),),
      
              //                           ],),
              //                 ),
              //                 const SizedBox(
              //                   height: 4,
              //                 ),
              //                 Row(
              //                   children: [
              //                     SizedBox(
              //                       width: 150,
              //                       child: Text(
              //                         "Bungalow House",
              //                         overflow: TextOverflow.ellipsis,
              //                         maxLines: 1,
              //                         style: Theme.of(context)
              //                             .textTheme
              //                             .bodyMedium
              //                             ?.copyWith(
              //                                 fontSize: 12,
              //                                 fontWeight: FontWeight.bold,
              //                                 color: Colors.black),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //                 const SizedBox(
              //                   height: 5,
              //                 ),
              //                 Row(
              //                   children: [
              //                     const Icon(
              //                       Icons.star_rate,
              //                       color: Colors.amber,
              //                       size: 20,
              //                     ),
              //                     const SizedBox(
              //                       width: 3,
              //                     ),
              //                     Text(
              //                       '4.4',
              //                       style: Theme.of(context)
              //                           .textTheme
              //                           .bodySmall
              //                           ?.copyWith(color: Colors.black),
              //                     ),
              //                     const SizedBox(
              //                       width: 5,
              //                     ),
              //                     SvgPicture.asset(AppAssets.location,height: 10,),
              //                       const SizedBox(
              //                       width: 2,
              //                     ),
              //                     Text(
              //                       'lekki Epe',
              //                       style: Theme.of(context)
              //                           .textTheme
              //                           .bodySmall
              //                           ?.copyWith(color: Colors.black),
              //                     )
              //                   ],
              //                 )
              //               ],
              //             ),
              //           ),
              //         ),
      
              //       ],
              //     );
              //   },
              // ))
            ],
          ),
        ),
      ),
    );
  }
}
