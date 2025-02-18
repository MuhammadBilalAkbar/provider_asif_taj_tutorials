import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  final uri = 'https://reqres.in';

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _obscure = true;
  bool get obscure => _obscure;
  setObscure(bool value) {
    _obscure = value;
    notifyListeners();
  }

  void login(String email, String password, BuildContext context) async {
    setLoading(true);
    try {
      Response response = await post(
        Uri.parse('$uri/api/login'),
        body: {'email': email, 'password': password},
      );
      if (response.statusCode == 200) {
        debugPrint('Login successful');
        setLoading(false);
        // Show success dialog
        if(!context.mounted) return;
        _showSuccessDialog(context);
      } else {
        debugPrint('Login failed!');
        setLoading(false);
        // Show error dialog
        if(!context.mounted) return;
        _showErrorDialog(context, 'Login failed. Please check your credentials.');
      }
    } catch (e) {
      setLoading(false);
      debugPrint(e.toString());
      // Show error dialog
      _showErrorDialog(context, 'An error occurred. Please try again.');
    }
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Login Successful'),
        content: const Text('You have successfully logged in.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}