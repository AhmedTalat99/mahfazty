import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mahfazty/core/networking/firebase_helper.dart';
import 'package:mahfazty/core/theming/fonts.dart';
import 'package:mahfazty/core/theming/my_colors.dart';
import 'package:mahfazty/core/widgets/my_button.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  DateTime? selectedDate;
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: selectedDate ?? DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 30),
      ),
    );
    if (picked != selectedDate) {
      setState(() {
        selectedDate = picked!;
        dateController.text = DateFormat('dd-MM-yyy').format(selectedDate!);
      });
    }
  }

  @override
  void initState() {
    dateController.text = DateFormat('dd-MM-yyy').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Transaction'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                prefixIcon: Icon(Icons.abc),
                hintText: 'Name',
              ),
            ),
            SizedBox(height: 20.h),
            TextFormField(
              controller: priceController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                prefixIcon: Icon(Icons.price_change),
                hintText: 'Price',
              ),
            ),
            SizedBox(height: 20.h),
            TextFormField(
              controller: dateController,
              onTap: () {
                _selectDate(context);
              },
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                prefixIcon: Icon(Icons.date_range),
                hintText:
                    selectedDate != null ? selectedDate.toString() : 'Date',
              ),
            ),
            SizedBox(height: 30.h),
            MyButton(
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    priceController.text.isNotEmpty &&
                    dateController.text.isNotEmpty) {
                  FirebaseHelper().addTransaction(
                    FirebaseAuth.instance.currentUser!.uid,
                    nameController.text,
                    priceController.text,
                    dateController.text,
                  );
                }
              },
              gradient: LinearGradient(colors: [
                MyColors.orangeColor,
                MyColors.yellowColor,
              ]),
              child: Text(
                'Save',
                style: FontHelper.font18BoldWhite.copyWith(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
