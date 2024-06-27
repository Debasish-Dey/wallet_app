import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/widgets/wallet_widget.dart';
import '../providers/wallet_provider.dart';
// import '../widgets/wallet_widgets.dart';

class WalletScreen extends StatelessWidget {
  final TextEditingController recipientController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Wallet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            BalanceDisplay(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await walletProvider.createWallet();
              },
              child: Text('Create Wallet'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await walletProvider.getBalance();
              },
              child: Text('Get Balance'),
            ),
            SizedBox(height: 20),
            TransferForm(
              recipientController: recipientController,
              amountController: amountController,
              onTransfer: () async {
                String recipient = recipientController.text;
                double amount = double.parse(amountController.text);
                await walletProvider.transferBalance(recipient, amount);
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await walletProvider.requestAirdrop();
              },
              child: Text('Request Airdrop'),
            ),
          ],
        ),
      ),
    );
  }
}
