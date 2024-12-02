import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  final List<Map<String, String>> faqList = [
    {
      'question': 'How do I create an account?',
      'answer':
          'To create an account, tap on the "Sign Up" button and provide the required information.'
    },
    {
      'question': 'What are the requirements for a strong password?',
      'answer':
          'A strong password should contain a combination of uppercase and lowercase letters, numbers, and special characters.'
    },
    {
      'question': 'I forgot my password. How can I reset it?',
      'answer':
          'To reset your password, tap on the "Forgot Password" link on the login screen and follow the instructions sent to your registered email address.'
    },
    {
      'question': 'Is my personal information secure?',
      'answer':
          'Yes, we take the security of your personal information seriously and follow industry-standard practices to protect it.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
        backgroundColor: Colors.green, // Set the appbar color to green
      ),
      body: ListView.builder(
        itemCount: faqList.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(faqList[index]['question']!),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(faqList[index]['answer']!),
              ),
            ],
          );
        },
      ),
    );
  }
}
