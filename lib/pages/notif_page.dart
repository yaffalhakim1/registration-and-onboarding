import 'package:flutter/material.dart';
import 'package:registration_screen/pages/notif_preference.dart';
import 'package:registration_screen/theme.dart';

class NotifPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 12),
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/btn_back.png', width: 24, height: 24),
            Image.asset(
              'assets/load3.png',
              width: 34,
              height: 6,
            ),
            Text(
              'Skip',
              style: titleTextStyle.copyWith(
                  color: purpleColor,
                  letterSpacing: 0.3,
                  fontWeight: FontWeight.w500,
                  fontSize: 15),
            )
          ],
        ),
      );
    }

    Widget changePic() {
      return Center(
        child: Container(
          margin: EdgeInsets.only(top: 68),
          child: Image.asset('assets/notif.png', width: 104.45, height: 191),
        ),
      );
    }

    Widget titleText() {
      return Container(
        margin: const EdgeInsets.only(
          top: 40,
          left: 24,
        ),
        child: Center(
          child: Text(
            'Notifications is cool',
            style: titleTextStyle.copyWith(
                fontSize: 24, fontWeight: FontWeight.w700),
          ),
        ),
      );
    }

    Widget subtitleText() {
      return Container(
        margin: const EdgeInsets.only(
          top: 8,
          left: 24,
        ),
        child: Center(
          child: Text(
            'You can get update regarding your \nfollowing and also when people give \nreaction to your activity',
            style: subtitleTextStyle.copyWith(letterSpacing: 0.3),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    Widget button() {
      return GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NotifPreference()));
        },
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 32, left: 24, right: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: purpleColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20.0,
                      offset: Offset(0, 10),
                      color: Color(0xff3A296A).withOpacity(0.2),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: Text(
                      'Turn on Notifications',
                      style: titleTextStyle.copyWith(
                        color: Colors.white,
                        fontSize: 16,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
      );
    }

    Widget remindText() {
      return Container(
        margin: EdgeInsets.only(top: 32),
        child: Center(
          child: Text(
            'Remind me later',
            style: titleTextStyle.copyWith(
                color: purpleColor,
                letterSpacing: 0.3,
                fontWeight: FontWeight.w500,
                fontSize: 15),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(),
          changePic(),
          titleText(),
          subtitleText(),
          button(),
          remindText()
        ],
      )),
    );
  }
}
