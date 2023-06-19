import 'package:fl_audio_book/localization/localization_const.dart';
import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class HorrorScreen extends StatelessWidget {
  HorrorScreen({Key? key}) : super(key: key);

  final horrorList = [
    {
      "image": "assets/books/book13.png",
      "name": "Ruthless As Hell",
      "rate": 3.5,
      "view": "2.5m",
      "author": "G Bailey"
    },
    {
      "image": "assets/books/book14.png",
      "name": "Best Wife",
      "rate": 2.5,
      "view": "1.5m",
      "author": "By Ajay K Pandey"
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
      "image": "assets/books/book3.png",
      "name": "Dark Hope",
      "rate": 3.5,
      "view": "7.5m",
      "author": "By H.D.Smith"
    },
    {
      "image": "assets/books/book4.png",
      "name": "Dark Secret",
      "rate": 2.5,
      "view": "1.5m",
      "author": "By I. T. Lucas"
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
      "image": "assets/books/book5.png",
      "name": "Marrying Winterborne",
      "rate": 4.5,
      "view": "3.5m",
      "author": "G Bailey"
    },
    {
      "image": "assets/books/book6.png",
      "name": "Meditation",
      "rate": 3.5,
      "view": "4.5m",
      "author": "By Gabrielle Bernstein"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        foregroundColor: blackColor2,
        centerTitle: false,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          getTranslate(context, 'horror.horror'),
          style: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
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
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: fixPadding * 2,
          crossAxisSpacing: fixPadding * 2,
          childAspectRatio: size.width / (size.height / 1.4),
        ),
        itemCount: horrorList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/storyDetail');
            },
            child: Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(
                            horrorList[index]['image'].toString(),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  height5Space,
                  Text(
                    horrorList[index]['name'].toString(),
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
                          Text(horrorList[index]['rate'].toString(),
                              style: regular14Black2,
                              overflow: TextOverflow.ellipsis)
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
                            horrorList[index]['view'].toString(),
                            style: regular14Black2,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      )
                    ],
                  ),
                  Text(
                    horrorList[index]['author'].toString(),
                    style: semibold14Grey94,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
