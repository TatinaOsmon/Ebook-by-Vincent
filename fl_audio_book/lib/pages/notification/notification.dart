import 'package:fl_audio_book/localization/localization_const.dart';
import 'package:fl_audio_book/widget/column_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final newNotification = [
    {
      "title": "Get premium",
      "subTitle":
          "Subscribe the plan and listen and read offline book without any restriction.",
      "time": "5 min ago",
    },
    {
      "title": "Success",
      "subTitle":
          "Your monthly plane active succesfully now listen your book. ",
      "time": "5 min ago",
    },
  ];

  final olderNotification = [
    {
      "title": "Active plane",
      "subTitle": "Your monthly plane expire soon, subscribe new plne",
      "time": "Yesterday",
      "isTwoText": false
    },
    {
      "title": "Dark secret",
      "subTitle": "Hey, Get ready to read new book",
      "subTitle2": "\"The dark secret\"",
      "time": "Yesterday",
      "isTwoText": true
    },
    {
      "title": "Get premium",
      "subTitle":
          "Subscribe the plan and listen and read offline book without any restriction.",
      "time": "Yesterday",
      "isTwoText": false
    },
    {
      "title": "Success",
      "subTitle":
          "Your monthly plane active succesfully now listen your book. ",
      "time": "Yesterday",
      "isTwoText": false
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
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          getTranslate(context, 'notification.notification'),
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: (newNotification.isEmpty && olderNotification.isEmpty)
          ? emptyNotificationList()
          : notificationList(size),
    );
  }

  emptyNotificationList() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            CupertinoIcons.bell_slash,
            color: grey94Color,
            size: 40,
          ),
          heightSpace,
          Text(
            getTranslate(context, 'notification.no_notification'),
            style: bold18Grey94,
          )
        ],
      ),
    );
  }

  notificationList(Size size) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: fixPadding),
      children: [
        newNotificationListview(size),
        heightSpace,
        olderNotificationListview(size),
      ],
    );
  }

  olderNotificationListview(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        olderNotification.isEmpty
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
                child: Text(
                  getTranslate(context, 'notification.older_notification'),
                  style: bold18Black2,
                ),
              ),
        ColumnBuilder(
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                setState(() {
                  olderNotification.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: blackColor,
                    content: Text(
                      getTranslate(context, 'notification.remove_notification'),
                      style: const TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    behavior: SnackBarBehavior.floating,
                    duration: const Duration(milliseconds: 1500),
                  ),
                );
              },
              background: Container(
                margin: const EdgeInsets.symmetric(vertical: fixPadding),
                color: Colors.red,
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: fixPadding,
                  horizontal: fixPadding * 2,
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: fixPadding * 2,
                  vertical: fixPadding,
                ),
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
                child: Row(
                  children: [
                    Container(
                      height: size.height * 0.07,
                      width: size.height * 0.07,
                      padding: const EdgeInsets.all(fixPadding),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffFCD9C1),
                      ),
                      child: Image.asset(
                        "assets/splash/book-reader.png",
                        color: primaryColor,
                      ),
                    ),
                    widthSpace,
                    widthSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            olderNotification[index]['title'].toString(),
                            style: bold18Black2,
                          ),
                          olderNotification[index]['isTwoText'] == true
                              ? RichText(
                                  text: TextSpan(
                                      text: olderNotification[index]['subTitle']
                                          .toString(),
                                      style: regular14Black2,
                                      children: [
                                        const TextSpan(text: " "),
                                        TextSpan(
                                          text: olderNotification[index]
                                                  ['subTitle2']
                                              .toString(),
                                          style: regular14Primary,
                                        ),
                                      ]),
                                )
                              : Text(
                                  olderNotification[index]['subTitle']
                                      .toString(),
                                  style: regular14Black2,
                                ),
                          Text(
                            olderNotification[index]['time'].toString(),
                            style: semibold14Grey94,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: olderNotification.length,
        )
      ],
    );
  }

  newNotificationListview(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        newNotification.isEmpty
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
                child: Text(
                  getTranslate(context, 'notification.new_notification'),
                  style: bold18Black2,
                ),
              ),
        ColumnBuilder(
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                setState(() {
                  newNotification.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: blackColor,
                    content: Text(
                      getTranslate(context, 'notification.remove_notification'),
                      style: const TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    behavior: SnackBarBehavior.floating,
                    duration: const Duration(milliseconds: 1500),
                  ),
                );
              },
              background: Container(
                color: Colors.red,
                margin: const EdgeInsets.symmetric(vertical: fixPadding),
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: fixPadding,
                  horizontal: fixPadding * 2,
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: fixPadding * 2,
                  vertical: fixPadding,
                ),
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
                child: Row(
                  children: [
                    Container(
                      height: size.height * 0.07,
                      width: size.height * 0.07,
                      padding: const EdgeInsets.all(fixPadding),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffFCD9C1),
                      ),
                      child: Image.asset(
                        "assets/splash/book-reader.png",
                        color: primaryColor,
                      ),
                    ),
                    widthSpace,
                    widthSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            newNotification[index]['title'].toString(),
                            style: bold18Black2,
                          ),
                          Text(
                            newNotification[index]['subTitle'].toString(),
                            style: regular14Black2,
                          ),
                          Text(
                            newNotification[index]['time'].toString(),
                            style: semibold14Grey94,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: newNotification.length,
        )
      ],
    );
  }
}
