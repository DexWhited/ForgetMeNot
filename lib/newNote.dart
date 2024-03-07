import 'package:flutter/material.dart';

class NewNotePage extends StatelessWidget {
  final TextEditingController textController;

  const NewNotePage({Key? key, required this.textController}) : super(key: key);

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  // Save the note and pop with the saved note text
                  Navigator.pop(context, textController.text);
                },
              ),
            ],
          ),
        ),
      ),
      body: NewNoteForm(textController: textController),
    );
  }
}

class NewNoteForm extends StatelessWidget {
  final TextEditingController textController;

  const NewNoteForm({Key? key, required this.textController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        controller: textController, // Assign the controller
        maxLines: null,
        decoration: InputDecoration(
          hintText: 'Write your note here...',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
