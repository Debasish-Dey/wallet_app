import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/wallet_provider.dart';

class BalanceDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);

    return Column(
      children: [
        Text(
          'Balance:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          '${walletProvider.balance}',
          style: TextStyle(fontSize: 24),
        ),
      ],
    );
  }
}

class TransferForm extends StatelessWidget {
  final TextEditingController recipientController;
  final TextEditingController amountController;
  final VoidCallback onTransfer;

  TransferForm({
    required this.recipientController,
    required this.amountController,
    required this.onTransfer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: recipientController,
          decoration: InputDecoration(labelText: 'Recipient'),
        ),
        TextField(
          controller: amountController,
          decoration: InputDecoration(labelText: 'Amount'),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: onTransfer,
          child: Text('Transfer'),
        ),
      ],
    );
  }
}
