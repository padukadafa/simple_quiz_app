import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/hewan_model.dart';
import 'package:flutter_application_2/pages/hewan/hewan_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(153, 216, 40, 40),
      appBar: AppBar(
        title: const Text('JENIS HEWAN'),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: Drawer(
        child: ListView(
          children: const <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                "TK Advent Ponain",
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
              ),
              accountEmail: Text("harapankasih@gmail.com"),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Admin"),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const HewanPage(
                    hewanType: HewanType.mamalia,
                  );
                }));
              },
              child: const Text('MAMALIA'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const HewanPage(
                    hewanType: HewanType.serangga,
                  );
                }));
              },
              child: const Text('SERANGGA'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const HewanPage(
                    hewanType: HewanType.unggas,
                  );
                }));
              },
              child: const Text('UNGGAS'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const HewanPage(
                    hewanType: HewanType.reptil,
                  );
                }));
              },
              child: const Text('REPTIL'),
            ),
          ],
        ),
      ),
    );
  }
}
