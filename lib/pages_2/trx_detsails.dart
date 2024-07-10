import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TransactionDetailsView extends StatefulWidget {
  const TransactionDetailsView({super.key});

  @override
  State<TransactionDetailsView> createState() => _TransactionDetailsViewState();
}

class _TransactionDetailsViewState extends State<TransactionDetailsView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      backgroundColor: Colors.white ,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
              )),
        ),
        body: Column(
                children: [
        Container(

          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white
            //  boxShadow: [
            // BoxShadow(
            //     color: Colors.black.withOpacity(0.1),
            //     blurRadius: 4,
            //     offset: const Offset(0, 2))
          // ]
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 20,
            ),
            child: Column(
              children: [
                const Text(
                  'NGN 100.00',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                  ),
                ),
                Container(
                  height: 22,
                  width: 84,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    color: Colors.green.withOpacity(0.3),
                  ),
                  child: const Center(
                    child: Text(
                      'Successful',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                TabBar(
                  controller: tabController,
                  dividerColor: Colors.white,
                  splashFactory: NoSplash.splashFactory,
                  dividerHeight: 0.5,
                  labelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Colors.white,
                  unselectedLabelColor: Colors.black.withOpacity(
                    0.3,
                  ),
                  indicatorWeight: 0.1,
                  indicatorPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  tabs: const [
                    Tab(
                      text: 'Payments',
                    ),
                    Tab(
                      text: 'Analytics',
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
            child: TabBarView(
          controller: tabController,
          children: const [
            PaymentTabView(),
            AnalyticsTabView(),
          ],
        ))
                ],
              ),
      ),
    );
  }
}

class PaymentTabView extends StatelessWidget {
  const PaymentTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Container(
            height: 65,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]),
            child: Center(
              child: ListTile(
                leading: Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xff064A72)),
                  child: const Center(
                    child: Text(
                      'S',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                title: const Text('Sunday Daniel'),
                trailing: const Icon(
                  Icons.keyboard_arrow_right,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 195,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]),
            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              child: Column(
                children: [
                  TextRow(text1: 'Paid on', text2: '30/10/2021 2:26PM'),
                  Divider(
                    color: Color(0xffDADADA),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextRow(text1: 'Reference ID', text2: 'TJDFJ235343334343'),
                  Divider(
                    color: Color(0xffDADADA),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextRow(text1: 'Channel', text2: 'Card'),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Color(0xffDADADA),
                  ),
                  TextRow(text1: 'Fees', text2: '1.5%'),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            height: 65,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]),
            child: const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.refresh,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Refund',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AnalyticsTabView extends StatelessWidget {
  const AnalyticsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 25,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text(
                    'TIME SPENT',
                    style: TextStyle(
                      color: Color(0xff828282),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: const BoxDecoration(
                      color: Color(0xffFFEAE3),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        '749\nSeconds',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  const Text(
                    'DEVICE USED',
                    style: TextStyle(
                      color: Color(0xff828282),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: const BoxDecoration(
                      color: Color(0xffFFEAE3),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.computer),
                          Text(
                            'Desktop',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const TimelineWidget(
            isFirst: true,
            isLast: false,
            isPast: true,
            indicatorWidget: Text(''),
            eventCardTextTitle: Text('Set payment method to: bank'),
            eventCardTextLocation: Text(''),
            eventCardTextTime: Text('00:47'),
          ),
          const TimelineWidget(
            isFirst: false,
            isLast: false,
            isPast: true,
            indicatorWidget: Text(''),
            eventCardTextTitle: Text('Set payment method to: bank'),
            eventCardTextLocation: Text(''),
            eventCardTextTime: Text('00:47'),
          ),
          const TimelineWidget(
            isFirst: false,
            isLast: false,
            isPast: true,
            indicatorWidget: Text(''),
            eventCardTextTitle: Text('Set payment method to: bank'),
            eventCardTextLocation: Text(''),
            eventCardTextTime: Text('00:47'),
          ),
          const TimelineWidget(
            isFirst: false,
            isLast: false,
            isPast: true,
            indicatorWidget: Text(''),
            eventCardTextTitle: Text('Set payment method to: bank'),
            eventCardTextLocation: Text(''),
            eventCardTextTime: Text('00:47'),
          ),
          const TimelineWidget(
            isFirst: false,
            isLast: true,
            isPast: true,
            indicatorWidget: Text(''),
            eventCardTextTitle: Text('Set payment method to: bank'),
            eventCardTextLocation: Text(''),
            eventCardTextTime: Text('00:47'),
          ),
        ],
      ),
    );
  }
}

class TextRow extends StatelessWidget {
  const TextRow({
    super.key,
    required this.text1,
    required this.text2,
  });

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: const TextStyle(fontSize: 12),
        ),
        Text(
          text2,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

class TimelineWidget extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final Text indicatorWidget;
  final Text eventCardTextTitle;
  final Text eventCardTextLocation;
  final Text eventCardTextTime;

  const TimelineWidget({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.indicatorWidget,
    required this.eventCardTextTitle,
    required this.eventCardTextLocation,
    required this.eventCardTextTime,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 77,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: const LineStyle(
          color: Color(0xFFDFE6ED),
        ),
        indicatorStyle: IndicatorStyle(
          width: 7,
          height: 7,
          color: isPast ? const Color(0xffFF4400) : const Color(0xFFF1F6FB),
          indicator: Container(
            decoration: ShapeDecoration(
              color: isPast ? const Color(0xffFF4400) : const Color(0xFFF1F6FB),
              shape: const OvalBorder(),
            ),
            child: Center(child: indicatorWidget),
          ),
        ),
        endChild: EventCard(
          eventCardTextLocation: eventCardTextLocation,
          eventCardTextTime: eventCardTextTime,
          eventCardTextTitle: eventCardTextTitle,
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final Text eventCardTextTitle;
  final Text eventCardTextLocation;
  final Text eventCardTextTime;
  const EventCard({
    super.key,
    required this.eventCardTextTitle,
    required this.eventCardTextLocation,
    required this.eventCardTextTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            eventCardTextTime,
            const SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                eventCardTextTitle,
              ],
            ),
          ],
        ));
  }
}
