import 'package:fl_audio_book/localization/localization_const.dart';
import 'package:fl_audio_book/theme/theme.dart';
import 'package:flutter/material.dart';

class TermsAndConditionScreen extends StatelessWidget {
  const TermsAndConditionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        foregroundColor: blackColor2,
        centerTitle: false,
        elevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          getTranslate(context, 'terms_condition.terms_condition'),
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
            left: fixPadding * 2,
            right: fixPadding * 2,
            bottom: fixPadding * 2,
            top: fixPadding),
        children: [
          text1(),
          heightSpace,
          text2(),
          heightSpace,
          text1(),
          heightSpace,
          text1(),
        ],
      ),
    );
  }

  text2() {
    return const Text(
      "Lorem ipsum dolor sit amet, consadipiscing elit. the Donec semper scelerisque aceu dignissimt ristique aliquet. Sed fermentum purus, gravida leo, pulvinar dui pulvina mauris. Risus, erat viverra neque antekj ut inullaidrisus. Massa in fringilla volutpat risus,atd integer dolor nulla sit faucibus. Id varius pulvinarlr lectus.Sed fermentum purus, gravida leo, pulvinars dui pulvina mauris. Risus, erat viverra neque antesu ut inullaidrisus. Massa in fringilla volutpat rinteger dolor nulla sit faucibus. Id varius pulvinar Lorem ipsum dolor sit amet, consadipiscing elit. the Donec semper scelerisque aceu dignissimt ristiquealiquet. Sed fermentum purus, gravida leo, pulvinar pulvina mauris. Risus, erat viverra neque antekinullaidrisus. Massa in fringilla volutpat risus,atd integer dolor nulla sit faucibus. Id varius pulvinarlr lectus.Sed fermentum purus, gravida leo, pulvinars dui pulvina mauris. fringilla volutpat rinteger dolor ngfaucibus. Id varius pulvinar lectus. lectus.Lorem ipsum dolor sit amet, consadipiscing elit. the Donec semper fgg scelerisque aceu dignissimt ristique algtfermentum purus, gravida leo, pulvinar dui pulvina mauris. ",
      style: semibold16Grey94,
    );
  }

  text1() {
    return const Text(
      "Lorem ipsum dolor sit amet, consadipiscing elit. the Donec semper scelerisque aceu dignissimt ristique aliquet. Sed fermentum purus, gravida leo, pulvinar dui pulvina mauris. Risus, erat viverra neque antekj ut inullaidrisus. Massa in fringilla volutpat risus,atd integer dolor nulla sit faucibus. Id varius pulvinarlr lectus.Sed fermentum purus, gravida leo, pulvinars dui pulvina mauris. Risus, erat viverra neque antesu ut inullaidrisus. Massa in fringilla volutpat rinteger ",
      style: semibold16Grey94,
    );
  }
}
