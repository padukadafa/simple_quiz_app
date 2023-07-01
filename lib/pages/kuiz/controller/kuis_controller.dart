import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/hewan.dart';
import 'package:flutter_application_2/models/hewan_model.dart';

class KuisController {
  BuildContext context;
  final hewanList = HewanList.allHewanList();
  KuisController(this.context);
  List<Hewan> getKuis() {
    hewanList.shuffle();

    return hewanList.getRange(1, 5).toList();
  }
}
