import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class LocaleNotifier extends ChangeNotifier {
  final ProviderReference ref;
  Locale _locale = Locale(savedLocale);

  LocaleNotifier(this.ref);

  Locale get currentLocale => _locale;

  void setNepali() {
    _locale = Locale('ne');
    notifyListeners();

    // Update language in local storage
    SharedPreferences.getInstance().then((value) {
      value.setString('savedLocale', 'ne');
    });
  }

  void setEnglish() {
    _locale = Locale('en');
    notifyListeners();

    // Update language in local storage
    SharedPreferences.getInstance().then((value) {
      value.setString('savedLocale', 'en');
    });
  }
}

final localeProvider =
ChangeNotifierProvider<LocaleNotifier>((ref) => LocaleNotifier(ref));