import 'package:besports_admin_v2/constants/gaps.dart';
import 'package:besports_admin_v2/features/main_screen/widgets/custom_button.dart';
import 'package:besports_admin_v2/features/range_cal/range_cal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const routeURL = '/';
  static const routeName = 'MainScreen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

PageRouteBuilder _customPageRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}

class _MainScreenState extends State<MainScreen> {
  // 버튼
  void _onRangeCalPressed() {
    print('Button _onRangeCalPressed');
    Navigator.of(context).push(_customPageRoute(const RangeCalScreen()));
    //goRouter.go(RangeCalScreen.routeURL);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, //top status bar
        systemNavigationBarColor:
            Colors.grey[800], // navigation bar color, the one Im looking for
        statusBarIconBrightness: Brightness.dark, // status bar icons' color
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Admin APP',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.grey[800],
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Gaps.v96,
              const Text("운동 테스트",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              const Divider(
                color: Colors.white,
                thickness: 2,
                indent: 70,
                endIndent: 70,
              ),
              const CustomButton(
                title: 'NFC 테스트',
              ),
              Gaps.v20,
              const Text(
                "캘리브레이션",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 2,
                indent: 70,
                endIndent: 70,
              ),
              GestureDetector(
                onTap: _onRangeCalPressed,
                child: const CustomButton(
                  title: '운동 범위 보정',
                ),
              ),
              const CustomButton(
                title: 'PINLOAD',
              ),
              const CustomButton(
                title: 'PLATELOAD',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
