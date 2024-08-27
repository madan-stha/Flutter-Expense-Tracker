import 'package:expense_tracker/add_transaction.dart';
import 'package:expense_tracker/balance_box.dart';
import 'package:expense_tracker/barchart.dart';
import 'package:expense_tracker/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0246A7),
          toolbarHeight: 60.2,
          title: Text(
            "Expense Tracker",
            style: GoogleFonts.firaSans(
              textStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
          ),
          elevation: 0.00,
          leading: IconButton(
            icon: const Icon(Ionicons.menu_outline),
            onPressed: () {},
            color: Colors.white,
            iconSize: 25,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Ionicons.person_circle_outline),
              color: Colors.white,
              iconSize: 32,
            )
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              const BalanceBoxes(),
              const SizedBox(
                height: 10,
              ),
              const BarChart(),
              const SizedBox(
                height: 10,
              ),
              Expanded(child: TransactionList())
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => addTransactionModal(context),
          backgroundColor: const Color(0xFF0246A7),
          child: const Icon(
            Ionicons.add,
            color: Colors.white,
            size: 35,
          ),
        ));
  }
}
