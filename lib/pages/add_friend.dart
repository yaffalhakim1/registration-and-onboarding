import 'package:flutter/material.dart';
import 'package:registration_screen/pages/loading_page.dart';
import 'package:registration_screen/pages/notif_preference.dart';
import 'package:registration_screen/theme.dart';

class AddFriend extends StatefulWidget {
  @override
  _AddFriendState createState() => _AddFriendState();
}

class _AddFriendState extends State<AddFriend> {
  int selectedIndex = -1;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
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
          'Invite Friends',
          style: titleTextStyle.copyWith(fontSize: 18),
        ),
      );
    }

    Widget searchBar() {
      return Container(
        height: 48,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(width: 1, color: lineColor),
          bottom: BorderSide(width: 1, color: lineColor),
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Search Friend',
              style: subtitleTextStyle.copyWith(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  letterSpacing: 0.3),
            ),
            Image.asset('assets/search.png', width: 24, height: 24)
          ],
        ),
      );
    }

    Widget contact1(String name, String imageUrl, String email, int index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
            print(index);
          });
        },
        child: Container(
          padding: EdgeInsets.only(left: 24, right: 24, top: 24),
          child: Row(
            children: [
              Image.asset(imageUrl, height: 50, width: 50),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: titleTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    email,
                    style: subtitleTextStyle.copyWith(
                        fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Spacer(),
              selectedIndex == index
                  ? Image.asset('assets/checked.png', height: 32, width: 32)
                  : Image.asset('assets/unchecked.png', height: 32, width: 32)
            ],
          ),
        ),
      );
    }

    Widget text() {
      return Container(
        margin: const EdgeInsets.only(top: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '12 Friends selected',
              style: subtitleTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 0.3),
            ),
            Text(
              ' View Selected',
              style: titleTextStyle.copyWith(
                  color: purpleColor, fontWeight: FontWeight.w600),
            )
          ],
        ),
      );
    }

    Widget button() {
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoadingPage()));
        },
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 24, left: 24, right: 24),
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
                      'Send Invitations',
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
        children: [
          header(),
          searchBar(),
          contact1('Samantha', 'assets/1.png', 'samantha@email.com', 0),
          contact1('Karen William', 'assets/2.png', 'karen@email.com', 1),
          contact1('Angela Smith', 'assets/3.png', 'angela@email.com', 2),
          contact1('Andrea Summer', 'assets/4.png', 'andrea@email.com', 3),
          contact1('Samantha', 'assets/5.png', 'samantha@email.com', 4),
          contact1('Thomas Wise', 'assets/6.png', 'thomas@email.com', 5),
          text(),
          button()
        ],
      )),
    );
  }
}
