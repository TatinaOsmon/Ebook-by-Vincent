import 'package:flutter/material.dart';

import '../../localization/localization_const.dart';
import '../../theme/theme.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final topbooklist = [
    {"image": "assets/search/top1.png", "name": "Poetry"},
    {"image": "assets/search/top2.png", "name": "English literature"},
    {"image": "assets/search/top3.png", "name": "Romance"},
    {"image": "assets/search/top4.png", "name": "Fiction"},
  ];
  final browse = [
    {"image": "assets/search/browse1.png", "name": "Horror"},
    {"image": "assets/search/browse2.png", "name": "Adventure"},
    {"image": "assets/search/browse3.png", "name": "Short story"},
    {"image": "assets/search/browse4.png", "name": "Fantasy"},
    {"image": "assets/search/browse5.png", "name": "Comic"},
    {"image": "assets/search/browse6.png", "name": "Classic"},
    {"image": "assets/search/browse7.png", "name": "KIds"},
    {"image": "assets/search/browse8.png", "name": "Graphics"},
    {"image": "assets/search/browse9.png", "name": "LGBT"},
    {"image": "assets/search/browse10.png", "name": "Top 10 stories"},
    {"image": "assets/search/browse11.png", "name": "Motivational"},
    {"image": "assets/search/browse12.png", "name": "Art"},
  ];

  final languages = [
    {"name": "English", "id": 0},
    {"name": "Hindi", "id": 1},
    {"name": "Gujrati", "id": 2},
  ];

  final whatyouwant = [
    {"name": "Reading", "id": 0},
    {"name": "Listening", "id": 1},
  ];

  final categories = [
    {"name": "Horror", "id": 0},
    {"name": "Poetry", "id": 1},
    {"name": "Romance", "id": 2},
    {"name": "Fiction", "id": 3},
    {"name": "Comic", "id": 4},
    {"name": "Classic", "id": 5},
    {"name": "Motivational", "id": 6},
    {"name": "Kids ", "id": 7},
    {"name": "Adventure", "id": 8},
    {"name": "Short story", "id": 9},
    {"name": "Fantasy", "id": 10},
  ];

  int selectedLanguage = 0;
  int selecteyouWant = 1;
  int selectedCategories = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        foregroundColor: blackColor2,
        centerTitle: false,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          getTranslate(context, 'search.search'),
          style: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          height5Space,
          searchField(size),
          heightSpace,
          listview(size)
        ],
      ),
    );
  }

  listview(Size size) {
    return Expanded(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
          left: fixPadding * 2,
          right: fixPadding * 2,
          top: fixPadding / 2,
          bottom: fixPadding,
        ),
        children: [
          topBookTitle(),
          topbookListview(size),
          heightSpace,
          browseAllTitle(),
          browseAllListview(size),
        ],
      ),
    );
  }

  browseAllListview(Size size) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: fixPadding),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: fixPadding * 2,
        crossAxisSpacing: fixPadding * 2,
        childAspectRatio: size.width / (size.height / 3),
      ),
      itemCount: browse.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/horror');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(
                  browse[index]['image'].toString(),
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: fixPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: blackColor.withOpacity(0.7),
              ),
              alignment: Alignment.center,
              child: Text(
                "#${browse[index]['name']}",
                style: bold18White,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }

  browseAllTitle() {
    return Text(
      getTranslate(context, 'search.browse_all'),
      style: bold18Black2,
    );
  }

  topbookListview(Size size) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: fixPadding),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: fixPadding * 2,
        crossAxisSpacing: fixPadding * 2,
        childAspectRatio: size.width / (size.height / 5),
      ),
      itemCount: topbooklist.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/horror');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(
                  topbooklist[index]['image'].toString(),
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: fixPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: blackColor.withOpacity(0.7),
              ),
              alignment: Alignment.center,
              child: FittedBox(
                child: Text(
                  "#${topbooklist[index]['name']}",
                  style: bold18White,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  topBookTitle() {
    return Text(
      getTranslate(context, 'search.top_book'),
      style: bold18Black2,
    );
  }

  searchField(Size size) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.25),
            blurRadius: 5,
          )
        ],
      ),
      child: TextField(
        onTap: () {
          Navigator.pushNamed(context, '/searchScreen');
        },
        readOnly: true,
        style: const TextStyle(height: 1.5),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: const Icon(
            Icons.search,
            size: 22,
            color: grey94Color,
          ),
          hintText: getTranslate(context, 'search.search'),
          hintStyle: semibold16Grey94,
          suffixIcon: IconButton(
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                constraints: BoxConstraints(
                  maxHeight: size.height - 50,
                ),
                context: context,
                builder: (context) {
                  return StatefulBuilder(builder: (context, state) {
                    return Container(
                      padding: const EdgeInsets.only(
                          left: fixPadding * 2,
                          right: fixPadding * 2,
                          top: fixPadding * 2),
                      width: double.maxFinite,
                      decoration: const BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      child: ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          Center(
                            child: Text(
                              getTranslate(context, 'search.filter'),
                              style: bold20Black2,
                            ),
                          ),
                          heightSpace,
                          heightSpace,
                          languagefilterlist(state),
                          divider(),
                          whatyouWantFilterlist(state),
                          divider(),
                          categoriesFilterList(state),
                          heightSpace,
                          heightSpace,
                          heightSpace,
                          filterButton(context, size),
                          resetButton()
                        ],
                      ),
                    );
                  });
                },
              );
            },
            icon: const Icon(
              Icons.filter_list,
              color: blackColor2,
            ),
          ),
        ),
      ),
    );
  }

  resetButton() {
    return Center(
      child: TextButton(
        onPressed: () {
          setState(() {
            selectedLanguage = 0;
            selecteyouWant = 1;
            selectedCategories = 0;
          });
          Navigator.pop(context);
        },
        child: Text(
          getTranslate(
            context,
            getTranslate(context, 'search.reset'),
          ),
          style: bold15Black2,
        ),
      ),
    );
  }

  filterButton(BuildContext context, Size size) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: size.height * 0.07,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: primaryColor,
          boxShadow: [
            BoxShadow(
              color: grey94Color.withOpacity(0.20),
              blurRadius: 24,
              offset: const Offset(24, 24),
            )
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          getTranslate(context, 'search.filter'),
          style: bold18White,
        ),
      ),
    );
  }

  categoriesFilterList(StateSetter state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getTranslate(context, 'search.categories'),
          style: bold18Black2,
        ),
        heightSpace,
        Wrap(
          direction: Axis.horizontal,
          spacing: fixPadding,
          runSpacing: fixPadding,
          children: categories
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    state(() {
                      setState(() {
                        selectedCategories = e['id'] as int;
                      });
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: fixPadding * 1.5, vertical: fixPadding),
                    decoration: BoxDecoration(
                      color: selectedCategories == e['id']
                          ? primaryColor
                          : whiteColor,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: blackColor.withOpacity(0.25),
                          blurRadius: 5,
                        )
                      ],
                    ),
                    child: Text(
                      e['name'].toString(),
                      style: selectedCategories == e['id']
                          ? bold16White
                          : bold16Grey94,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  whatyouWantFilterlist(StateSetter state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getTranslate(context, 'search.what_you_want'),
          style: bold18Black2,
        ),
        heightSpace,
        Wrap(
          direction: Axis.horizontal,
          spacing: fixPadding * 1.5,
          runSpacing: fixPadding,
          children: whatyouwant
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    state(() {
                      setState(() {
                        selecteyouWant = e['id'] as int;
                      });
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: fixPadding * 1.5, vertical: fixPadding),
                    decoration: BoxDecoration(
                      color:
                          selecteyouWant == e['id'] ? primaryColor : whiteColor,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: blackColor.withOpacity(0.25),
                          blurRadius: 5,
                        )
                      ],
                    ),
                    child: Text(
                      e['name'].toString(),
                      style: selecteyouWant == e['id']
                          ? bold16White
                          : bold16Grey94,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  divider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: fixPadding * 2),
      height: 1,
      width: double.maxFinite,
      color: const Color(0xffD4D4D4),
    );
  }

  languagefilterlist(StateSetter state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getTranslate(context, 'search.language'),
          style: bold18Black2,
        ),
        heightSpace,
        Wrap(
          direction: Axis.horizontal,
          spacing: fixPadding * 1.5,
          runSpacing: fixPadding,
          children: languages
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    state(() {
                      setState(() {
                        selectedLanguage = e['id'] as int;
                      });
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: fixPadding * 1.5, vertical: fixPadding),
                    decoration: BoxDecoration(
                      color: selectedLanguage == e['id']
                          ? primaryColor
                          : whiteColor,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: blackColor.withOpacity(0.25),
                          blurRadius: 5,
                        )
                      ],
                    ),
                    child: Text(
                      e['name'].toString(),
                      style: selectedLanguage == e['id']
                          ? bold16White
                          : bold16Grey94,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
