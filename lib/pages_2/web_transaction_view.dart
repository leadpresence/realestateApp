import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:realeastapp/pages_2/recent_transactions.dart';
import 'package:realeastapp/pages_2/transaction_settings.dart';
 /// Web POS transaction view
class WebPosTransactionView extends StatefulWidget {
  const WebPosTransactionView({super.key});

  @override
  State<WebPosTransactionView> createState() => _WebPosTransactionViewState();
}

class _WebPosTransactionViewState extends State<WebPosTransactionView> {
  String? selectedStatus;
  String? selectedChannel;
  String? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFF4400),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const TransactionSettings();
            },
          ));
        },
        shape: const CircleBorder(),
        backgroundColor: const Color(0xffFF4400),
        child: const Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffFF4400),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Transactions',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 350,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 15,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'FILTER',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Icon(Icons.close))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AppDropdownInput(
                              hintText: 'Status',
                              value: selectedStatus,
                              options: const [
                                'Active',
                                'Inactive',
                                'Not in use',
                              ],
                              onChanged: (String? value) {
                                setState(() {
                                  selectedStatus = value;
                                });
                              },
                              text: 'Status',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AppDropdownInput(
                              hintText: 'Channel',
                              value: selectedChannel,
                              options: const [
                                '1',
                                '2',
                                '3',
                              ],
                              onChanged: (String? value) {
                                setState(() {
                                  selectedChannel = value;
                                });
                              },
                              text: 'Channel',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AppDropdownInput(
                              hintText: 'Date period',
                              value: selectedDate,
                              options: const [
                                'Monthly',
                                'Yearly',
                                'Daily',
                              ],
                              onChanged: (String? value) {
                                setState(() {
                                  selectedDate = value;
                                });
                              },
                              text: 'Date period',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 43,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: const Color(0xffFF4400)),
                              child: const Center(
                                child: Text(
                                  'Filter transactions',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              icon: const Icon(
                CupertinoIcons.sort_up,
                color: Colors.white,
              )),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Container(
              height: 42,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.redAccent.shade100),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Search with reference id or customer email',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                    Icon(Icons.search),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.84,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(
                    20,
                  ),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Web POS Transactions',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const SizedBox(
                      width: 32,
                      child: Divider(
                        thickness: 5,
                        color: Color(0xffFF4400),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          return const RecentTransactionList();
                        },
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade300,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppDropdownInput extends StatelessWidget {
  final String hintText;
  final List<String> options;
  final String? value;
  final String text;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  final void Function(String?)? onChanged;

  const AppDropdownInput({
    super.key,
    required this.hintText,
    this.options = const [],
    required this.value,
    required this.onChanged,
    required this.text,
    this.suffixIcon,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select an option';
        }
        return null;
      },
      builder: (FormFieldState<String> state) {
        return DropdownButtonHideUnderline(
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: Color(0xffE0E0E0),
                  )),
              prefixIcon: prefixIcon,
              hintText: hintText,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: const Color(0xffE0E0E0)),
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Color(0xffE0E0E0))),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Color(0xffE0E0E0))),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select an Option';
              }
              return null;
            },
            hint: Text(
              text,
            ),
            value: value,
            style: const TextStyle(
              color: Color(0xffE0E0E0),
              fontSize: 10,
            ),
            icon: const Icon(Icons.arrow_drop_down_rounded),
            onChanged: onChanged,
            items: options.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
