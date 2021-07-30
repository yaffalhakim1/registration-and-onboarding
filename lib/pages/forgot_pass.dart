import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registration_screen/models/user_model.dart';
import 'package:registration_screen/pages/verif_code.dart';
import 'package:registration_screen/providers/auth_provider.dart';
import 'package:registration_screen/providers/user_provider.dart';
import 'package:registration_screen/theme.dart';
import 'package:another_flushbar/flushbar.dart';

class ForgotPass extends StatefulWidget {
  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    void showError(String message) {
      Flushbar(
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: warningColor,
        icon: Image.asset('assets/close.png', width: 24, height: 24),
        messageText: Text(message, style: warningTextStyle),
        duration: Duration(seconds: 3),
      )..show(context);
    }

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserProvider userProvider = Provider.of<UserProvider>(context);

    // handleSignIn() async {
    //   if (emailController.text.isEmpty) {
    //     showError('Email should be filled');
    //   } else {
    //     setState(() {
    //       isLoading = true;
    //     });
    //     UserModel user = await authProvider.login(
    //         emailController.text, passwordController.text);

    //     setState(() {
    //       isLoading = false;
    //     });

    //     if (user == null) {
    //       showError('Email did not match');
    //     } else {
    //       userProvider.user = user;
    //       Navigator.push(
    //           context, MaterialPageRoute(builder: (context) => ForgotPass()));
    //     }
    //   }
    // }

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
          'Forgot your password?',
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
          'No worries, you just need to type your \nemail address or username and we will \nsend the verification code.',
          style: subtitleTextStyle.copyWith(letterSpacing: 0.3),
        ),
      );
    }

    Widget emailInput() {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: bgInput1,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.only(
          top: 16,
          left: 24,
          right: 24,
        ),
        child: TextFormField(
          controller: emailController,
          decoration: InputDecoration.collapsed(
            hintText: 'Email Address',
            hintStyle: inputTextStyle.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
      );
    }

    Widget button() {
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => VerifCode()));
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
                      'RESET MY PASSWORD',
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
          emailInput(),
          button(),
        ],
      )),
    );
  }
}
