import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:registration_screen/pages/add_friend.dart';
import 'package:registration_screen/theme.dart';

class NotifPreference extends StatefulWidget {
  @override
  _NotifPreferenceState createState() => _NotifPreferenceState();
}

class _NotifPreferenceState extends State<NotifPreference> {
  bool isOn = true;
  bool isOn1 = false;
  bool isOn3 = true;
  int selectedIndex = -1;
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
            Image.asset('assets/btn_back.png', width: 24, height: 24),
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
          top: 30,
          left: 24,
        ),
        child: Text(
          'Choose topics that you \nwant to get notify',
          style: titleTextStyle.copyWith(
              fontSize: 24, fontWeight: FontWeight.w700),
        ),
      );
    }

    Widget gameSwitch(int index) {
      return Container(
        margin: EdgeInsets.only(left: 24, top: 50, right: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/game.png',
              width: 28,
              height: 28,
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Games',
                  style: titleTextStyle.copyWith(fontSize: 18),
                ),
                Text(
                  'New Release, Console, Tips',
                  style: subtitleTextStyle,
                )
              ],
            ),
            Spacer(),
            Container(
              child: GestureDetector(
                child: CupertinoSwitch(
                  activeColor: Colors.blue,
                  value: isOn,
                  onChanged: (bool value) {
                    setState(() {
                      selectedIndex = index;
                      selectedIndex == index ? isOn = value : isOn = !value;
                    });
                  },
                ),
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                    selectedIndex == index ? isOn = !isOn : isOn = isOn;
                  });
                },
              ),
            )
          ],
        ),
      );
    }

    Widget economy() {
      return Container(
        margin: EdgeInsets.only(left: 24, top: 35, right: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/graph.png',
              width: 28,
              height: 28,
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Economy',
                  style: titleTextStyle.copyWith(fontSize: 18),
                ),
                Text(
                  'Stock, Property, News',
                  style: subtitleTextStyle,
                )
              ],
            ),
            Spacer(),
            Container(
              child: GestureDetector(
                child: CupertinoSwitch(
                  activeColor: Colors.blue,
                  value: isOn1,
                  onChanged: (bool value) {
                    setState(() {
                      isOn1 = value;
                    });
                  },
                ),
                onTap: () {
                  setState(() {
                    isOn1 = !isOn1;
                  });
                },
              ),
            )
          ],
        ),
      );
    }

    Widget entertainment() {
      return Container(
        margin: EdgeInsets.only(left: 24, top: 35, right: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/graph.png',
              width: 28,
              height: 28,
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Entertainment',
                  style: titleTextStyle.copyWith(fontSize: 18),
                ),
                Text(
                  'Movie, Music, Podcast',
                  style: subtitleTextStyle,
                )
              ],
            ),
            Spacer(),
            Container(
              child: GestureDetector(
                child: CupertinoSwitch(
                  activeColor: Colors.blue,
                  value: isOn3,
                  onChanged: (bool value) {
                    setState(() {
                      isOn3 = value;
                    });
                  },
                ),
                onTap: () {
                  setState(() {
                    isOn3 = !isOn3;
                  });
                },
              ),
            )
          ],
        ),
      );
    }

    Widget button() {
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddFriend()));
        },
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 44, left: 24, right: 24),
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
          titleText(),
          gameSwitch(1),
          economy(),
          entertainment(),
          economy(),
          economy(),
          button(),
          remindText()
        ],
      )),
    );
  }
}
