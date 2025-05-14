import 'package:flutter/material.dart';
import 'package:luckapp/luck_screen.dart';

void main() {
  runApp(const LuckyColorsApp());
}

class LuckyColorsApp extends StatelessWidget {
  const LuckyColorsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LuckyColorsScreen(),
    );
  }
}

class LuckyColorsScreen extends StatelessWidget {
  const LuckyColorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xFFFF9A9E), // Soft Peach Pink
              Color(0xFF8E2DE2), // Vivid Purple
            ],
          ),

          /*gradient: LinearGradient(
            colors: [Color(0xFFFFA8D4), Color(0xFFB388FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),*/
        ),
        child: Stack(
          children: [
            // Rainbow Arcs (simplified using Containers with BorderRadius)
            /*Positioned(
              top: -250,
              left: -150,
              child: CustomPaint(
                size: const Size(600, 600), // Adjust to match exact radius
                painter: PerfectRainbowPainter(),
              ),
            ),*/

            Positioned(
              top: -20,
              left: -700,
              child: SizedBox(
                width: 1400,
                height: 1400,
                child: Stack(
                  children: [
                    _buildArc(0, Colors.purple),
                    _buildArc(30, Colors.blue),
                    _buildArc(60, Colors.orange),
                    _buildArc(90, Colors.green),
                    _buildArc(120, Colors.pink),
                    _buildArc(150, Colors.yellow),
                    _buildArc(180, Colors.red),
                  ],
                ),
              ),
            ),

            // Icons
            Positioned(
              top: 80,
              left: 40,
              child: Image.asset('assets/star.png', width: 140), // replace with your image
            ),
            Positioned(
              top: 200,
              right: 40,
              child: Image.asset('assets/star.png', width: 140),
            ),
            Positioned(
              bottom: 94,
              right: 40,
              child: Image.asset('assets/star.png', width: 120),
            ),

            // Text Content
            Positioned(
              top: 260,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "THE\nLUCKY\nCOLORS",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Here's the auspicious colors for each day of the week, based on asian traditional beliefs",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            // Gradient Button
            Positioned(
              bottom: 60,
              left: 30,
              right: 30,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LuckScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "Check Today's Colors",
                    style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildArc(double inset, Color color) {
    return Positioned(
      top: inset,
      left: inset,
      right: inset,
      bottom: inset,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: color,
            width: 30,
          ),
        ),
      ),
    );
  }

}

class RainbowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.pink,
      Colors.blue,
      Colors.purple,
    ];
    double strokeWidth = 20;

    for (int i = 0; i < colors.length; i++) {
      final paint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth;

      canvas.drawArc(
        Rect.fromLTWH(0, 0, size.width, size.height),
        3.14,
        3.14,
        false,
        paint,
      );

      strokeWidth -= 2.5;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class PerfectRainbowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final List<Color> colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.pink,
      Colors.purple,
      Colors.blue,
    ];

    double strokeWidth = 30;
    double start = 0;

    for (Color color in colors) {
      final paint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.butt;

      final rect = Rect.fromLTWH(start, start, size.width - start * 2, size.height - start * 2);
      canvas.drawArc(rect, 3.14, 3.14, false, paint);
      start += strokeWidth;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

