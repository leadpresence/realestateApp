import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PaymentHome extends StatelessWidget {
  const PaymentHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFF4400),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                child: Container(
                  height: 132,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 26,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200,
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(0, 5),
                              ),
                            ]),
                        child: const Center(
                          child: Text(
                            'PRODUCT ANALYSIS',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 11,
                              color: Color(0xffFF4400),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ProductCountWidget(
                              color: Color(0xffFF4400),
                              count: '03',
                              productType: 'All Products',
                            ),
                            ProductCountWidget(
                              color: Color(0xff219653),
                              count: '03',
                              productType: 'Active Products',
                            ),
                            ProductCountWidget(
                              color: Color(0xff828282),
                              count: '03',
                              productType: 'Inactive Products',
                            ),
                            ProductCountWidget(
                              color: Colors.black,
                              count: '03',
                              productType: 'Not in use products',
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          const  SizedBox(height: 20,),
          Container(
            height: MediaQuery.of(context).size.height * 0.665,
            width: double.infinity,
            decoration:  const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20,),),
              color: Colors.white,
            ),
            child:  const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text('List of Products', style:  TextStyle(
                               fontSize: 13,
                               fontWeight: FontWeight.w800,
                               color: Colors.black,
                             ),),
                              SizedBox(height: 5,),
         SizedBox(
          width: 32,
           child: Divider(
             thickness: 5,
             color: Color(0xffFF4400) ,
            
           ),
         ),
         SizedBox(height: 20,),

         Row(
          children: [

          ],
         )

                ],
              ),
            ),
          ),
        
          ],
        ),
      ),
    );
  }
}

class ProductCountWidget extends StatelessWidget {
  const ProductCountWidget({
    super.key,
    this.color,
    this.count,
    this.productType,
  });

  final Color? color;
  final String? count;

  final String? productType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            border: Border.all(
              color: color ?? Colors.white,
              width: 5,
            ),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              count ?? '',
              style: TextStyle(
                fontSize: 15,
                color: color,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          productType ?? '',
          style: TextStyle(
            fontSize: 11,
            color: color,
            fontWeight: FontWeight.w900,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}


class POSWidget extends StatelessWidget {
  const POSWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      width: 102,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200,
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(0, 5),
                              ),]
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xffFF6634).withOpacity(0.15)
                ),
                child: Center(),
              )
            ],
          )
        ],
      ),
    );
  }
}