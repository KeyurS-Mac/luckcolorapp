import 'package:flutter/material.dart';

class ProsperityScreen extends StatelessWidget {
  const ProsperityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3FF),
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
        title: const Text('Prosperity', style: TextStyle(color: Colors.white)),
        leading: const BackButton(color: Colors.white),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          DayColorCard(
            day: 'Sunday',
            gradient: [Color(0xFFD94645), Color(0xFFFF7F7F)],
            luckyColors: [Colors.green],
            unluckyColors: [Color(0xFF3F51B5)],
          ),
          SizedBox(height: 16),
          DayColorCard(
            day: 'Monday',
            gradient: [Color(0xFFFFE259), Color(0xFFFFC371)],
            luckyColors: [Colors.black, Color(0xFF6A0DAD)],
            unluckyColors: [Color(0xFFB71C1C)],
          ),
          SizedBox(height: 16),
          DayColorCard(
            day: 'Tuesday',
            gradient: [Color(0xFFFF6CAB), Color(0xFF7366FF)],
            luckyColors: [Color(0xFFFF5722), Color(0xFF5D4037)],
            unluckyColors: [Colors.white],
          ),
          SizedBox(height: 16),
          DayColorCard(
            day: 'Wednesday',
            gradient: [Color(0xFFFF6CAB), Color(0xFF7366FF)],
            luckyColors: [Color(0xFFFF5722), Color(0xFF5D4037)],
            unluckyColors: [Colors.white],
          ),
          // Add more DayColorCards for Wednesday onward
        ],
      ),
    );
  }
}

class DayColorCard extends StatelessWidget {
  final String day;
  final List<Color> gradient;
  final List<Color> luckyColors;
  final List<Color> unluckyColors;

  const DayColorCard({
    super.key,
    required this.day,
    required this.gradient,
    required this.luckyColors,
    required this.unluckyColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            day,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ColorBox(title: 'Lucky Color', colors: luckyColors),
              ColorBox(title: 'Unlucky color', colors: unluckyColors),
            ],
          ),
        ],
      ),
    );
  }
}

class ColorBox extends StatelessWidget {
  final String title;
  final List<Color> colors;

  const ColorBox({
    super.key,
    required this.title,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.25),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: colors
                  .map((color) => Container(
                width: 30,
                height: 30,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(6),
                ),
              ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
