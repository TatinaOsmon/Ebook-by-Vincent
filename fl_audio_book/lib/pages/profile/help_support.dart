import 'package:fl_audio_book/localization/localization_const.dart';
import 'package:fl_audio_book/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({Key? key}) : super(key: key);

  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
  TextEditingController writeusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        titleSpacing: 0,
        backgroundColor: backgroundColor,
        foregroundColor: blackColor2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          getTranslate(context, 'help_support.help_support'),
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
          bottom: fixPadding * 2,
          left: fixPadding * 2,
          right: fixPadding * 2,
        ),
        children: [
          topImage(size),
          contentText(),
          heightSpace,
          phoneNumber(size),
          heightSpace,
          height5Space,
          emailDetail(size),
          heightSpace,
          heightSpace,
          writeUsTitle(),
          height5Space,
          writeusField(size),
          heightSpace,
          heightSpace,
          heightSpace,
          sendButton(context, size),
        ],
      ),
    );
  }

  sendButton(BuildContext context, Size size) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: size.height * 0.07,
        width: double.infinity,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: grey94Color.withOpacity(0.2),
              blurRadius: 24,
              offset: const Offset(12, 12),
            )
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          getTranslate(context, 'help_support.send'),
          style: bold18White,
        ),
      ),
    );
  }

  writeusField(Size size) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: fixPadding),
      height: size.height * 0.16,
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
      child: TextField(
        controller: writeusController,
        cursorColor: primaryColor,
        expands: true,
        maxLines: null,
        minLines: null,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: getTranslate(context, 'help_support.write_message'),
          hintStyle: semibold14Grey94,
        ),
      ),
    );
  }

  writeUsTitle() {
    return Text(
      getTranslate(context, 'help_support.write_us'),
      style: bold18Black2,
    );
  }

  emailDetail(Size size) {
    return Row(
      children: [
        Container(
          height: size.height * 0.07,
          width: size.height * 0.07,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffF8BB90),
          ),
          child: const Icon(
            CupertinoIcons.mail,
            size: 22,
            color: primaryColor,
          ),
        ),
        widthSpace,
        widthSpace,
        const Expanded(
            child: Text(
          "tim.jennings@example.com",
          style: semibold16Black2,
        ))
      ],
    );
  }

  phoneNumber(Size size) {
    return Row(
      children: [
        Container(
          height: size.height * 0.07,
          width: size.height * 0.07,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffF8BB90),
          ),
          child: const Icon(
            CupertinoIcons.phone,
            size: 22,
            color: primaryColor,
          ),
        ),
        widthSpace,
        widthSpace,
        const Expanded(
            child: Text(
          "(808) 555-0111",
          style: semibold16Black2,
        ))
      ],
    );
  }

  contentText() {
    return Text(
      getTranslate(context, 'help_support.text'),
      textAlign: TextAlign.center,
      style: bold22Primary,
    );
  }

  topImage(Size size) {
    return Center(
      child: Image.asset(
        "assets/profile/Active Support-rafiki 1.png",
        height: size.height * 0.25,
        width: size.height * 0.25,
      ),
    );
  }
}
