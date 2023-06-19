import 'package:fl_audio_book/localization/localization_const.dart';
import 'package:fl_audio_book/theme/theme.dart';
import 'package:flutter/material.dart';

class FollowListScreen extends StatefulWidget {
  const FollowListScreen({Key? key}) : super(key: key);

  @override
  State<FollowListScreen> createState() => _FollowListScreenState();
}

class _FollowListScreenState extends State<FollowListScreen> {
  final authorfollowList = [
    {
      "image": "assets/famousAuthor/Ellipse 13 (6).png",
      "name": "Rhonda Byrne's",
      "place": "American novelist",
      "isFollow": true
    },
    {
      "image": "assets/famousAuthor/Ellipse 13 (14).png",
      "name": "Nora Roberts",
      "place": "American novelist",
      "isFollow": true
    },
    {
      "image": "assets/famousAuthor/Ellipse 13 (10).png",
      "name": "Dan Brown",
      "place": "American novelist",
      "isFollow": true
    },
  ];

  bool? isFollow;

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
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          getTranslate(context, 'follow_list.your_list'),
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView.builder(
        itemCount: authorfollowList.length,
        padding: const EdgeInsets.only(
            left: fixPadding * 2, right: fixPadding * 2, bottom: fixPadding),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/authorScreen');
            },
            child: Container(
              padding: const EdgeInsets.all(fixPadding),
              margin: const EdgeInsets.symmetric(vertical: fixPadding),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    height: size.height * 0.085,
                    width: size.height * 0.085,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          authorfollowList[index]['image'].toString(),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  widthSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          authorfollowList[index]['name'].toString(),
                          style: bold16Black2,
                        ),
                        Text(
                          authorfollowList[index]['place'].toString(),
                          style: semibold14Grey94,
                        )
                      ],
                    ),
                  ),
                  width5Space,
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFollow = authorfollowList[index]['isFollow'] as bool;
                        authorfollowList[index]['isFollow'] = !isFollow!;
                      });
                    },
                    child: Container(
                      width: size.width * 0.25,
                      height: size.height * 0.06,
                      padding: const EdgeInsets.symmetric(
                          horizontal: fixPadding / 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: authorfollowList[index]['isFollow'] == true
                              ? const Color(0xffB4B4B4)
                              : primaryColor),
                      alignment: Alignment.center,
                      child: FittedBox(
                        child: Text(
                          authorfollowList[index]['isFollow'] == true
                              ? getTranslate(context, 'follow_list.unfollow')
                              : getTranslate(context, 'follow_list.follow'),
                          style: bold16White,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
