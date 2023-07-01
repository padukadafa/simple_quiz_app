import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/hewan.dart';
import 'package:flutter_application_2/models/hewan_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HewanPage extends StatelessWidget {
  final HewanType hewanType;
  const HewanPage({super.key, required this.hewanType});

  @override
  Widget build(BuildContext context) {
    final seranggaList = HewanList.hewanList(hewanType);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Hewan Serangga'),
      ),
      body: GridView.builder(
        itemCount: seranggaList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Jumlah kolom
        ),
        itemBuilder: (BuildContext context, int index) {
          Hewan serangga = seranggaList[index];
          return _hewanBoxItem(context, serangga);
        },
      ),
    );
  }

  GestureDetector _hewanBoxItem(BuildContext context, Hewan serangga) {
    return GestureDetector(
      onTap: () {
        // Fungsi untuk menampilkan detail hewan
        _showDetailDialog(context, serangga);
      },
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                serangga.gambar,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Text(
                serangga.nama,
                style: TextStyle(
                  fontSize: 16.0.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDetailDialog(BuildContext context, Hewan serangga) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(serangga.nama),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize
                .min, // tambahkan ini supaya ukuran dari dialognya tidak melebar sampai bawah
            children: [
              Image.asset(
                serangga.gambar,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16.0.h),
              Text(
                'Deskripsi:',
                style: TextStyle(
                  fontSize: 16.0.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0.h),
              Text(serangga.deskripsi),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }
}
