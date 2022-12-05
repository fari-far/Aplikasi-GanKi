import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:grocery_app/auth_service.dart';
import 'package:grocery_app/common_widgets/app_button.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import 'package:grocery_app/screens/dashboard/dashboard_screen.dart';
import 'package:grocery_app/styles/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  final String imagePath = "assets/images/welcome.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Spacer(),
                SizedBox(
                  height: 20,
                ),
                welcomeTextWidget(),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 40,
                ),
                getButton(context),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ));
  }

  Widget welcomeTextWidget() {
    return Column(
      children: [
        AppText(
          text: "Welcome",
          textAlign: TextAlign.right,
          fontSize: 48,
          fontWeight: FontWeight.w600,
          color: Color.fromARGB(255, 85, 73, 32),
        ),
        AppText(
          text: "Discover Your Own Keychain!",
          fontSize: 48,
          textAlign: TextAlign.right,
          fontWeight: FontWeight.w600,
          color: Color.fromARGB(255, 85, 73, 32),
        ),
      ],
    );
  }

  Widget getButton(BuildContext context) {
    return AppButton(
      label: "Get Started",
      fontWeight: FontWeight.w600,
      padding: EdgeInsets.symmetric(vertical: 25),
      onPressed: () {
        AuthService().signInWithGoogle();
        //onGetStartedClicked(context);
      },
    );
  }

  //void onGetStartedClicked(BuildContext context) {
  //Navigator.of(context).pushReplacement(new MaterialPageRoute(
  //builder: (BuildContext context) {
  //return DashboardScreen();
  //},
  //));
  //}
}
