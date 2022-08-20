import 'package:flutter/material.dart';
import 'package:fugi_movie_app_team6/constant/colors.dart';

class BuildBottom extends StatefulWidget {
  const BuildBottom({Key? key}) : super(key: key);

  @override
  State<BuildBottom> createState() => _BuildBottomState();
}

class _BuildBottomState extends State<BuildBottom> {
  bool click = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 29, right: 32, bottom: 31),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 42,
              width: 105,
              decoration: BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(left: 13, right: 16),
                child: Row(
                  children: const [
                    Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    Spacer(),
                    Text(
                      'Back',
                      style: TextStyle(
                          fontSize: 14,
                          color: kFouthColor,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                click = !click;
              });
            },
            child: Container(
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Icon(
                  click ? Icons.bookmark_add : Icons.bookmark,
                  color: click ? kPrimaryColor : Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
