import 'package:flutter/material.dart';
import 'package:luckapp/menu_screen.dart';

import 'home_screen.dart';

class LuckScreen extends StatefulWidget {
  @override
  LuckState createState() => LuckState();
}

class LuckState extends State<LuckScreen> {

  List<Color> gradientColors1 = [Color(0xFFFFD54F), Color(0xFFBA68C8)];
  List<Color> gradientColors2 = [Color(0xFFFFECB3), Color(0xFFCE93D8)];
  List<Color> gradientColors3 = [Color(0xFFFFECB3), Color(0xFFCE93D8)];

  final List<List<Color>> gradientOptions = [
    [Color(0xFFFFD54F), Color(0xFFBA68C8)],
    [Color(0xFFFFECB3), Color(0xFFCE93D8)]
  ];

  int currentSelection = 0;

  String selectedDay = "Monday";

  void ChnageSelection(index){
    setState(() {
      if(index == 1){
        gradientColors1 = gradientOptions[0];
        gradientColors2 = gradientOptions[1];
        gradientColors3 = gradientOptions[1];
      }else if(index == 2){
        gradientColors1 = gradientOptions[1];
        gradientColors2 = gradientOptions[0];
        gradientColors3 = gradientOptions[1];
      } else if(index == 3){
        gradientColors1 = gradientOptions[1];
        gradientColors2 = gradientOptions[1];
        gradientColors3 = gradientOptions[0];
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1EAFD),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              color: Color(0xFFFFD54F),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => MenuScreen(),
                        transitionsBuilder: (_, animation, __, child) {
                          const begin = Offset(-1.0, 0.0);
                          const end = Offset.zero;
                          const curve = Curves.easeInOut;
                          final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                          return SlideTransition(position: animation.drive(tween), child: child);
                        },
                      ),
                    );
                  }, child: Icon(Icons.menu, color: Colors.white)),
                  Text(
                    selectedDay,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  InkWell(onTap: () async  {
                    selectedDay = (await showDialog<String>(
                      context: context,
                      builder: (context) => WeeklyScheduleDialog(initialSelectedDay: selectedDay,),
                    ))!;
                    setState(() {

                    });
                  }, child: Icon(Icons.swap_horiz, color: Colors.white)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Choosing Types of Luck for Today",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 20),

            // Luck Options
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  InkWell(
                    onTap: () {
                      ChnageSelection(1);
                    },
                    child: LuckCard(
                      icon: Icons.star_rounded,
                      iconColor: Colors.yellow,
                      title: "Prosperity",
                      subtitle: "Achieving Economic and\nSocial Flourishing",
                      gradientColors: gradientColors1,
                    ),
                  ),
                  SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      ChnageSelection(2);
                    },
                    child: LuckCard(
                      icon: Icons.monetization_on_rounded,
                      iconColor: Colors.amber,
                      title: "Wealth",
                      subtitle: "Strategies for Financial\nSuccess",
                      gradientColors: gradientColors2,
                    ),
                  ),
                  SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      ChnageSelection(3);
                    },
                    child: LuckCard(
                      icon: Icons.favorite_rounded,
                      iconColor: Colors.pink,
                      title: "Fortune",
                      subtitle: "Beyond Luck and Destiny",
                      gradientColors: gradientColors3,
                      //gradientColors: [Color(0xFFFFCDD2), Color(0xFFCE93D8)],
                    ),
                  ),
                ],
              ),
            ),

            /*Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: LinearGradient(
                      colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
                    ),
                    createShader(const Rect.fromLTWH(0, 0, 200, 70)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    textStyle: const TextStyle(fontSize: 16),
                  ).copyWith(
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xFF00B0FF),
                    ),
                  ),
                  child: const Text("Select"),
                ),
              ),
            ),*/

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProsperityScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Select",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LuckCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final List<Color> gradientColors;

  const LuckCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: gradientColors),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 40, color: iconColor),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class WeeklyScheduleDialog extends StatefulWidget {
  WeeklyScheduleDialog({super.key, this.initialSelectedDay});

  final String? initialSelectedDay;

  @override
  State<WeeklyScheduleDialog> createState() => _WeeklyScheduleDialogState();
}

class _WeeklyScheduleDialogState extends State<WeeklyScheduleDialog> {
  String? selectedDay;

  @override
  void initState() {
    super.initState();
    // Set the initial selected day when the dialog opens
    selectedDay = widget.initialSelectedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // List of days with dividers
            ...[
              'Sunday',
              'Monday',
              'Tuesday',
              'Wednesday',
              'Thursday',
              'Friday',
              'Saturday',
              'Weekly Color Schedule',
            ].asMap().entries.map((entry) {
              final day = entry.value;
              final isLast = entry.key == 7; // No divider after the last day
              return Column(
                children: [
                  RadioListTile(
                    value: day,
                    groupValue: selectedDay,
                    onChanged: (value) {
                      setState(() {
                        selectedDay = value as String;
                      });
                    },
                    title: Text(
                      day,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold, // Bold text as per UI
                      ),
                    ),
                    activeColor: Colors.blue,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    visualDensity: const VisualDensity(
                      vertical: -2, // Tighter spacing between items
                    ),
                  ),
                  if (!isLast) // Add divider except for the last day
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                ],
              );
            }),
            // Weekly Color Schedule title and Select button
            /*Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Radio(
                    value: true,
                    groupValue: true,
                    onChanged: null,
                    activeColor: Colors.blue,
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Weekly Color Schedule',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),*/

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(selectedDay);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Select",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            /*Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(selectedDay);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Select',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}