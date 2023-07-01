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
    final answerIndex = Random().nextInt(3);

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
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: kuis.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Jumlah kolom
                    childAspectRatio: 2,
                    mainAxisSpacing: 10.w,
                    crossAxisSpacing: 10.w,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    var generatedColor =
                        Random().nextInt(Colors.primaries.length);

                    return GestureDetector(
                      onTap: () {
                        if (_currentKuis == 10) {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => ScorePage(
                              score: (correctAnswer / 10 * 100).toInt(),
                            ),
                          ));
                        }
                        setState(() {
                          _currentKuis++;
                          if (index == answerIndex) {
                            correctAnswer++;
                          }
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.primaries[generatedColor],
                          borderRadius: BorderRadius.circular(12.w),
                        ),
                        child: Text(
                          kuis[index].nama,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.sp,
                          ),
                        ),
                      ),
                    );
                  },
                ),
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
