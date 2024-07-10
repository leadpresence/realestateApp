import 'package:flutter/material.dart';
import 'package:realeastapp/pages_2/trx_detsails.dart';

class RecentTransactionList extends StatelessWidget {
  const RecentTransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Colors.grey.shade300,
        ),
        InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context){return TransactionDetailsView();},)),
          child: ListTile(
            leading: Container(
              height: 8,
              width: 8,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.greenAccent,
              ),
            ),
            title: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NGN 100',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
                Text(
                  'Felix chibueze',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                      color: Color(0xff858585)),
                ),
              ],
            ),
            trailing: const Text(
              '1d',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}