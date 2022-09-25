import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Formatter{
  static String formatDate(String date) {
    DateFormat df = DateFormat('MMM d, yyyy   hh:mm aa');
    DateTime dt = DateTime.parse(date);
    String formattedDate = df.format(dt);
    return formattedDate;
  }

  static currencyFormatter(amountTextForm) => amountTextForm = NumberFormat("#,##0", "en_US");
  
}

class CurrencyInputFormatter extends TextInputFormatter {

  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {

    if(newValue.selection.baseOffset == 0){
      print(true);
      return newValue;
    }

    double value = double.parse(newValue.text);

    final formatter = NumberFormat.simpleCurrency(locale: "en_NG");

    String newText = formatter.format(value/100);

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}