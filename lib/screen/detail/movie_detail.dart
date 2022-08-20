import 'package:flutter/material.dart';
import 'package:fugi_movie_app_team6/constant/colors.dart';
import 'package:fugi_movie_app_team6/data/movies.dart';
import 'package:fugi_movie_app_team6/screen/detail/widgets/buildBottom.dart';

class MovieDetail extends StatefulWidget {
  final List reviewList = List.generate(5, (index) {
    return {
      "id": index,
      "image": "",
      "rating": "69",
      "reviewers": "Iqbal Shafiq Rozaan ",
      "message":
          "From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government. "
    };
  });
  final Movies movies;
  MovieDetail(this.movies, {Key? key}) : super(key: key);

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController =
        TabController(length: myTab.length, vsync: this);
    return Scaffold(
        backgroundColor: kBackground,
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 75),
              child: buildHeader(context),
            ),
            SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 12),
                  child: categoryList(context),
                )),
            SizedBox(
              height: 50,
              child: TabBar(
                controller: _tabController,
                tabs: myTab,
                indicatorColor: kSecondaryColor,
                indicatorWeight: 5,
              ),
            ),
            SizedBox(
              height: 350,
              child: TabBarView(
                controller: _tabController,
                children: [
                  ///detail movie
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          detailMovie(context),
                        ]),
                  ),

                  ///revies movie
                  ListView.builder(
                      itemBuilder: (context, index) => Container(
                            color: kBackground,
                            // elevation: 6,
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.amber,
                                child: Text(widget.reviewList[index]["rating"]),
                              ),
                              title: Text(
                                widget.reviewList[index]["reviewers"],
                                style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    color: kThirdColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                                maxLines: 5,
                              ),
                              subtitle: Text(
                                widget.reviewList[index]["message"],
                                style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    color: kThirdColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                                maxLines: 5,
                              ),
                            ),
                          ),
                      itemCount: widget.reviewList.length),
                ],
              ),
            ),
            const Spacer(),
            BuildBottom(),
          ],
        ));
  }
}

Widget buildHeader(BuildContext context) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        decoration: const BoxDecoration(
          color: kBackground,
        ),
      ),
      Container(
        height: 210,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/spiderman_banner.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
        left: 20,
        top: 160,
        child: Image.asset('assets/images/spiderman.png'),
      ),
      const Positioned(
        left: 130,
        top: 220,
        child: Text(
          "Spiderman No Way \nHome",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: kFouthColor),
        ),
      ),
    ],
  );
}

Widget buildTabBar(BuildContext context) {
  return Column(
    children: const [],
  );
}

Widget detailMovie(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Overviews:",
        style: TextStyle(
            fontFamily: 'Poppins',
            color: kThirdColor,
            fontSize: 12,
            fontWeight: FontWeight.w600),
        maxLines: 1,
      ),
      const SizedBox(
        height: 5,
      ),
      const Text(
        "From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.",
        style: TextStyle(
            fontFamily: 'Poppins',
            color: kThirdColor,
            fontSize: 12,
            fontWeight: FontWeight.w400),
        maxLines: 5,
      ),
      const SizedBox(
        height: 12,
      ),
      const Text(
        "Realease date",
        style: TextStyle(
            fontFamily: 'Poppins',
            color: kThirdColor,
            fontSize: 12,
            fontWeight: FontWeight.w600),
        maxLines: 1,
      ),
      const SizedBox(
        height: 5,
      ),
      const Text(
        "2019-08-03",
        style: TextStyle(
            fontFamily: 'Poppins',
            color: kThirdColor,
            fontSize: 12,
            fontWeight: FontWeight.w400),
        maxLines: 1,
      ),
      const SizedBox(
        height: 12,
      ),
      Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Average rating",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: kThirdColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
                maxLines: 1,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "9.6",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: kThirdColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
                maxLines: 1,
              ),
            ],
          ),
          const SizedBox(
            width: 150,
          ),
          Column(
            children: const [
              Text(
                "Rate Count",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: kThirdColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
                maxLines: 1,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "1466",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: kThirdColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
                maxLines: 1,
              ),
            ],
          )
        ],
      ),
      const SizedBox(
        height: 12,
      ),
      const Text(
        "Popularity",
        style: TextStyle(
            fontFamily: 'Poppins',
            color: kThirdColor,
            fontSize: 12,
            fontWeight: FontWeight.w600),
        maxLines: 1,
      ),
      const SizedBox(
        height: 5,
      ),
      const Text(
        "48.261451",
        style: TextStyle(
            fontFamily: 'Poppins',
            color: kThirdColor,
            fontSize: 12,
            fontWeight: FontWeight.w400),
        maxLines: 1,
      ),
    ],
  );
}

List<Tab> myTab = [
  const Tab(
    text: 'About Movie',
  ),
  const Tab(
    text: 'Review',
  ),
];

Widget categoryList(BuildContext context) {
  return ListView(
    scrollDirection: Axis.horizontal,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 24,
            width: 79,
            decoration: BoxDecoration(
              color: kSecondaryColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Center(
              child: Text(
                'Action',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: kThirdColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Container(
            height: 24,
            width: 79,
            decoration: BoxDecoration(
              color: kSecondaryColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Center(
              child: Text(
                'Action',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: kThirdColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Container(
            height: 24,
            width: 79,
            decoration: BoxDecoration(
              color: kSecondaryColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Center(
              child: Text(
                'Action',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: kThirdColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Container(
            height: 24,
            width: 79,
            decoration: BoxDecoration(
              color: kSecondaryColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Center(
              child: Text(
                'Action',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: kThirdColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Container(
            height: 24,
            width: 79,
            decoration: BoxDecoration(
              color: kSecondaryColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Center(
              child: Text(
                'Action',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: kThirdColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Container(
            height: 24,
            width: 79,
            decoration: BoxDecoration(
              color: kSecondaryColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Center(
              child: Text(
                'Action',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: kThirdColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Container(
            height: 24,
            width: 79,
            decoration: BoxDecoration(
              color: kSecondaryColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Text(
              'Action',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  color: kThirdColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),

      // for (var i = 0; i < 10; i++)
      //   Container(
      //     height: 79,
      //     width: 24,
      //     decoration: BoxDecoration(
      //       color: kSecondaryColor,
      //       borderRadius: BorderRadius.circular(18),
      //     ),
      //   ),
    ],
  );
}
