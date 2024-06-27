import 'package:flutter/material.dart';
import '../services/api_service.dart';

class WalletProvider with ChangeNotifier {
  String _token = '';
  double _balance = 0.0;

  String get token => _token;
  double get balance => _balance;

  Future<void> loginUser(String mixed, String password) async {
    try {
      _token = await ApiService.loginUser(mixed, password);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> createWallet() async {
    try {
      await ApiService.createWallet(_token);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> getBalance() async {
    try {
      _balance = await ApiService.getBalance(_token);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> transferBalance(String recipient, double amount) async {
    try {
      await ApiService.transferBalance(_token, recipient, amount);
      await getBalance();
    } catch (error) {
      throw error;
    }
  }

  Future<void> requestAirdrop() async {
    try {
      await ApiService.requestAirdrop(_token);
      await getBalance();
    } catch (error) {
      throw error;
    }
  }
}
