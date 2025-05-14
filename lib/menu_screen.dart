import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  @override
  MenuState createState() => MenuState();
}

class MenuState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1EAFD),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFFC371), Color(0xFFB06AB3)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        title: const Text('Menu', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
        leading: const BackButton(color: Colors.white),
        centerTitle: false,
      ),
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                colors: /*[
                  Color(0xFFE0BBE4), // Light Purple
                  Color(0xFF957DAD), // Medium Purple
                  Color(0xFFD291BC), // Pink
                  Color(0xFFFDD8D7), // Light Pink
                  Color(0xFFFFF59D), // Light Yellow
                ],*/
                  [Color(0xFFFFECB3), Color(0xFFCE93D8)]
              ),
            ),
          ),
          // Menu Items
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  /*Row(
                    children: [
                      Icon(Icons.arrow_back_ios, color: Colors.white),
                      SizedBox(width: 8.0),
                      Text(
                        'Menu',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.0),*/
                  // Today's Colors Item
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: InkWell(
                      onTap: () {

                      },
                      child: Row(
                        children: [
                          Icon(Icons.palette_outlined, color: Colors.black),
                          SizedBox(width: 16.0),
                          Text(
                            'Today\'s Colors',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Weekly Color Schedule Item
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today, color: Colors.black),
                        SizedBox(width: 16.0),
                        Text(
                          'Weekly Color Schedule',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  // Close Menu Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle close menu action
                        Navigator.pop(context); // Pop the current screen
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFE57373), // Similar red color
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        'Close Menu',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}