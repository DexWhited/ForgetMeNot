import 'package:flutter/material.dart';

class NewNotePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Color(0xff1ebd98),
          ),
        ),
      ),
      body: NewNoteForm(),
    );
  }
}

class NewNoteForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        maxLines: null,
        decoration: InputDecoration(
          hintText: 'Write your note here...',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
