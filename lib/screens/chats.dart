import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
      ),
      bottomNavigationBar: const BottomAppBar(),
      body: const Center(
        child: Text('Chats Screen'),
      ),
    );
  }
}