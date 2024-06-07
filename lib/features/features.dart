import 'dart:math';

import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Colors.grey,
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 30),
          label: "⦿",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart, size: 30),
          label: "⦿",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message, size: 30),
          label: "⦿",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications, size: 30),
          label: "⦿",
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 14,
            backgroundImage: AssetImage("assets/images/ab.jpeg"),
          ),
          label: "⦿",
        ),
      ],
      selectedLabelStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    );
  }
}

class CircularPercentageIndicator extends StatelessWidget {
  final double percentage;
  final double strokeWidth;
  final Color backgroundColor;
  final Color progressColor;
  final TextStyle? textStyle;

  const CircularPercentageIndicator({
    Key? key,
    required this.percentage,
    this.strokeWidth = 10.0,
    this.backgroundColor = Colors.grey,
    this.progressColor = Colors.blue,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.square(150), // Adjust size as needed
      painter: _CircularPercentageIndicatorPainter(
        percentage: percentage,
        strokeWidth: strokeWidth,
        backgroundColor: backgroundColor,
        progressColor: progressColor,
      ),
      child: Center(
        child: Text(
          '${percentage.toInt()}%',
          style: textStyle ?? Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Colors.black54,
            fontSize: 15,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}

class _CircularPercentageIndicatorPainter extends CustomPainter {
  final double percentage;
  final double strokeWidth;
  final Color backgroundColor;
  final Color progressColor;

  _CircularPercentageIndicatorPainter({
    required this.percentage,
    required this.strokeWidth,
    required this.backgroundColor,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Paint progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final double radius = size.width / 2 - strokeWidth / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double arcAngle = 2 * pi * (percentage / 100);

    canvas.drawCircle(center, radius, backgroundPaint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
