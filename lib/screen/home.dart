import 'package:flutter/material.dart';
import 'package:fugi_movie_app_team6/constant/colors.dart';
import 'package:fugi_movie_app_team6/screen/list_movie.dart';

import 'dashboard.dart';

/// ini coba watch list
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int? isCategories;
  double _valueRating = 0.0;
  TextEditingController searchControlller = TextEditingController();
  String searchMovie = '';

  void resetSearch() {
    setState(() {
    });
    searchControlller.clear();
  }

  @override
  void initState() {
    super.initState();
    resetSearch();
    isCategories = 0;
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackground,
        body: Stack(
          children: [
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 29, right: 29),
                  child: Column(
                    children: [
                      Container(
                          width: width - 58,
                          height: 54,
                          color: Colors.transparent,
                          child: const Text(
                            'Movie DB App',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.w700),
                          )),
                      const SizedBox(height: 22),
                      SizedBox(
                        width: width - 58,
                        height: 27,
                        child: const Text(
                          'Find Your Movies',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Container(
                          width: width - 58,
                          height: 42,
                          color: kBackground,
                          child: Row(
                            children: [
                              Container(
                                width: width - 123,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  child: TextField(
                                    controller: searchControlller,
                                    onChanged: (value) {
                                      searchMovie = value;
                                    },
                                    decoration: InputDecoration(
                                        hintText: 'Search Here ...',
                                        border: InputBorder.none,
                                        hintStyle:
                                            TextStyle(color: kFouthColor)),
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: kSecondaryColor,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                width: 42,
                                child: IconButton(
                                    onPressed: () {
                                      resetSearch();
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => ListMovie(
                                                  title: searchMovie)));
                                    },
                                    icon: const Icon(
                                      Icons.search,
                                      color: kFouthColor,
                                    )),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: kSecondaryColor,
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(height: 22),
                      SizedBox(
                        width: width - 58,
                        height: 27,
                        child: const Text(
                          'Categories',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            color: Color(0xFFEEEEEE),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 29),
                TabBar(
                  padding: const EdgeInsets.only(left: 29, right: 29),
                  onTap: (value) {
                    setState(() {});
                    isCategories = value;
                    debugPrint('isCategories $isCategories');
                  },
                  controller: _tabController,
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  tabs: [
                    Tab(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          height: 32,
                          color: _tabController!.index == 0
                              ? kPrimaryColor
                              : kSecondaryColor,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(22, 7, 22, 7),
                            child: Text(
                              'Top Rated',
                              style: _tabController!.index == 0
                                  ? const TextStyle(
                                      color: kBackground, fontSize: 12)
                                  : const TextStyle(
                                      color: kFouthColor, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          height: 32,
                          color: _tabController!.index == 1
                              ? kPrimaryColor
                              : kSecondaryColor,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(22, 7, 22, 7),
                            child: Text(
                              'Popular',
                              style: _tabController!.index == 1
                                  ? const TextStyle(
                                      color: kBackground, fontSize: 12)
                                  : const TextStyle(
                                      color: kFouthColor, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          height: 32,
                          color: _tabController!.index == 2
                              ? kPrimaryColor
                              : kSecondaryColor,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(22, 7, 22, 7),
                            child: Text(
                              'Action',
                              style: _tabController!.index == 2
                                  ? const TextStyle(
                                      color: kBackground, fontSize: 12)
                                  : const TextStyle(
                                      color: kFouthColor, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          height: 32,
                          color: _tabController!.index == 3
                              ? kPrimaryColor
                              : kSecondaryColor,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(22, 7, 22, 7),
                            child: Text(
                              'Action',
                              style: _tabController!.index == 3
                                  ? const TextStyle(
                                      color: kBackground, fontSize: 12)
                                  : const TextStyle(
                                      color: kFouthColor, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 31),
                Padding(
                  padding: const EdgeInsets.only(left: 29, right: 29),
                  child: SizedBox(
                    height: 300,
                    width: width - 58,
                    child:
                        TabBarView(controller: _tabController, children: const [
                      Dashboard(),
                      Dashboard(),
                      Dashboard(),
                      Dashboard(),
                    ]),
                  ),
                ),
                Row(
                  children: [
                    const Spacer(),
                    Text((_valueRating.round() * 0.1).toStringAsFixed(1),
                        style: const TextStyle(
                            fontSize: 12,
                            color: kFouthColor,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500)),
                    SizedBox(
                      width: 300,
                      child: Slider(
                        activeColor: kFouthColor,
                        thumbColor: kPrimaryColor,
                        inactiveColor: kFouthColor,
                        value: _valueRating,
                        min: 0,
                        max: 100,
                        divisions: 100,
                        label:
                            "Rating: ${(_valueRating.round() * 0.1).toStringAsFixed(1)}",
                        onChanged: (double value) {
                          setState(() {
                            _valueRating = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 29, right: 29, bottom: 20),
                  child: SizedBox(
                    height: 42,
                    width: width - 59,
                    child: Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    ListMovie(title: searchControlller.text),
                              ));
                            },
                            child: const Text(
                              'Load More',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: kFouthColor,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600),
                            )),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 42,
                            width: 134,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Row(children: const [
                                Text(
                                  'Watch List',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: kBackground,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600),
                                ),
                                Spacer(),
                                Icon(Icons.bookmark)
                              ]),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
