import 'package:flutter/cupertino.dart';

class MainBottomNavProvider extends ChangeNotifier{
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  void changeIndex(int index) {
    if(_selectedIndex == index){
      return;
    }
    _selectedIndex = index;
    notifyListeners();
  }
}