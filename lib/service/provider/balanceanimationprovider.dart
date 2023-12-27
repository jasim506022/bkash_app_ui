import 'package:flutter/material.dart';

class BalanceAnimationProvider with ChangeNotifier {
  
  bool _animation = false;
  bool _balanceShown = false;
  bool _balance = true;

  bool get isAnimation => _animation;

  setAnimation({required bool animation}) {
    _animation = animation;
    notifyListeners();
  }

  bool get isBalanceShown => _balanceShown;

  setBalanceShown({required bool balanceShown}) {
    _balanceShown = balanceShown;
    notifyListeners();
  }

  bool get isBalance => _balance;

  setbalance({required bool balance}) {
    _balance = balance;
    notifyListeners();
  }
}
