import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

String? numberToWords(String? inputString) {
  if (inputString == null) {
    return '';
  }
  int? number = int.tryParse(inputString);

  if (number == null) {
    return '';
  }

  if (number == 0) {
    return 'zero';
  }

  String words = '';
  if (number < 0) {
    words += 'minus ';
    number = -number;
  }

  List<String> units = [
    '',
    'one',
    'two',
    'three',
    'four',
    'five',
    'six',
    'seven',
    'eight',
    'nine'
  ];
  List<String> teens = [
    'ten',
    'eleven',
    'twelve',
    'thirteen',
    'fourteen',
    'fifteen',
    'sixteen',
    'seventeen',
    'eighteen',
    'nineteen'
  ];
  List<String> tens = [
    '',
    '',
    'twenty',
    'thirty',
    'forty',
    'fifty',
    'sixty',
    'seventy',
    'eighty',
    'ninety'
  ];
  List<String> thousands = ['', 'thousand', 'million', 'billion', 'trillion'];

  int i = 0;
  while (number! > 0) {
    if (number % 1000 != 0) {
      String subWords = '';
      int subNumber = number % 1000;
      if (subNumber >= 100) {
        subWords += units[subNumber ~/ 100] + ' hundred ';
        subNumber %= 100;
      }
      if (subNumber >= 10 && subNumber <= 19) {
        subWords += teens[subNumber - 10] + ' ';
      } else if (subNumber >= 20) {
        subWords += tens[subNumber ~/ 10] + ' ';
        subNumber %= 10;
      }
      if (subNumber >= 1 && subNumber <= 9) {
        subWords += units[subNumber] + ' ';
      }
      subWords += thousands[i] + ' ';
      words = subWords + words;
    }
    number ~/= 1000;
    i++;
  }

  return words.trim();
}
