import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://api.socialverseapp.com';

  static Future<String> loginUser(String mixed, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/user/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'mixed': mixed,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['token'];
    } else {
      throw Exception('Failed to login');
    }
  }

  static Future<void> createWallet(String token) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/solana/wallet/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to create wallet');
    }
  }

  static Future<double> getBalance(String token) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/solana/wallet/balance'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['balance'];
    } else {
      throw Exception('Failed to retrieve balance');
    }
  }

  static Future<void> transferBalance(
      String token, String recipient, double amount) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/solana/wallet/transfer'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        'recipient': recipient,
        'amount': amount,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to transfer balance');
    }
  }

  static Future<void> requestAirdrop(String token) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/solana/wallet/airdrop'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to request airdrop');
    }
  }
}
