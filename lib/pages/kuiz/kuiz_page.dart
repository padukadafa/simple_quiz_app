import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/kuiz/controller/kuis_controller.dart';
import 'package:flutter_application_2/pages/score/score_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KuisPage extends StatefulWidget {
  const KuisPage({super.key});

  @override
  State<KuisPage> createState() => _KuisPageState();
}

class _KuisPageState extends State<KuisPage> {
  int _currentKuis = 1;
  int correctAnswer = 0;

  @override
  Widget build(BuildContext context) {
    final controller = KuisController(context);
    final kuis = controller.getKuis();
    final keyAnswer = Random().nextInt(3);
    final answerIndex = Random().nextInt(1);

    return WillPopScope(
      onWillPop: controller.willPop,
      child: Scaffold(
        appBar: AppBar(
          leading: const SizedBox(),
          title: Text("$_currentKuis/10"),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              // Container(
              //   margin: EdgeInsets.only(top: 10.h),
              //   child: _kuisLoading(),
              // ),
              Container(
                margin: EdgeInsets.only(top: 10.h),
                width: 400.w,
                height: 200.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.w),
                  image: DecorationImage(
                    image: AssetImage(
                      kuis[answerIndex].gambar,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
                child: Text(
                  kuis[keyAnswer].nama,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (keyAnswer == answerIndex) {
                          correctAnswer++;
                        }
                        if (_currentKuis == 10) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => ScorePage(
                                score: (correctAnswer / 10 * 100).toInt(),
                              ),
                            ),
                          );
                        }
                        _currentKuis++;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 190.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12.w),
                      ),
                      child: Text(
                        "Benar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (keyAnswer != answerIndex) {
                          correctAnswer++;
                        }
                        if (_currentKuis == 10) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => ScorePage(
                                score: (correctAnswer / 10 * 100).toInt(),
                              ),
                            ),
                          );
                        }
                        _currentKuis++;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 190.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12.w),
                      ),
                      child: Text(
                        "Salah",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Row _kuisLoading() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 300.w,
          height: 40.h,
          child: Stack(
            children: [
              Container(
                width: 300.w,
                height: 40.h,
                color: Colors.grey,
              ),
              Container(
                width: 300.w * 1 / 4,
                height: 40.h,
                color: Colors.green,
              ),
            ],
          ),
        ),
        Text(
          "29 detik",
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }
}
