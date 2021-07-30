import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:registration_screen/pages/payment_information.dart';
import 'package:registration_screen/theme.dart';

class MainPage extends StatelessWidget {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 12),
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child:
                    Image.asset('assets/btn_back.png', width: 24, height: 24)),
            Image.asset(
              'assets/load1.png',
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

    Widget titleText() {
      return Container(
        margin: const EdgeInsets.only(
          top: 16,
          left: 24,
        ),
        child: Text(
          'Create Profile',
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
          'Provide your profile picture and display \nname to join the community',
          style: subtitleTextStyle.copyWith(letterSpacing: 0.3),
        ),
      );
    }

    Widget changePic() {
      return Center(
        child: Container(
          margin: EdgeInsets.only(top: 32),
          child:
              Image.asset('assets/change_picture.png', width: 100, height: 100),
        ),
      );
    }

    Widget nameInput() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: bgInput1,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: EdgeInsets.only(top: 32, left: 24, right: 24),
        child: TextFormField(
          obscureText: true,
          decoration: InputDecoration.collapsed(
            hintText: 'DISPLAY NAME',
            hintStyle: inputTextStyle.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
      );
    }

    Widget button() {
      return GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PaymentInformation()));
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
                      'CONTINUE',
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

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(),
          titleText(),
          subtitleText(),
          changePic(),
          nameInput(),
          button(),
        ],
      )),
    );
  }
}
