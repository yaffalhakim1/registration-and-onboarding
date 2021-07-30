import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registration_screen/models/user_model.dart';
import 'package:registration_screen/pages/forgot_pass.dart';
import 'package:registration_screen/pages/main_page.dart';
import 'package:registration_screen/providers/auth_provider.dart';
import 'package:registration_screen/providers/user_provider.dart';
import 'package:registration_screen/theme.dart';
import 'package:another_flushbar/flushbar.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

    handleSignIn() async {
      if (emailController.text.isEmpty || passwordController.text.isEmpty) {
        showError('Email and password should be filled');
      } else {
        setState(() {
          isLoading = true;
        });
        UserModel user = await authProvider.login(
            emailController.text, passwordController.text);

        setState(() {
          isLoading = false;
        });

        if (user == null) {
          showError('Email or Password did not match');
        } else {
          userProvider.user = user;
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainPage()));
        }
      }
    }

    Widget header() {
      return AppBar(
        elevation: 0,
        leading: Icon(
          Icons.arrow_back,
          color: blackColor1,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Log In',
          style: titleTextStyle,
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
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: TextFormField(
          controller: emailController,
          decoration: InputDecoration.collapsed(
            hintText: 'Email Address',
            hintStyle: inputTextStyle.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
      );
    }

    Widget passInput() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: bgInput1,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: TextFormField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration.collapsed(
            hintText: 'Password',
            hintStyle: inputTextStyle.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
      );
    }

    Widget forgotText() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ForgotPass()));
          },
          child: Text(
            'Forgot Password?',
            style: titleTextStyle.copyWith(
              color: purpleColor,
            ),
          ),
        ),
      );
    }

    Widget button() {
      return GestureDetector(
        onTap: handleSignIn,
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 24),
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
                      'LOG IN',
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

    Widget accText() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have a account? ",
            style: titleTextStyle.copyWith(
                color: Color(0xff4C5673), fontWeight: FontWeight.w400),
          ),
          Text(
            "Sign Up",
            style: titleTextStyle.copyWith(
              color: purpleColor,
            ),
          ),
        ],
      );
    }

    Widget orText() {
      return Center(
        child: Text(
          "OR",
          style: titleTextStyle.copyWith(
              color: blackColor1, fontWeight: FontWeight.w500, fontSize: 18),
        ),
      );
    }

    Widget sosmedCard(String imageUrl, String name) {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          border: Border.all(color: blackColor2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 18),
              Image.asset(
                imageUrl,
                width: 20,
              ),
              SizedBox(
                width: 20,
              ),
              Center(
                child: Text(
                  'Sign In with $name',
                  style: titleTextStyle.copyWith(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              SizedBox(height: 16),
              emailInput(),
              SizedBox(height: 16),
              passInput(),
              SizedBox(height: 16),
              forgotText(),
              SizedBox(height: 42),
              button(),
              SizedBox(height: 24),
              accText(),
              SizedBox(height: 42),
              orText(),
              SizedBox(
                height: 30,
              ),
              sosmedCard('assets/google.png', 'Google'),
              SizedBox(height: 16),
              sosmedCard('assets/apple.png', 'Apple'),
              SizedBox(height: 16),
              sosmedCard('assets/facebook.png', 'Facebook'),
            ],
          ),
        ),
      ),
    );
  }
}
