import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/wallet_provider.dart';
import 'screens/wallet_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WalletProvider(),
      child: MaterialApp(
        title: 'Flutter Wallet App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: WalletScreen(),
      ),
    );
  }
}
