import 'package:flutter/material.dart';
import 'package:registration_screen/theme.dart';

class CreatePassword extends StatelessWidget {
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
          'Create Password',
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
          'Create your new password to login',
          style: subtitleTextStyle.copyWith(letterSpacing: 0.3),
        ),
      );
    }

    Widget passOldInput() {
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
            hintText: 'Password',
            hintStyle: inputTextStyle.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
      );
    }

    Widget passNewInput() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: bgInput1,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: EdgeInsets.only(top: 16, left: 24, right: 24),
        child: TextFormField(
          obscureText: true,
          decoration: InputDecoration.collapsed(
            hintText: 'Confirm Password',
            hintStyle: inputTextStyle.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
      );
    }

    Widget button() {
      return GestureDetector(
        onTap: () {},
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 16, left: 24, right: 24),
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
                      'CREATE PASSWORD',
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
            passOldInput(),
            passNewInput(),
            button(),
          ],
        ),
      ),
    );
  }
}
