import 'package:flutter/material.dart';
import 'package:registration_screen/pages/create_password.dart';
import 'package:registration_screen/theme.dart';
import 'package:flutter_verification_box/verification_box.dart';

class VerifCode extends StatelessWidget {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: blackColor1,
          ),
        ),
        backgroundColor: Colors.white,
      );
    }

    Widget titleText() {
      return Container(
        margin: const EdgeInsets.only(
          top: 16,
          left: 24,
        ),
        child: Text(
          'Enter Verification Code',
          style: titleTextStyle.copyWith(
              fontSize: 24, fontWeight: FontWeight.w700),
        ),
      );
    }

    Widget subtitleText() {
      return Container(
        margin: const EdgeInsets.only(
          top: 8,
          left: 24,
        ),
        child: Text(
          'Enter code that we have sent to your email',
          style: subtitleTextStyle.copyWith(letterSpacing: 0.3),
        ),
      );
    }

    Widget verifBox() {
      return Container(
        margin: EdgeInsets.only(right: 24, top: 32),
        height: 60,
        child: VerificationBox(
          count: 4,
          focusBorderColor: purpleColor,
        ),
      );
    }

    Widget button() {
      return GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreatePassword()));
        },
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 40, left: 24, right: 24),
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
                      'VERIFY',
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

    Widget resendCode() {
      return Center(
        child: Container(
          margin: EdgeInsets.only(left: 24, top: 24),
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Resend Code',
              style: titleTextStyle.copyWith(
                  color: purpleColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  letterSpacing: 0.3),
            ),
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
            titleText(),
            subtitleText(),
            verifBox(),
            button(),
            resendCode(),
          ],
        ),
      ),
    );
  }
}
