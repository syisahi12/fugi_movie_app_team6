import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fugi_movie_app_team6/constant/colors.dart';

class TitleCategories extends StatelessWidget {
  final String title;
  final TabController? tabController;
  final int nomor;
  const TitleCategories(
      {Key? key,
      required this.title,
      required this.tabController,
      required this.nomor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: 32,
          color:
              tabController!.index == nomor ? kPrimaryColor : kSecondaryColor,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(22, 7, 22, 7),
              child: Text(
                title,
                style: tabController!.index == nomor
                    ? const TextStyle(color: kBackground, fontSize: 12)
                    : const TextStyle(color: kFouthColor, fontSize: 12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
