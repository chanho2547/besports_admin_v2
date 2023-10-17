import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RangeCalScreen extends StatefulWidget {
  const RangeCalScreen({super.key});

  @override
  State<RangeCalScreen> createState() => _RangeCalScreenState();
}

class _RangeCalScreenState extends State<RangeCalScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, //top status bar
        systemNavigationBarColor:
            Colors.blueGrey, // navigation bar color, the one Im looking for
        statusBarIconBrightness: Brightness.dark, // status bar icons' color
        systemNavigationBarIconBrightness:
            Brightness.dark, //navigation bar icons' color
      ),
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text("운동 범위 조정",
              style: TextStyle(color: Colors.white, fontSize: 20)),
          backgroundColor: Colors.grey[800],
          foregroundColor: Colors.white,
        ),
        body: const Center(
          child: Text("TAG THE NFC",
              style: TextStyle(color: Colors.white, fontSize: 40)),
        ),
      ),
    );
  }
}
