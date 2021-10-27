import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BraveShine',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _list = [];

  late String current;
  @override
  void initState() {
    // TODO: implement initState
    for (int i = 42; i < 95; i++) {
      _list.add("assets/home/IMG_00${i}.JPG");
    }
    current = _list.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              current,
              fit: BoxFit.cover,
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Opacity(
              opacity: 0.5,
            ),
          ),
          Center(
            child: Container(
              width: 1080,
              height: 1920,
              child: Swiper(
                itemCount: _list.length,
                itemBuilder: (ctx, index) {
                  return Image.asset(_list[index]);
                },
                onIndexChanged: (idx) {
                  current = _list[idx];
                  setState(() {});
                },
                indicatorLayout: PageIndicatorLayout.COLOR,
                autoplay: true,
                autoplayDelay: 8000,
                // pagination: SwiperPagination(),
                // control: SwiperControl(),
                fade: 0,
                curve: Curves.slowMiddle,
                duration: 2000,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Text("很多人的一生只做了 \"等待\" 和 \"后悔\" 两件事,合起来叫做 \"来不及\"",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white70,fontSize: 10)),
          )
        ],
      ),
    );
    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   body: Center(
    //     child: Stack(
    //       children: [
    //         Image.asset("assets/home/home_bg.jpg"),
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             Container(
    //               width: 100,
    //               height: 100,
    //               child: Image.asset("assets/favicon/favicon.gif"),
    //             ),
    //             SizedBox(height: 20,),
    //             Text(
    //                 "很多人的一声只做了 \"等待\" 和 \"后悔\" 两件事,合起来叫做 \"来不及\"",
    //                 style: TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                     color: Colors.white
    //                 ))
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
