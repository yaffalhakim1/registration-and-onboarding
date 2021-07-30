import 'package:flutter/material.dart';
import 'package:registration_screen/pages/notif_page.dart';
import 'package:registration_screen/theme.dart';

class PaymentInformation extends StatelessWidget {
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
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child:
                    Image.asset('assets/btn_back.png', width: 24, height: 24)),
            Image.asset(
              'assets/load2.png',
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
          'Payment Information',
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
          'Provide your payment information',
          style: subtitleTextStyle.copyWith(letterSpacing: 0.3),
        ),
      );
    }

    Widget cardInput() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: bgInput1,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: EdgeInsets.only(top: 32, left: 24, right: 24),
        child: TextFormField(
          decoration: InputDecoration.collapsed(
            hintText: 'Card Number',
            hintStyle: inputTextStyle.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
      );
    }

    Widget expInput() {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: bgInput1,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: EdgeInsets.only(top: 32, left: 24, right: 24),
        child: TextFormField(
          decoration: InputDecoration.collapsed(
            hintText: 'Expired Date',
            hintStyle: inputTextStyle.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
      );
    }

    Widget cvvInput() {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: bgInput1,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: EdgeInsets.only(top: 32, left: 24, right: 24),
        child: TextFormField(
          decoration: InputDecoration.collapsed(
            hintText: 'Card Number',
            hintStyle: inputTextStyle.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
      );
    }

    Widget button() {
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NotifPage()));
        },
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
          cardInput(),
          expInput(),
          cvvInput(),
          button(),
        ],
      )),
    );
  }
}
