import 'package:fl_audio_book/localization/localization_const.dart';
import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class ReviewScreen extends StatelessWidget {
  ReviewScreen({Key? key}) : super(key: key);

  final reviewlist = [
    {
      "image": "assets/review/review1.png",
      "name": "Cameron Williamson",
      "date": "25 march 2022",
      "review":
          "Triage. Bloppa Joakim Norberg. Kuratera AI. Rune at the Gunnarsson bevoheten. Nanoteknik lean startup. Inger Lindholm ungen. Betav Lovisa Lind. DusJohan Sundström. Effektiv Magdalena  lean startup.  "
    },
    {
      "image": "assets/review/review2.png",
      "name": "Dianne Russell",
      "date": "25 march 2022",
      "review":
          "Triage. Bloppa Joakim Norberg. Kuratera AI. Rune at the Gunnarsson bevoheten. Nanoteknik lean startup. Inger Lindholm ungen. Betav Lovisa Lind. DusJohan Sundström. Effektiv Magdalena  lean startup.  "
    },
    {
      "image": "assets/review/review3.png",
      "name": "Savannah Nguyen",
      "date": "26march 2022",
      "review":
          "Triage. Bloppa Joakim Norberg. Kuratera AI. Rune at the Gunnarsson bevoheten. Nanoteknik lean startup. Inger Lindholm ungen. Betav Lovisa Lind. DusJohan Sundström. Effektiv Magdalena  lean startup.  "
    },
    {
      "image": "assets/review/review4.png",
      "name": "Leslie Alexander",
      "date": "22 april 2022",
      "review":
          "Triage. Bloppa Joakim Norberg. Kuratera AI. Rune at the Gunnarsson bevoheten. Nanoteknik lean startup. Inger Lindholm ungen. Betav Lovisa Lind. DusJohan Sundström. Effektiv Magdalena  lean startup.  "
    },
    {
      "image": "assets/review/review5.png",
      "name": "Arlene McCoy",
      "date": "25 april 2022",
      "review":
          "Triage. Bloppa Joakim Norberg. Kuratera AI. Rune at the Gunnarsson bevoheten. Nanoteknik lean startup. Inger Lindholm ungen. Betav Lovisa Lind. DusJohan Sundström. Effektiv Magdalena  lean startup.  "
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
        centerTitle: false,
        titleSpacing: 0,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          getTranslate(context, 'review.review'),
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: fixPadding),
        itemCount: reviewlist.length,
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
              ],
            ),
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
                              reviewlist[index]['image'].toString(),
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
                              reviewlist[index]['name'].toString(),
                              style: semibold16Black2.copyWith(
                                color: const Color(0xFF262626),
                              ),
                            ),
                            Text(
                              reviewlist[index]['date'].toString(),
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
                    reviewlist[index]['review'].toString(),
                    style: semibold14Grey94,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
