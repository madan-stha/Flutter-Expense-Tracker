import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

void addTransactionModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 600,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(23),
            topRight: Radius.circular(23),
          ),
        ),
        child: DefaultTabController(
          length: 2,
          animationDuration: Durations.long2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              TabBar(
                labelColor: Colors.white,
                overlayColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                unselectedLabelColor: Colors.white,
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                labelPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                tabs: [
                  Tab(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF0487E2),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Income",
                          style: GoogleFonts.firaSans(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF6AB2F2),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Expense",
                          style: GoogleFonts.firaSans(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Expanded(
                child: SizedBox(
                  height: 300,
                  child: TabBarView(
                    children: [
                      IncomeTabContent(),
                      ExpenseTabContent(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class IncomeTabContent extends StatefulWidget {
  const IncomeTabContent({super.key});

  @override
  _IncomeTabContentState createState() => _IncomeTabContentState();
}

class _IncomeTabContentState extends State<IncomeTabContent> {
  String? _selectedCategory;
  DateTime? _selectedDate;
  final TextEditingController _amountController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: const Color(0xFF0487E2), // Header background color
              hintColor: const Color(0xFF6AB2F2), // Selected date circle color
              colorScheme: const ColorScheme.light(primary: Color(0xFF0487E2)),
              buttonTheme: const ButtonThemeData(
                textTheme: ButtonTextTheme.primary, // Text color for buttons
              ),
            ),
            child: child!,
          );
        });
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),
          TextField(
            controller: _amountController,
            style: GoogleFonts.firaSans(color: const Color(0xFF0487E2)),
            decoration: InputDecoration(
              labelText: 'Amount',
              labelStyle: GoogleFonts.firaSans(color: const Color(0xFF0487E2)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Color(0xFF0487E2), // Initial border color
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Color(
                      0xFF0487E2), // Color when the TextField is not focused
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color:
                      Color(0xFF0487E2), // Color when the TextField is focused
                  width: 2.0,
                ),
              ),
              prefixText: 'Rs. ',
              prefixStyle: GoogleFonts.firaSans(color: const Color(0xFF0487E2)),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16.0),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Category',
              labelStyle: GoogleFonts.firaSans(color: const Color(0xFF0487E2)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Color(0xFF0487E2), // Initial border color
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Color(
                      0xFF0487E2), // Color when the TextField is not focused
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color:
                      Color(0xFF0487E2), // Color when the TextField is focused
                  width: 2.0,
                ),
              ),
            ),
            value: _selectedCategory,
            iconEnabledColor:
                const Color(0xFF0487E2), // Change the color of the enabled icon
            iconDisabledColor: const Color(0xFF0487E2), // Cha
            items: <String>[
              'Salary',
              'Freelance Work',
              'Gift',
              'Investment Return',
              'Bonus'
            ].map((String value) {
              IconData icon;
              switch (value) {
                case 'Salary':
                  icon = Ionicons.briefcase;
                  break;
                case 'Freelance Work':
                  icon = Ionicons.terminal;
                  break;
                case 'Gift':
                  icon = Ionicons.gift;
                  break;
                case 'Investment Return':
                  icon = Ionicons.wallet;
                  break;
                case 'Bonus':
                  icon = Ionicons.add_circle;
                  break;
                default:
                  icon = Icons.category;
              }
              return DropdownMenuItem<String>(
                value: value,
                child: Row(
                  children: [
                    Icon(
                      icon,
                      color: const Color(0xFF0487E2),
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      value,
                      style: GoogleFonts.firaSans(
                        color: const Color(0xFF0487E2),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedCategory = newValue;
              });
            },
          ),
          const SizedBox(height: 16.0),
          TextField(
            readOnly: true,
            style: GoogleFonts.firaSans(color: const Color(0xFF0487E2)),
            decoration: InputDecoration(
              labelText: 'Date',
              labelStyle: GoogleFonts.firaSans(color: const Color(0xFF0487E2)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Color(0xFF0487E2), // Initial border color
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Color(
                      0xFF0487E2), // Color when the TextField is not focused
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color:
                      Color(0xFF0487E2), // Color when the TextField is focused
                  width: 2.0,
                ),
              ),
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.calendar_today,
                  color: Color(0xFF0487E2),
                ),
                onPressed: () {
                  _selectDate(context);
                },
              ),
            ),
            controller: TextEditingController(
              text: _selectedDate == null
                  ? ''
                  : "${_selectedDate!.toLocal()}".split(' ')[0],
            ),
          ),
          const SizedBox(height: 16.0),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Add your income logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0487E2), // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 16.0),
              ),
              child: Text(
                'Add Income',
                style: GoogleFonts.firaSans(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExpenseTabContent extends StatefulWidget {
  const ExpenseTabContent({super.key});

  @override
  _ExpenseTabContentState createState() => _ExpenseTabContentState();
}

class _ExpenseTabContentState extends State<ExpenseTabContent> {
  String? _selectedCategory;
  DateTime? _selectedDate;
  final TextEditingController _amountController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: const Color(0xFF6AB2F2), // Header background color
            hintColor: const Color(0xFF0487E2), // Selected date circle color
            colorScheme: const ColorScheme.light(primary: Color(0xFF6AB2F2)),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary, // Text color for buttons
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),
          TextField(
            controller: _amountController,
            style: GoogleFonts.firaSans(color: const Color(0xFF6AB2F2)),
            decoration: InputDecoration(
              labelText: 'Amount',
              labelStyle: GoogleFonts.firaSans(color: const Color(0xFF6AB2F2)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Color(0xFF6AB2F2), // Initial border color
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Color(
                      0xFF6AB2F2), // Color when the TextField is not focused
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color:
                      Color(0xFF6AB2F2), // Color when the TextField is focused
                  width: 2.0,
                ),
              ),
              prefixText: 'Rs. ',
              prefixStyle: GoogleFonts.firaSans(color: const Color(0xFF6AB2F2)),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16.0),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Category',
              labelStyle: GoogleFonts.firaSans(color: const Color(0xFF6AB2F2)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Color(0xFF6AB2F2), // Initial border color
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Color(
                      0xFF6AB2F2), // Color when the TextField is not focused
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color:
                      Color(0xFF6AB2F2), // Color when the TextField is focused
                  width: 2.0,
                ),
              ),
            ),
            value: _selectedCategory,
            iconEnabledColor:
                const Color(0xFF6AB2F2), // Change the color of the enabled icon
            iconDisabledColor: const Color(0xFF6AB2F2),
            items: <String>[
              'Rent',
              'Movies',
              'Shopping',
              'Travel',
              'Dining Out',
              'Groceries',
            ].map((String value) {
              IconData icon;
              switch (value) {
                case 'Rent':
                  icon = Ionicons.home;
                  break;
                case 'Shopping':
                  icon = Ionicons.cart;
                  break;
                case 'Movies':
                  icon = Ionicons.film;
                  break;
                case 'Travel':
                  icon = Ionicons.bus;
                  break;
                case 'Dining Out':
                  icon = Ionicons.restaurant;
                  break;
                case 'Groceries':
                  icon = Ionicons.basket;
                  break;
                default:
                  icon = Icons.category;
              }
              return DropdownMenuItem<String>(
                value: value,
                child: Row(
                  children: [
                    Icon(
                      icon,
                      color: const Color(0xFF6AB2F2),
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      value,
                      style: GoogleFonts.firaSans(
                        color: const Color(0xFF6AB2F2),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedCategory = newValue;
              });
            },
          ),
          const SizedBox(height: 16.0),
          TextField(
            readOnly: true,
            style: GoogleFonts.firaSans(color: const Color(0xFF6AB2F2)),
            decoration: InputDecoration(
              labelText: 'Date',
              labelStyle: GoogleFonts.firaSans(color: const Color(0xFF6AB2F2)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Color(0xFF6AB2F2), // Initial border color
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Color(
                      0xFF6AB2F2), // Color when the TextField is not focused
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color:
                      Color(0xFF6AB2F2), // Color when the TextField is focused
                  width: 2.0,
                ),
              ),
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.calendar_today,
                  color: Color(0xFF6AB2F2),
                ),
                onPressed: () {
                  _selectDate(context);
                },
              ),
            ),
            controller: TextEditingController(
              text: _selectedDate == null
                  ? ''
                  : "${_selectedDate!.toLocal()}".split(' ')[0],
            ),
          ),
          const SizedBox(height: 16.0),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Add your income logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6AB2F2), // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 16.0),
              ),
              child: Text(
                'Add Expense',
                style: GoogleFonts.firaSans(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
