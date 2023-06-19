import 'package:flutter/material.dart';

import '../../localization/localization_const.dart';
import '../../theme/theme.dart';

class ReadingScreen extends StatefulWidget {
  const ReadingScreen({Key? key}) : super(key: key);

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  bool isFavorite = false;

  final chapterlist = [
    "1",
    "2",
    "3",
    "4",
    "5",
  ];

  String? chapterText;

  @override
  void initState() {
    chapterText = chapterlist[1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: backgroundColor,
        foregroundColor: blackColor2,
        titleSpacing: 0,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          shareIconButton(context, size),
          favoriteIconButton(context),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
          bottom: fixPadding * 2,
          left: fixPadding * 2,
          right: fixPadding * 2,
        ),
        children: [
          bookTitle(),
          chapter(),
          heightSpace,
          text1(),
          heightSpace,
          text2(),
          heightSpace,
          text2(),
          heightSpace,
          text3(),
          heightSpace,
          text3(),
        ],
      ),
      bottomNavigationBar: bottomNavigation(size),
    );
  }

  bottomNavigation(Size size) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Container(
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: chapterlist.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {
                          setState(() {
                            chapterText = chapterlist[index];
                          });
                          Navigator.pop(context);
                        },
                        title: Center(
                          child: Text(
                            "${getTranslate(context, 'reading.chapter')} ${chapterlist[index]}",
                          ),
                        ),
                      ),
                      chapterlist.length - 1 == index
                          ? const SizedBox()
                          : Container(
                              height: 1,
                              width: double.maxFinite,
                              color: const Color(0xFFD4D4D4),
                            )
                    ],
                  );
                },
              ),
            );
          },
        );
      },
      child: Container(
        height: size.height * 0.07,
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: grey94Color.withOpacity(0.3),
              blurRadius: 5,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${getTranslate(context, 'reading.chapter')} $chapterText / ${chapterlist.length}",
              style: semibold18Primary,
            ),
            width5Space,
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: primaryColor,
              size: 26,
            )
          ],
        ),
      ),
    );
  }

  text3() {
    return const Text(
      "Lorem ipsum dolor sit amet, consadipiscing elit. the Donec semper scelerisque aceu dignissimt ristique aliquet. Sed fermentum purus, gravida leo, pulvinar dui pulvina mauris. Risus, erat viverra neque antekj ut inullaidrisus. Massa in fringilla volutpat risus,atd integer dolor nulla sit faucibus. Id varius pulvinarlr lectus.Sed fermentum purus, gravida leo, pulvinars dui pulvina mauris. Risus, erat viverra neque antesu ut inullaidrisus. Massa in fringilla volutpat rinteger dolor nulla sit faucibus. Id varius pulvinar lectus.",
      style: semibold16Black2,
    );
  }

  chapter() {
    return Text(
      "${getTranslate(context, 'reading.chapter')} $chapterText",
      style: regular18Black32,
      textAlign: TextAlign.center,
    );
  }

  bookTitle() {
    return const Text(
      "Whiter Than Snow",
      style: bold24Black32,
      textAlign: TextAlign.center,
    );
  }

  text2() {
    return const Text(
      "Lorem ipsum dolor sit amet, consadipiscing elit. the Donec semper scelerisque aceu dignissimt ristique aliquet. Sed fermentum purus, gravida leo, pulvinar dui pulvina mauris. Risus, erat viverra neque antekj ut inullaidrisus. Massa in fringilla volutpat risus,atd integer dolor nulla sit faucibus. Id varius pulvinarlr lectus.Sed fermentum purus, gravida leo, pulvinars dui pulvina mauris. Risus, erat viverra neque antesu ut inullaidrisus. Massa in fringilla volutpat rinteger dolor nulla sit faucibus. Id varius pulvinar Lorem ipsum dolor sit amet, consadipiscing elit. the Donec semper scelerisque aceu dignissimt ristiquealiquet. Sed fermentum purus, gravida leo, pulvinar pulvina mauris. Risus, erat viverra neque antekinullaidrisus. Massa in fringilla volutpat risus,atd integer dolor nulla sit faucibus. Id varius pulvinarlr lectus.Sed fermentum purus, gravida leo, pulvinars dui pulvina mauris. fringilla volutpat rinteger dolor ngfaucibus. Id varius pulvinar lectus. lectus.Lorem ipsum dolor sit amet, consadipiscing elit. the Donec semper fgg scelerisque aceu dignissimt ristique algtfermentum purus, gravida leo, pulvinar dui pulvina mauris. ",
      style: semibold16Black2,
    );
  }

  text1() {
    return const Text.rich(
      TextSpan(
        text: "            ",
        style: semibold16Black2,
        children: [
          TextSpan(text: "L", style: bold22Black2),
          TextSpan(
            text:
                "orem ipsum dolor sit amet,consadipiscing elit. the Donec semper scelerisque aceu dignissimt ristique aliquet. Sed fermentum purus, gravida leo, pulvinar dui pulvina mauris. Risus, erat viverrneque antekj ut inullaidrisus. Massa in fvolutpisus.Lorem ipsum dolor sit amet, consadipiscing elit. the Donec semper scelerisque aceu dignissimt ristiquealiquet. Sed fermentum purus, gravida leo, pulvinar dulvina mauris. Risus, erat viverra neque antekjnullaidrisus. Massa in fringilla volutpat risus.",
            style: semibold16Black2,
          ),
        ],
      ),
    );
  }

  favoriteIconButton(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(fixPadding),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: blackColor,
            content: Text(
              isFavorite
                  ? getTranslate(context, 'favorite.add_book')
                  : getTranslate(context, 'favorite.remove_book'),
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: whiteColor,
              ),
            ),
            behavior: SnackBarBehavior.floating,
            duration: const Duration(milliseconds: 1500),
          ),
        );
      },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        size: 22,
        color: blackColor2,
      ),
    );
  }

  shareIconButton(BuildContext context, Size size) {
    return IconButton(
      padding: const EdgeInsets.symmetric(vertical: fixPadding, horizontal: 1),
      onPressed: () {
        sharebottomSheet(context, size);
      },
      icon: const Icon(
        Icons.share_outlined,
        size: 22,
        color: blackColor2,
      ),
    );
  }

  sharebottomSheet(BuildContext context, Size size) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(fixPadding * 2),
          decoration: const BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                getTranslate(context, 'reading.share_via'),
                style: bold18Black2,
              ),
              heightSpace,
              heightSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  socialOption(context, size,
                      "assets/storyDetail/facebook 1.png", 'Facebook'),
                  socialOption(context, size,
                      "assets/storyDetail/whatsapp 1.png", 'WhatsApp'),
                  socialOption(context, size,
                      "assets/storyDetail/instagram 1.png", 'Instagram'),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  socialOption(BuildContext context, Size size, String image, String name) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Column(
        children: [
          Image.asset(
            image,
            height: size.height * 0.045,
            width: size.height * 0.045,
            fit: BoxFit.cover,
          ),
          height5Space,
          Text(
            name,
            style: regular17Black2,
          )
        ],
      ),
    );
  }
}
