import 'package:fl_audio_book/localization/localization_const.dart';
import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          getTranslate(context, 'privacy_policy.privacy_policy'),
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
          top: fixPadding,
          bottom: fixPadding * 2,
          left: fixPadding * 2,
          right: fixPadding * 2,
        ),
        children: [
          introduction(context),
          heightSpace,
          height5Space,
          mangeInformation(context),
        ],
      ),
    );
  }

  mangeInformation(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getTranslate(context, 'privacy_policy.manage_information'),
          style: bold18Black2,
        ),
        height5Space,
        text1(),
        height5Space,
        text2(),
        height5Space,
        text2(),
      ],
    );
  }

  introduction(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getTranslate(context, 'privacy_policy.introduction'),
          style: bold18Black2,
        ),
        height5Space,
        text1(),
        height5Space,
        text2()
      ],
    );
  }

  text2() {
    return const Text(
      "Lorem ipsum dolor sit amet, consadipiscing elit. the Donec semper scelerisque aceu dignissimt ristique aliquet. Sed fermentum purus, gravida leo, pulvinar dui pulvina mauris. Risus, erat viverra neque antekj ut inullaidrisus. Massa in fringilla volutpat risus,atd integer dolor nulla sit faucibus. Id varius pulvinarlr lectus.Sed fermentum purus, gravida leo, pulvinars dui pulvina mauris. Risus, erat viverra neque antesu ut inullaidrisus. Massa in fringilla volutpat rinteger dolor nulla sit faucibus. Id varius pulvinar lectus.",
      style: semibold16Grey94,
    );
  }

  text1() {
    return const Text(
      "Lorem ipsum dolor sit amet, consadipiscing elit. the Donec semper scelerisque aceu dignissimt ristique aliquet. Sed fermentum purus, gravida leo, pulvinar dui pulvina mauris. Risus, erat viverra neque antekj ut inullaidrisus. Massa in fringilla volutpat risus,atd integer dolor nulla sit faucibus. Id varius pulvinarlr ",
      style: semibold16Grey94,
    );
  }
}
