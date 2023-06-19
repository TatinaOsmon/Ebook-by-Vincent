import 'package:fl_audio_book/localization/localization_const.dart';
import 'package:fl_audio_book/widget/column_builder.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../theme/theme.dart';

class StoryDetailScreen extends StatefulWidget {
  const StoryDetailScreen({Key? key}) : super(key: key);

  @override
  State<StoryDetailScreen> createState() => _StoryDetailScreenState();
}

class _StoryDetailScreenState extends State<StoryDetailScreen> {
  final reviewList = [
    {
      "image": "assets/storyDetail/Ellipse 57.png",
      "name": "Cameron Williamson",
      "date": "25 march 2022",
      "review":
          "Triage. Bloppa Joakim Norberg. Kuratera AI. Rune at the Gunnarsson bevoheten. Nanoteknik lean startup. Inger Lindholm ungen. Betav Lovisa Lind. DusJohan Sundström. Effektiv Magdalena  lean startup.  "
    },
    {
      "image": "assets/storyDetail/Ellipse 57 (1).png",
      "name": "Dianne Russell",
      "date": "25 march 2022",
      "review":
          "Triage. Bloppa Joakim Norberg. Kuratera AI. Rune at the Gunnarsson bevoheten. Nanoteknik lean startup. Inger Lindholm ungen. Betav Lovisa Lind. DusJohan Sundström. Effektiv Magdalena  lean startup.  "
    },
  ];

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            centerTitle: false,
            backgroundColor: backgroundColor,
            foregroundColor: blackColor2,
            elevation: 0,
            expandedHeight: size.height * 0.59,
            pinned: true,
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
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  topImageBox(size),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                heightSpace,
                heightSpace,
                description(),
                heightSpace,
                height5Space,
                reviewText(),
                reviewListview(size),
                heightSpace,
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: bottomNavigation(size),
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
        shareBottomSheet(context, size);
      },
      icon: const Icon(
        Icons.share_outlined,
        size: 22,
        color: blackColor2,
      ),
    );
  }

  bottomNavigation(Size size) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(
          horizontal: fixPadding * 2, vertical: fixPadding),
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: grey94Color.withOpacity(0.3),
            blurRadius: 5,
          )
        ],
      ),
      child: Row(
        children: [
          buttonWidget(size, getTranslate(context, 'story_detail.read'), () {
            Navigator.pushNamed(context, '/reading');
          }),
          widthSpace,
          widthSpace,
          buttonWidget(size, getTranslate(context, 'story_detail.listen'), () {
            Navigator.pushNamed(context, '/audioscreen');
          }),
        ],
      ),
    );
  }

  buttonWidget(Size size, String text, Function() onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding / 2),
          height: size.height * 0.07,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: grey94Color.withOpacity(0.2),
                blurRadius: 24,
                offset: const Offset(12, 12),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: FittedBox(
            child: Text(
              text,
              style: bold18White,
            ),
          ),
        ),
      ),
    );
  }

  shareBottomSheet(BuildContext context, Size size) {
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
                getTranslate(context, 'story_detail.share_via'),
                style: bold18Black2,
              ),
              heightSpace,
              heightSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  socialOption(context, size,
                      "assets/storyDetail/facebook 1.png", "Facebook"),
                  socialOption(context, size,
                      "assets/storyDetail/whatsapp 1.png", "WhatsApp"),
                  socialOption(context, size,
                      "assets/storyDetail/instagram 1.png", "Instagram"),
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

  reviewListview(Size size) {
    return ColumnBuilder(
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(
            horizontal: fixPadding * 2,
            vertical: fixPadding,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: blackColor.withOpacity(0.25),
                  blurRadius: 5,
                )
              ]),
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(
                  vertical: fixPadding / 2,
                  horizontal: fixPadding * 2,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFFE7E4E4),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: size.height * 0.07,
                      width: size.height * 0.07,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            reviewList[index]['image'].toString(),
                          ),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: blackColor.withOpacity(0.25),
                            blurRadius: 5,
                          )
                        ],
                      ),
                    ),
                    widthSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            reviewList[index]['name'].toString(),
                            style: semibold16Black2.copyWith(
                              color: const Color(0xFF262626),
                            ),
                          ),
                          Text(
                            reviewList[index]['date'].toString(),
                            style: semibold14Grey94,
                          ),
                          Row(
                            children: [
                              for (int i = 0; i < 5; i++)
                                const Icon(
                                  Icons.star_rounded,
                                  size: 16,
                                  color: primaryColor,
                                )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(
                    vertical: fixPadding, horizontal: fixPadding * 2),
                decoration: const BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                ),
                child: Text(
                  reviewList[index]['review'].toString(),
                  style: semibold14Grey94,
                ),
              ),
            ],
          ),
        );
      },
      itemCount: reviewList.length,
    );
  }

  reviewText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            getTranslate(context, 'story_detail.review'),
            style: bold18Black2,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/review');
            },
            child: Text(
              getTranslate(context, 'story_detail.see_all'),
              style: semibold14Grey94,
            ),
          )
        ],
      ),
    );
  }

  description() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getTranslate(context, 'story_detail.description'),
            style: bold18Black2,
          ),
          height5Space,
          ReadMoreText(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Urna, lectus quam neque, euismod dui. Eniurna enim, pharetra, diam hendrerit. Commodo aliquamf neque duis cursus aliquam. Blandit libero urnporta odio tristique est ante.Urna, lectus quam nequeop euismod dui. Eniurna enim, pharetra, diamaliquam hendrerit. Commodoiurnporta",
            style: semibold16Grey94.copyWith(
              color: const Color(0xFF605E5E),
            ),
            lessStyle: bold16Primary,
            moreStyle: bold16Primary,
            trimExpandedText: getTranslate(context, 'story_detail.show_less'),
            trimCollapsedText: getTranslate(context, 'story_detail.read_more'),
          )
        ],
      ),
    );
  }

  topImageBox(Size size) {
    return SizedBox(
      height: size.height * 0.62,
      width: double.maxFinite,
      child: Stack(
        children: [
          imageAndTitle(size),
          detailBox(),
        ],
      ),
    );
  }

  detailBox() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: fixPadding / 2),
        padding: const EdgeInsets.symmetric(
            horizontal: fixPadding * 2.5, vertical: fixPadding),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: blackColor.withOpacity(0.25),
            )
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            detailWidget(Icons.star, "3.5"),
            divider(),
            detailWidget(Icons.visibility, "2.5m"),
            divider(),
            detailWidget(Icons.menu_book_sharp, "2h"),
            divider(),
            detailWidget(Icons.music_note, "1h"),
          ],
        ),
      ),
    );
  }

  imageAndTitle(Size size) {
    return Container(
      height: size.height * 0.59,
      width: double.maxFinite,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage("assets/storyDetail/image.png"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            backgroundColor.withOpacity(0.2),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          heightSpace,
          const Text(
            "Whiter Than Snow",
            style: bold24Black2,
          ),
          Text(
            "${getTranslate(context, "story_detail.by")} Sandra Dallas",
            style: regular18Black2,
          ),
          heightSpace,
          height5Space,
          Container(
            height: size.height * 0.28,
            width: size.width * 0.4,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: blackColor.withOpacity(0.25),
                  blurRadius: 5,
                )
              ],
              image: const DecorationImage(
                image: AssetImage("assets/storyDetail/Rectangle 25.png"),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }

  divider() {
    return Container(
      height: 22,
      width: 1,
      color: const Color(0xFFD4D4D4),
      margin: const EdgeInsets.symmetric(
        horizontal: fixPadding,
      ),
    );
  }

  detailWidget(IconData icon, String title) {
    return Row(
      children: [
        Icon(
          icon,
          color: primaryColor,
          size: 14,
        ),
        width5Space,
        Text(
          title,
          style: bold14Black2,
        )
      ],
    );
  }
}
