import 'package:flutter/material.dart';

import 'package:resturant_task/model/special_offers.dart';
import 'package:resturant_task/repo/special_offers_services.dart';

class SpecialOffersProvider with ChangeNotifier {
  SpecialOffers? _specialOffers;
  bool _isLoading = false;

  SpecialOffers? get specialOffers => _specialOffers;
  bool get isLoading => _isLoading;
  final WebServices _webServices;
  SpecialOffersProvider(this._webServices);
  Future<void> fetchSpecialOffers() async {
    _isLoading = true;
    notifyListeners();
    try {
      _specialOffers = await _webServices.getOffers();
      _specialOffers?.specialOffers?.forEach((offer) {});
    } catch (e) {
      print('Error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
