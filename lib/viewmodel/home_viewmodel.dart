import 'package:flutter/cupertino.dart';
import 'package:flutter_kendden_shehere/model/home_list.dart';
import 'package:flutter_kendden_shehere/service/networks.dart';

class HomeViewModel with ChangeNotifier {
  HomeViewModel();

  bool _isFetching = false;

  bool get isFetching => _isFetching;
  HomeList homeList=new HomeList();

  getHomeProducts() {
    _isFetching = true;
    //notifyListeners();
    Networks().showAllCollection().then((onValue) {
      _isFetching = false;
      notifyListeners();
      if (onValue != null) {
        homeList=onValue;
        notifyListeners();
        return onValue;
      }
    });
  }
}
