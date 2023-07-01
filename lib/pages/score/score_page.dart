import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScorePage extends StatelessWidget {
  final int score;
  const ScorePage({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Score"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Skor kamu",
              style: TextStyle(
                fontSize: 24.sp,
              ),
            ),
            Text(
              score.toString(),
              style: TextStyle(
                fontSize: 36.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
