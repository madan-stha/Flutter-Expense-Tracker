import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class BalanceBoxes extends StatelessWidget {
  const BalanceBoxes({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double gapSize = screenWidth / 15;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: gapSize / 2),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0487E2),

                      borderRadius: BorderRadius.circular(20),
                      // boxShadow: const [
                      //   BoxShadow(
                      //       color: Colors.grey, spreadRadius: 1, blurRadius: 15)
                      // ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Ionicons.arrow_down_circle_outline,
                              color: Colors.white,
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Income',
                              style: GoogleFonts.firaSans(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Rs 150000',
                          style: GoogleFonts.firaSans(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
              SizedBox(width: gapSize / 2),
              Expanded(
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xFF6AB2F2),
                    borderRadius: BorderRadius.circular(20),
                    // boxShadow: const [
                    //   BoxShadow(
                    //       color: Colors.grey, spreadRadius: 1, blurRadius: 15)
                    // ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Ionicons.arrow_up_circle_outline,
                            color: Colors.white,
                            size: 18,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Expense',
                            style: GoogleFonts.firaSans(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Rs 92200',
                        style: GoogleFonts.firaSans(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(width: gapSize / 2),
              Expanded(
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0246A7),
                    borderRadius: BorderRadius.circular(20),
                    // boxShadow: const [
                    //   BoxShadow(
                    //       color: Colors.grey, spreadRadius: 5, blurRadius: 15)
                    // ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Ionicons.wallet_outline,
                            color: Colors.white,
                            size: 18,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Balance',
                            style: GoogleFonts.firaSans(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Rs 57700',
                        style: GoogleFonts.firaSans(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
