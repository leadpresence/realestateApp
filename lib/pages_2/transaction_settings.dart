import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



///Transaction Settings View

class TransactionSettings extends StatefulWidget {
  const TransactionSettings({super.key});

  @override
  State<TransactionSettings> createState() => _TransactionSettingsState();
}

class _TransactionSettingsState extends State<TransactionSettings> {
  bool isSuccessful = false;
  bool isFailed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE8D4CE),
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color(0xffE8D4CE),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 126,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Channels',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Successful Payments',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          SwitchWidget(
                            value: isSuccessful,
                            onChanged: (value) {
                              setState(
                                () {
                                  isSuccessful = value;
                                },
                              );
                            },
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Failed Payments',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          SwitchWidget(
                            value: isFailed,
                            onChanged: (value) {
                              setState(
                                () {
                                  isFailed = value;
                                },
                              );
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SwitchWidget extends StatelessWidget {
  const SwitchWidget({super.key, this.onChanged, required this.value});

  final void Function(bool)? onChanged;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: value,
      onChanged: onChanged,
      activeColor: const Color(0xffFF4400),
    );
  }
}
