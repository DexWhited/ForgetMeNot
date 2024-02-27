import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
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
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context); // Go back to the previous page
                },
              ),
              Text('Profile'),
            ],
          ),
        ),
      ),
      body: Center(
        child: Text('Profile Page Stuff'),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // Implement edit functionality
              },
            ),
            IconButton(
              icon: Icon(Icons.list),
              onPressed: () {},
            ),
            SizedBox(),
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
