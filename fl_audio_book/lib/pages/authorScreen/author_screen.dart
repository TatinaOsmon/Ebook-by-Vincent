import 'package:dotted_border/dotted_border.dart';
import 'package:fl_audio_book/theme/theme.dart';
import 'package:fl_audio_book/widget/column_builder.dart';
import 'package:flutter/material.dart';

import '../../localization/localization_const.dart';

class AuthorScreen extends StatefulWidget {
  const AuthorScreen({Key? key}) : super(key: key);

  @override
  State<AuthorScreen> createState() => _AuthorScreenState();
}

class _AuthorScreenState extends State<AuthorScreen>
    with SingleTickerProviderStateMixin {
  final booklist = [
    "assets/author/book1.png",
    "assets/author/book2.png",
    "assets/author/book3.png",
    "assets/author/book4.png",
    "assets/author/book5.png",
    "assets/author/book6.png",
    "assets/author/book7.png",
    "assets/author/book8.png",
    "assets/author/book9.png",
    "assets/author/book10.png",
    "assets/author/book11.png",
    "assets/author/book12.png",
    "assets/author/book13.png",
    "assets/author/book14.png",
    "assets/author/book15.png",
  ];

  final reviewlist = [
    {
      "image": "assets/author/review1.png",
      "name": "Cameron Williamson",
      "rate": 5,
      "review":
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. Velit Amet minim mollit non",
    },
    {
      "image": "assets/author/review2.png",
      "name": "Brooklyn Simmons",
      "rate": 4,
      "review":
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. Velit Amet minim mollit non",
    },
    {
      "image": "assets/author/review3.png",
      "name": "Leslie Alexander",
      "rate": 3,
      "review":
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. Velit Amet minim mollit non",
    },
    {
      "image": "assets/author/review4.png",
      "name": "Leslie Alexander",
      "rate": 3,
      "review":
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. Velit Amet minim mollit non",
    },
    {
      "image": "assets/author/review5.png",
      "name": "Annette Black",
      "rate": 3,
      "review":
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. Velit Amet minim mollit non",
    },
    {
      "image": "assets/author/review6.png",
      "name": "Jacob Jones",
      "rate": 2,
      "review":
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. Velit Amet minim mollit non",
    },
  ];

  bool isFollow = false;

  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

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
        title: const Text(
          "Rhonda Byre’s",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          authorProfile(size),
          height5Space,
          tabBar(size),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                firstTabView(size),
                secondTabview(size),
              ],
            ),
          )
        ],
      ),
    );
  }

  secondTabview(Size size) {
    return ListView(
      padding: const EdgeInsets.only(
        left: fixPadding * 2,
        right: fixPadding * 2,
        top: fixPadding * 2,
        bottom: fixPadding,
      ),
      physics: const BouncingScrollPhysics(),
      children: [
        Text.rich(
          TextSpan(
            text: getTranslate(context, 'author.review'),
            style: bold18Black2,
            children: const [TextSpan(text: "(120)", style: bold16Black2)],
          ),
        ),
        heightSpace,
        ColumnBuilder(
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: size.height * 0.065,
                        width: size.height * 0.065,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              reviewlist[index]['image'].toString(),
                            ),
                          ),
                        ),
                      ),
                      widthSpace,
                      width5Space,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              reviewlist[index]['name'].toString(),
                              style: semibold16Black2,
                            ),
                            Row(
                              children: [
                                for (int i = 0; i < 5; i++)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: fixPadding / 6),
                                    child: Icon(
                                      Icons.star,
                                      size: 17,
                                      color: (i <
                                              (reviewlist[index]['rate']
                                                  as int))
                                          ? primaryColor
                                          : grey94Color,
                                    ),
                                  )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  height5Space,
                  Text(
                    reviewlist[index]['review'].toString(),
                    style: semibold14Grey94,
                  )
                ],
              ),
            );
          },
          itemCount: reviewlist.length,
        )
      ],
    );
  }

  firstTabView(Size size) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: booklist.length,
      padding: const EdgeInsets.all(fixPadding * 2),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: fixPadding * 2,
        mainAxisSpacing: fixPadding * 2,
        childAspectRatio: size.width / (size.height / 1.5),
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/storyDetail');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(
                  booklist[index],
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }

  tabBar(Size size) {
    return Stack(
      children: [
        Container(
          height: size.height * 0.07,
          width: double.infinity,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 2, color: greyD9Color),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.07,
          width: double.infinity,
          child: TabBar(
            indicatorColor: primaryColor,
            labelStyle: bold16Primary,
            labelColor: primaryColor,
            unselectedLabelColor: blackColor2.withOpacity(0.6),
            controller: tabController,
            tabs: [
              Tab(
                text: getTranslate(context, 'author.book'),
              ),
              Tab(
                text: getTranslate(context, 'author.review'),
              )
            ],
          ),
        ),
      ],
    );
  }

  authorProfile(Size size) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      decoration: BoxDecoration(
        color: const Color(0xFFDCDBDB),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: fixPadding,
              horizontal: fixPadding * 2,
            ),
            child: Row(
              children: [
                Container(
                  height: size.height * 0.075,
                  width: size.height * 0.075,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/author/author.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                widthSpace,
                width5Space,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Rhonda Byrne's",
                        style: bold16Black2,
                      ),
                      Text(
                        getTranslate(context, 'author.novelist'),
                        style: semibold14Grey94,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          DottedBorder(
            padding: EdgeInsets.zero,
            color: primaryColor,
            dashPattern: const [3, 3],
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: fixPadding * 2,
              vertical: fixPadding,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          const Text(
                            "129",
                            style: bold18Black2,
                          ),
                          Text(getTranslate(context, 'author.books'),
                              style: semibold14Black2,
                              overflow: TextOverflow.ellipsis)
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: fixPadding * 1.5),
                        height: size.height * 0.06,
                        width: 1,
                        color: const Color(0xffBDBDBD),
                      ),
                      Column(
                        children: [
                          const Text(
                            "300k",
                            style: bold18Black2,
                          ),
                          Text(
                            getTranslate(context, 'author.followers'),
                            style: semibold14Black2,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isFollow = !isFollow;
                    });
                  },
                  child: Container(
                    width: size.width * 0.25,
                    height: size.height * 0.055,
                    padding:
                        const EdgeInsets.symmetric(horizontal: fixPadding / 2),
                    decoration: BoxDecoration(
                      color: isFollow ? whiteColor : primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text(
                        isFollow
                            ? getTranslate(context, 'author.unfollow')
                            : getTranslate(context, 'author.follow'),
                        style: isFollow ? bold16Primary : bold16White,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
