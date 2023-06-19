import 'package:fl_audio_book/localization/localization_const.dart';
import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          successDetail(size, context),
        ],
      ),
    );
  }

  successDetail(Size size, BuildContext context) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          const Spacer(),
          Column(
            children: [
              Container(
                height: size.height * 0.2,
                width: size.height * 0.2,
                padding: const EdgeInsets.all(fixPadding * 2.5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryColor.withOpacity(0.1),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.done,
                    size: 50,
                    color: Color(0xffF3F3F3),
                  ),
                ),
              ),
              heightSpace,
              Text(
                getTranslate(context, 'success.congratulation'),
                style: bold28Primary,
              ),
              height5Space,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: fixPadding * 3),
                child: Text(
                  getTranslate(context, 'success.payment_text'),
                  textAlign: TextAlign.center,
                  style: semibold16Grey94.copyWith(
                    color: const Color(0xFF808080),
                  ),
                ),
              )
            ],
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/bottomNavigation');
            },
            child: Text(
              getTranslate(context, 'success.back_home'),
              style: bold16Primary,
            ),
          )
        ],
      ),
    );
  }
}
