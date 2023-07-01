import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/kuiz/kuiz_page.dart';
import 'package:flutter_application_2/pages/main/main_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/images/depan.jpg",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
            Positioned(
              bottom: 30.w,
              left: 10.w,
              right: 10.w,
              child: Card(
                color: Colors.black.withOpacity(0.3),
                elevation: 8.0.w,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.w)),
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.all(16.0.w),
                    child: Text(
                      "Mengenal Hewan, sekarang !",
                      style: GoogleFonts.montserrat(
                          fontSize: 20.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 16.w, right: 16.w, bottom: 8.h),
                    child: Text(
                      "Untuk mengetahui semua jenis Hewan, Anda perlu terhubung terlebih dahulu",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                          fontSize: 12.sp, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 16.w, right: 16.w, bottom: 32.h),
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(14.0.w),
                        child: ElevatedButton(
                          child: const Text("HEWAN"),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MainPage()));
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 32),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: ElevatedButton(
                          child: const Text("KUIS"),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const KuisPage();
                            }));
                          },
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
