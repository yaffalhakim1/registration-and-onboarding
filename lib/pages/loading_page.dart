import 'package:flutter/material.dart';
import 'package:registration_screen/theme.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 164,
          height: 266,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/loading.png'),
              Text(
                'Completion Process...',
                style: titleTextStyle.copyWith(
                    color: Color(0xff363F49), fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
