import 'package:flutter/material.dart';

class ErrorDialogWidget extends StatelessWidget {
  const ErrorDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Padding(
        padding: EdgeInsets.all(12),
        child: Text(
          'Algum dos seus dados está faltando ou foi preenchido incorretamente',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      icon: const Icon(
        Icons.report_outlined,
        color: Colors.red,
      ),
      title: const Text('Erro!'),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Ok',
              style: TextStyle(fontSize: 18),
            ))
      ],
    );
  }
}
