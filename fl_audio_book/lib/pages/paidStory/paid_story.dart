import 'package:fl_audio_book/localization/localization_const.dart';
import 'package:fl_audio_book/theme/theme.dart';
import 'package:flutter/material.dart';

class PaidStoryScreen extends StatelessWidget {
  PaidStoryScreen({Key? key}) : super(key: key);

  final paidStorylist = [
    {
      "image": "assets/books/book9.png",
      "name": "Dear Universe",
      "rate": 5.5,
      "view": "2.5m",
      "author": "By Sarah prout"
    },
    {
      "image": "assets/books/book10.png",
      "name": "The Way Life Should",
      "rate": 2.5,
      "view": "2.5m",
      "author": "By Baker kline"
    },
    {
      "image": "assets/books/book11.png",
      "name": "Harry Potter",
      "rate": 2.5,
      "view": "2.5m",
      "author": "By J.K.Rowling"
    },
    {
      "image": "assets/books/book12.png",
      "name": "Rebirth",
      "rate": 4.5,
      "view": "2.5m",
      "author": "By Jahnavi Barua"
    },
    {
      "image": "assets/paidStory/paidBook5.png",
      "name": "The Foundling",
      "rate": 4.5,
      "view": "2.5m",
      "author": "By Ann Leary"
    },
    {
      "image": "assets/paidStory/paidBook6.png",
      "name": "Tales & Time",
      "rate": 4.5,
      "view": "1.5m",
      "author": "By G.Bailey"
    },
    {
      "image": "assets/books/book1.png",
      "name": "Dark Operative",
      "rate": 4.5,
      "view": "4.5m",
      "author": "By I.T. Lucas"
    },
    {
      "image": "assets/books/book2.png",
      "name": "Bed Boys After Dark",
      "rate": 1.5,
      "view": "2.5m",
      "author": "By melissa foster"
    },
    {
      "image": "assets/books/book7.png",
      "name": "A life",
      "rate": 4.5,
      "view": "1.5m",
      "author": "By A.P.J.Abdul kalam"
    },
    {
      "image": "assets/books/book8.png",
      "name": "Ignited Minds",
      "rate": 5.5,
      "view": "3.5m",
      "author": "By A.P.J.Abdul kalam"
    },
    {
      "image": "assets/paidStory/paidBook11.png",
      "name": "Holly Black",
      "rate": 2.5,
      "view": "1.5m",
      "author": "By Sarah prout"
    },
    {
      "image": "assets/paidStory/paidBook12.png",
      "name": "Stars Across Time",
      "rate": 2.5,
      "view": "1.5m",
      "author": "Stars Across Time"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: backgroundColor,
        foregroundColor: blackColor2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          getTranslate(context, 'paid_story.paid_story'),
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: GridView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
          left: fixPadding * 2,
          right: fixPadding * 2,
          top: fixPadding,
          bottom: fixPadding * 2,
        ),
        itemCount: paidStorylist.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: fixPadding * 2,
          crossAxisSpacing: fixPadding * 2,
          childAspectRatio: size.width / (size.height / 1.4),
        ),
        itemBuilder: (BuildContext context, int index) {
          return listContent(index, context, size);
        },
      ),
    );
  }

  listContent(int index, BuildContext context, Size size) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/getPremium');
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                padding: const EdgeInsets.all(fixPadding / 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(
                      paidStorylist[index]['image'].toString(),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: size.height * 0.03,
                    width: size.height * 0.03,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryColor,
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "\$",
                      style: bold16White,
                    ),
                  ),
                ),
              ),
            ),
            height5Space,
            Text(
              paidStorylist[index]['name'].toString(),
              style: bold15Black2,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 14,
                      color: primaryColor,
                    ),
                    width5Space,
                    Text(
                      paidStorylist[index]['rate'].toString(),
                      style: regular14Black2,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
                widthSpace,
                Row(
                  children: [
                    const Icon(
                      Icons.visibility,
                      size: 14,
                      color: primaryColor,
                    ),
                    width5Space,
                    Text(
                      paidStorylist[index]['view'].toString(),
                      style: regular14Black2,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                )
              ],
            ),
            Text(
              paidStorylist[index]['author'].toString(),
              style: semibold14Grey94,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
