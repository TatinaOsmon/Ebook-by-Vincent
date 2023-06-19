import 'package:fl_audio_book/localization/localization_const.dart';
import 'package:fl_audio_book/theme/theme.dart';
import 'package:fl_audio_book/widget/column_builder.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  final recentSearchList = [
    "#Ignited Minds",
    "#Whiter than snow",
    "#New release book",
    "#Horror story",
  ];

  final trendingList = [
    {
      "image": "assets/search/trending1.png",
      "name": "Rebirth",
      "author": "Sandra Dallas"
    },
    {
      "image": "assets/search/trending2.png",
      "name": "Ruthless As Hell",
      "author": "G Bailey"
    },
    {
      "image": "assets/search/trending3.png",
      "name": "Dark Hope",
      "author": "H.D.Smith"
    },
    {
      "image": "assets/search/trending4.png",
      "name": "The Way Life Should ",
      "author": "Baker kline"
    },
    {
      "image": "assets/search/trending5.png",
      "name": "Dark Secret",
      "author": "I. T. Lucas"
    },
    {
      "image": "assets/search/trending6.png",
      "name": "Ignited Minds",
      "author": "A.P.J.Abdul kalam"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        foregroundColor: blackColor2,
        elevation: 0,
        titleSpacing: 0,
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          getTranslate(context, 'search_screen.search'),
          style: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          height5Space,
          searchTextField(context),
          heightSpace,
          recentAndTrendingList(size),
        ],
      ),
    );
  }

  recentAndTrendingList(Size size) {
    return Expanded(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
          left: fixPadding * 2,
          right: fixPadding * 2,
          top: fixPadding,
          bottom: fixPadding,
        ),
        children: [
          recentSearchList.isEmpty ? const SizedBox() : recentSearchTitle(),
          recentsearchListview(),
          heightSpace,
          topTrendingTitle(),
          height5Space,
          topTrendingListview(size),
        ],
      ),
    );
  }

  topTrendingListview(Size size) {
    return ColumnBuilder(
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: fixPadding),
          child: Row(
            children: [
              Container(
                height: size.height * 0.07,
                width: size.height * 0.07,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: AssetImage(
                      trendingList[index]['image'].toString(),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              widthSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trendingList[index]['name'].toString(),
                    style: semibold16Black2,
                  ),
                  Text(
                    trendingList[index]['author'].toString(),
                    style: semibold14Grey94,
                  )
                ],
              )
            ],
          ),
        );
      },
      itemCount: trendingList.length,
    );
  }

  topTrendingTitle() {
    return Text(
      getTranslate(context, 'search_screen.top_trending'),
      style: bold18Black2,
    );
  }

  recentsearchListview() {
    return ColumnBuilder(
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: fixPadding),
          child: Row(
            children: [
              const Icon(
                Icons.history,
                size: 22,
                color: Color(0xFF848484),
              ),
              widthSpace,
              Text(
                recentSearchList[index],
                style:
                    semibold16Grey94.copyWith(color: const Color(0xFF848484)),
              )
            ],
          ),
        );
      },
      itemCount: recentSearchList.length,
    );
  }

  recentSearchTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            getTranslate(context, 'search_screen.recently_search'),
            style: bold18Black2,
          ),
        ),
        widthSpace,
        InkWell(
          onTap: () {
            setState(() {
              recentSearchList.clear();
            });
          },
          child: Text(
            getTranslate(context, 'search_screen.clear_all'),
            style: bold14Primary,
          ),
        )
      ],
    );
  }

  searchTextField(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.25),
            blurRadius: 5,
          )
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: primaryColor,
          ),
        ),
        child: TextField(
          controller: searchController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: getTranslate(context, 'search_screen.search'),
            hintStyle: bold16Grey94,
            prefixIcon: const Icon(
              Icons.search,
              size: 22,
            ),
          ),
        ),
      ),
    );
  }
}
