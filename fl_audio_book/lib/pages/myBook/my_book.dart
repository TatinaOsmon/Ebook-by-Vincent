import 'package:fl_audio_book/localization/localization_const.dart';
import 'package:fl_audio_book/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyBookScreen extends StatefulWidget {
  const MyBookScreen({Key? key}) : super(key: key);

  @override
  State<MyBookScreen> createState() => _MyBookScreenState();
}

class _MyBookScreenState extends State<MyBookScreen> {
  final mybookList = [
    {
      "image": "assets/books/book13.png",
      "name": "Ruthless As Hell",
      "rate": 3.5,
      "view": "2.5m",
      "author": "G Bailey",
    },
    {
      "image": "assets/books/book8.png",
      "name": "Ignited Minds",
      "rate": 4.5,
      "view": "4.5m",
      "author": "Abdul kalam",
    },
    {
      "image": "assets/books/book14.png",
      "name": "Best wife",
      "rate": 3.5,
      "view": "2.5m",
      "author": "Ajay K Pandey",
    },
    {
      "image": "assets/books/book4.png",
      "name": "Dark Secret",
      "rate": 4.5,
      "view": "1.5m",
      "author": "I. T. Lucas",
    },
    {
      "image": "assets/books/book11.png",
      "name": "Harry Potter",
      "rate": 2.5,
      "view": "1.5m",
      "author": "I. T. Lucas ",
    },
    {
      "image": "assets/books/book3.png",
      "name": "Dark hope",
      "rate": 3.5,
      "view": "2.5m",
      "author": "I. T. Lucas ",
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
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor,
        foregroundColor: blackColor2,
        elevation: 0,
        centerTitle: false,
        title: Text(
          getTranslate(context, 'my_book.my_book'),
          style: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body:
          mybookList.isEmpty ? emptyMybooklist(context) : mybookListview(size),
    );
  }

  emptyMybooklist(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/mybook/fa6-solid_heart-circle-xmark.png",
            height: 40,
            width: 40,
          ),
          heightSpace,
          Text(
            getTranslate(context, 'my_book.empty_text'),
            style: bold16Grey94,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  mybookListview(Size size) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(
        bottom: fixPadding,
      ),
      itemCount: mybookList.length,
      itemBuilder: (context, index) {
        return booklist(index, context, size);
      },
    );
  }

  booklist(int index, BuildContext context, Size size) {
    return Slidable(
      key: UniqueKey(),
      endActionPane: ActionPane(
        extentRatio: 0.13,
        motion: const ScrollMotion(),
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                mybookList.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: blackColor,
                  content: Text(
                    getTranslate(context, 'favorite.remove_book'),
                    style: const TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(
                    milliseconds: 1500,
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: fixPadding / 1.5),
              margin: const EdgeInsets.symmetric(vertical: fixPadding),
              decoration: BoxDecoration(
                color: redColor,
                borderRadius: BorderRadius.circular(5),
              ),
              alignment: Alignment.center,
              child: const Icon(
                Icons.delete_outline,
                color: whiteColor,
              ),
            ),
          )
        ],
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/storyDetail');
        },
        child: Container(
          padding: const EdgeInsets.all(fixPadding),
          margin: const EdgeInsets.symmetric(
              vertical: fixPadding, horizontal: fixPadding * 2),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: blackColor.withOpacity(0.25),
                blurRadius: 6,
              )
            ],
          ),
          child: Row(
            children: [
              Container(
                height: size.height * 0.08,
                width: size.height * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: AssetImage(
                      mybookList[index]['image'].toString(),
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
                      mybookList[index]['name'].toString(),
                      style: bold16Black2,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 15,
                              color: primaryColor,
                            ),
                            width5Space,
                            Text(
                              mybookList[index]['rate'].toString(),
                              style: semibold14Black2,
                            )
                          ],
                        ),
                        widthSpace,
                        Row(
                          children: [
                            const Icon(
                              Icons.visibility,
                              size: 15,
                              color: primaryColor,
                            ),
                            width5Space,
                            Text(
                              mybookList[index]['view'].toString(),
                              style: semibold14Black2,
                            )
                          ],
                        )
                      ],
                    ),
                    Text(
                      mybookList[index]['author'].toString(),
                      style: semibold14Grey94,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
