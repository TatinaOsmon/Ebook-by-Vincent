import 'package:fl_audio_book/localization/localization_const.dart';
import 'package:fl_audio_book/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  bool notificationON = true;

  bool darkThemeON = true;

  bool update = false;

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
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          getTranslate(context, 'app_setting.app_settings'),
          style: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
            left: fixPadding * 2,
            right: fixPadding * 2,
            top: fixPadding,
            bottom: fixPadding * 2),
        children: [
          notifications(),
          heightSpace,
          height5Space,
          darkMode(),
          heightSpace,
          height5Space,
          applicationUpdate()
        ],
      ),
    );
  }

  applicationUpdate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                getTranslate(context, 'app_setting.application_update'),
                style: bold18Black2,
              ),
            ),
            CupertinoSwitch(
              activeColor: primaryColor,
              trackColor: grey94Color,
              value: update,
              onChanged: (value) {
                setState(() {
                  update = !update;
                });
              },
            )
          ],
        ),
        height5Space,
        const Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing Tellus, habitant neque risus nuncrem quam arcu. ",
          style: semibold14Grey94,
        )
      ],
    );
  }

  darkMode() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                getTranslate(context, 'app_setting.dark_mode'),
                style: bold18Black2,
              ),
            ),
            CupertinoSwitch(
              activeColor: primaryColor,
              trackColor: grey94Color,
              value: darkThemeON,
              onChanged: (value) {
                setState(() {
                  darkThemeON = !darkThemeON;
                });
              },
            )
          ],
        ),
        height5Space,
        const Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing Tellus, habitant neque risus nuncrem quam arcu. ",
          style: semibold14Grey94,
        )
      ],
    );
  }

  notifications() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                getTranslate(context, 'app_setting.notification'),
                style: bold18Black2,
              ),
            ),
            CupertinoSwitch(
              activeColor: primaryColor,
              trackColor: grey94Color,
              value: notificationON,
              onChanged: (value) {
                setState(() {
                  notificationON = !notificationON;
                });
              },
            )
          ],
        ),
        height5Space,
        const Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing Tellus, habitant neque risus nuncrem quam arcu. ",
          style: semibold14Grey94,
        )
      ],
    );
  }
}
