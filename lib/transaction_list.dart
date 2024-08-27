import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class TransactionList extends StatelessWidget {
  TransactionList({super.key});

  final List<Map<String, dynamic>> transactions = [
    {
      'icon': Ionicons.briefcase,
      'title': 'Salary',
      'date': '2024-07-01',
      'amount': '+ Rs 100000',
      'type': 'income',
    },
    {
      'icon': Ionicons.home,
      'title': 'Rent',
      'date': '2024-07-01',
      'amount': '- Rs 20000',
      'type': 'expense',
    },
    {
      'icon': Ionicons.book,
      'title': 'Books',
      'date': '2024-07-04',
      'amount': '- Rs 2000',
      'type': 'expense',
    },
    {
      'icon': Ionicons.terminal,
      'title': 'Freelance Work',
      'date': '2024-07-03',
      'amount': '+ Rs 20000',
      'type': 'income',
    },
    {
      'icon': Ionicons.film,
      'title': 'Movies',
      'date': '2024-07-06',
      'amount': '- Rs 1200',
      'type': 'expense',
    },
    {
      'icon': Ionicons.gift,
      'title': 'Gift',
      'date': '2024-07-07',
      'amount': '+ Rs 5000',
      'type': 'income',
    },
    {
      'icon': Ionicons.laptop,
      'title': 'Software',
      'date': '2024-07-08',
      'amount': '- Rs 6000',
      'type': 'expense',
    },
    {
      'icon': Ionicons.cart,
      'title': 'Shopping',
      'date': '2024-07-05',
      'amount': '- Rs 10000',
      'type': 'expense',
    },
    {
      'icon': Ionicons.airplane,
      'title': 'Flight',
      'date': '2024-07-09',
      'amount': '- Rs 30000',
      'type': 'expense',
    },
    {
      'icon': Ionicons.fast_food,
      'title': 'Dining Out',
      'date': '2024-07-02',
      'amount': '- Rs 3000',
      'type': 'expense',
    },
    {
      'icon': Ionicons.wallet,
      'title': 'Investment Return',
      'date': '2024-07-05',
      'amount': '+ Rs 15000',
      'type': 'income',
    },
    {
      'icon': Ionicons.speedometer,
      'title': 'Gas',
      'date': '2024-07-07',
      'amount': '- Rs 4000',
      'type': 'expense',
    },
    {
      'icon': Ionicons.cart,
      'title': 'Groceries',
      'date': '2024-07-01',
      'amount': '- Rs 5000',
      'type': 'expense',
    },
    {
      'icon': Ionicons.car,
      'title': 'Taxi',
      'date': '2024-07-03',
      'amount': '- Rs 1500',
      'type': 'expense',
    },
    {
      'icon': Ionicons.add_circle,
      'title': 'Bonus',
      'date': '2024-07-09',
      'amount': '+ Rs 10000',
      'type': 'income',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              'Transaction List',
              style: GoogleFonts.firaSans(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0246A7)),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: const Color(0xFF6AB2F2), width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    visualDensity:
                        const VisualDensity(horizontal: 0, vertical: -4),
                    leading: Icon(
                      transactions[index]['icon']!,
                      size: 30,
                      color: const Color(0xFF0246A7),
                    ),
                    title: Text(
                      transactions[index]['title']!,
                      style: GoogleFonts.firaSans(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF0246A7)),
                    ),
                    subtitle: Text(
                      transactions[index]['date']!,
                      style: GoogleFonts.firaSans(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF0246A7)),
                    ),
                    trailing: Text(
                      transactions[index]['amount']!,
                      style: GoogleFonts.firaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: transactions[index]['type'] == "expense"
                            ? const Color(0xFF6AB2F2)
                            : const Color(0xFF0487E2),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
