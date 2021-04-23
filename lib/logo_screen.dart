import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:starnet/screens/home/home_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class LogoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 150.0,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: AnimatedSplashScreen(
                    duration: 2800,
                    splashTransition: SplashTransition.rotationTransition,
                    pageTransitionType: PageTransitionType.rightToLeft,
                    backgroundColor: Colors.white12,
                    nextScreen: HomeScreen(),
                    splash: CircleAvatar(
                      child: Image.asset('assets/images/Logo.png'),
                      radius: 150.0,
                      backgroundColor: Colors.orange[400],
                    ),
                  ),
                ),
                Expanded(
                  child: ScaleAnimatedTextKit(
                      onTap: () {
                        print("Tap Event");
                      },
                      text: [
                        "Star Net",
                      ],
                      textStyle: TextStyle(
                          fontSize: 30.0,
                          // ScreenUtil.instance.setSp(35.0),
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                          fontFamily: "Horizon"),
                      textAlign: TextAlign.start,
                      alignment: AlignmentDirectional.topStart),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0
                // top: ScreenUtil.instance.setWidth(160.0)
                ),
            child: SpinKitThreeBounce(color: Colors.orange[400]),
          )
        ],
      ),
    );
  }
}
