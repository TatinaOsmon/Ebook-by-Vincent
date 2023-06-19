import 'package:fl_audio_book/localization/localization_const.dart';
import 'package:fl_audio_book/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({Key? key}) : super(key: key);

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  final downloads = [
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
      "rate": 3.5,
      "view": "2.5m",
      "author": "I. T. Lucas",
    },
    {
      "image": "assets/books/book11.png",
      "name": "Herry Potter",
      "rate": 3.5,
      "view": "2.5m",
      "author": "I. T. Lucas",
    },
    {
      "image": "assets/books/book3.png",
      "name": "Dark hope",
      "rate": 3.5,
      "view": "2.5m",
      "author": "I. T. Lucas ",
    }
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        foregroundColor: blackColor2,
        centerTitle: false,
        elevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          getTranslate(context, 'download.download'),
          style: bold20Black2,
        ),
      ),
      body: downloads.isEmpty ? emptylistContent() : downloadListview(size),
    );
  }

  emptylistContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            CupertinoIcons.arrow_down_to_line_alt,
            color: grey94Color,
            size: 40,
          ),
          heightSpace,
          Text(
            getTranslate(context, 'download.empty_download'),
            style: bold16Grey94,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  downloadListview(Size size) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: fixPadding),
      itemCount: downloads.length,
      itemBuilder: (context, index) {
        return Slidable(
          key: UniqueKey(),
          endActionPane: ActionPane(
            extentRatio: 0.13,
            motion: const ScrollMotion(),
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    downloads.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: blackColor,
                      content: Text(
                        getTranslate(context, 'download.remove_dowmload'),
                        style: const TextStyle(
                          color: whiteColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      duration: const Duration(milliseconds: 1500),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: fixPadding / 1.5),
                  margin: const EdgeInsets.symmetric(vertical: fixPadding),
                  decoration: BoxDecoration(
                    color: redColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  alignment: Alignment.center,
                  child: const Icon(Icons.delete_outline_outlined,
                      color: whiteColor),
                ),
              ),
            ],
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/storyDetail');
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: fixPadding * 2, vertical: fixPadding),
              padding: const EdgeInsets.all(fixPadding),
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
              child: Row(
                children: [
                  Container(
                    height: size.height * 0.08,
                    width: size.height * 0.08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: AssetImage(
                          downloads[index]['image'].toString(),
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
                          downloads[index]['name'].toString(),
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
                                  downloads[index]['rate'].toString(),
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
                                  downloads[index]['view'].toString(),
                                  style: semibold14Black2,
                                )
                              ],
                            ),
                          ],
                        ),
                        Text(
                          downloads[index]['author'].toString(),
                          style: semibold14Grey94,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
