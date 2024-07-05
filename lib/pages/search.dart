import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:realeastapp/utils/app_assets.dart';
import 'package:realeastapp/utils/tripple_rail.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool searchisempty = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const SizedBox(height: 30,),
            TrippleRail(
              leading: Container(
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
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text('Found ',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.normal, color: Colors.black)),
                Text('0 ',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                Text('propeties ',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.normal, color: Colors.black)),
              ],
            ),

            //  const SizedBox(height: 10,),

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
                : Expanded(
                    child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 251,
                            width: 175,
                            decoration: const BoxDecoration(
                                color: Color(0xffF5F4F8),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 175,
                                    width: 160,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(AppAssets.bungalow),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25))),
                                            child: Stack(children: [
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: SvgPicture.asset(AppAssets.favorite),
                                                ),),

                                                  Align(
                                                alignment: Alignment.bottomRight,
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                                  child:Container(
                            height: 35,
                            width: 90,
                            decoration: const BoxDecoration(
                                color: Color(0xff1F4C6B),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                            Text(
                                            "\$",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                    fontSize: 12,
                                                    color: Colors.white),
                                          ),
                                        Text(
                                            "250",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                    fontSize: 12,
                                                    color: Colors.white),
                                          ),
                                              Text(
                                            "/month",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                    fontSize: 12,
                                                    color: Colors.white),
                                          ),
                                      ],),
                                    ),
                                    ) ,
                                                ),),




                                            ],),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 150,
                                        child: Text(
                                          "Bungalow House",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
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
                                            ?.copyWith(color: Colors.black),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      SvgPicture.asset(AppAssets.location,height: 10,),
                                        const SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        'lekki Epe',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(color: Colors.black),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                           Container(
                            height: 251,
                            width: 175,
                            decoration: const BoxDecoration(
                                color: Color(0xffF5F4F8),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 175,
                                    width: 160,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(AppAssets.bungalow),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25))),
                                            child: Stack(children: [
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: SvgPicture.asset(AppAssets.favorite),
                                                ),),

                                                  Align(
                                                alignment: Alignment.bottomRight,
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                                  child:Container(
                            height: 35,
                            width: 90,
                            decoration: const BoxDecoration(
                                color: Color(0xff1F4C6B),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                            Text(
                                            "\$",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                    fontSize: 12,
                                                    color: Colors.white),
                                          ),
                                        Text(
                                            "250",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                    fontSize: 12,
                                                    color: Colors.white),
                                          ),
                                              Text(
                                            "/month",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                    fontSize: 12,
                                                    color: Colors.white),
                                          ),
                                      ],),
                                    ),
                                    ) ,
                                                ),),




                                            ],),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 150,
                                        child: Text(
                                          "Bungalow House",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
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
                                            ?.copyWith(color: Colors.black),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      SvgPicture.asset(AppAssets.location,height: 10,),
                                        const SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        'lekki Epe',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(color: Colors.black),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                       
                        
                        ],
                      );
                    },
                  ))
          ],
        ),
      ),
    );
  }
}
