import 'dart:async';
import 'dart:io';

import 'package:fl_audio_book/localization/localization_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../theme/theme.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({Key? key}) : super(key: key);

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  TextEditingController thirdController = TextEditingController();
  TextEditingController fourController = TextEditingController();

  FocusNode firstFocusNode = FocusNode();
  FocusNode secondFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();
  FocusNode fourFocusNode = FocusNode();

  @override
  void initState() {
    firstFocusNode.addListener(() {});
    secondFocusNode.addListener(() {});
    thirdFocusNode.addListener(() {});
    fourFocusNode.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    firstFocusNode.removeListener(() {});
    secondFocusNode.removeListener(() {});
    thirdFocusNode.removeListener(() {});
    fourFocusNode.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        bool backStatus = onWillPop();
        if (backStatus) {
          exit(0);
        } else {
          return false;
        }
      },
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              registerDetailBox(size, context),
              logoBox(size),
            ],
          ),
        ),
      ),
    );
  }

  registerDetailBox(Size size, BuildContext context) {
    return Positioned(
      top: size.height * 0.2,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        width: double.infinity,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          color: Color(0xFFF3F0F0),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(160),
          ),
        ),
        child: Column(
          children: [
            heightBox(size.height * 0.11),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  otpText(),
                  height5Space,
                  verificationText(),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  otpBox(size, context),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  didnotReceiveText(),
                  heightSpace,
                  resendText(),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  verifyButton(size),
                  heightSpace,
                  heightSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  resendText() {
    return Text(
      getTranslate(context, 'otp.resend_text'),
      style: semibold16Primary.copyWith(
        decoration: TextDecoration.underline,
        decorationStyle: TextDecorationStyle.solid,
        decorationThickness: 2,
      ),
      textAlign: TextAlign.center,
    );
  }

  didnotReceiveText() {
    return Text(
      getTranslate(context, 'otp.not_receive_text'),
      style: semibold14Grey94,
      textAlign: TextAlign.center,
    );
  }

  otpBox(Size size, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: size.height * 0.07,
          width: size.height * 0.07,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: whiteColor,
            border: Border.all(
                color:
                    (firstController.text.isNotEmpty || firstFocusNode.hasFocus)
                        ? primaryColor
                        : Colors.transparent),
            boxShadow: [
              BoxShadow(
                color: blackColor.withOpacity(0.25),
                blurRadius: 5,
              ),
            ],
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(primary: primaryColor),
            ),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                });
              },
              focusNode: firstFocusNode,
              controller: firstController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
              ],
            ),
          ),
        ),
        widthSpace,
        widthSpace,
        Container(
          height: size.height * 0.07,
          width: size.height * 0.07,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: whiteColor,
            border: Border.all(
                color: (secondController.text.isNotEmpty ||
                        secondFocusNode.hasFocus)
                    ? primaryColor
                    : Colors.transparent),
            boxShadow: [
              BoxShadow(
                color: blackColor.withOpacity(0.25),
                blurRadius: 5,
              ),
            ],
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(primary: primaryColor),
            ),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                });
              },
              focusNode: secondFocusNode,
              controller: secondController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
              ],
            ),
          ),
        ),
        widthSpace,
        widthSpace,
        Container(
          height: size.height * 0.07,
          width: size.height * 0.07,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: whiteColor,
            border: Border.all(
                color:
                    (thirdController.text.isNotEmpty || thirdFocusNode.hasFocus)
                        ? primaryColor
                        : Colors.transparent),
            boxShadow: [
              BoxShadow(
                color: blackColor.withOpacity(0.25),
                blurRadius: 5,
              ),
            ],
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(primary: primaryColor),
            ),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                });
              },
              focusNode: thirdFocusNode,
              controller: thirdController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
              ],
            ),
          ),
        ),
        widthSpace,
        widthSpace,
        Container(
          height: size.height * 0.07,
          width: size.height * 0.07,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: whiteColor,
            border: Border.all(
                color:
                    (fourController.text.isNotEmpty || fourFocusNode.hasFocus)
                        ? primaryColor
                        : Colors.transparent),
            boxShadow: [
              BoxShadow(
                color: blackColor.withOpacity(0.25),
                blurRadius: 5,
              ),
            ],
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(primary: primaryColor),
            ),
            child: TextField(
              onChanged: (value) {
                setState(
                  () {
                    if (value.length == 1) {
                      Timer(const Duration(seconds: 3), () {
                        Navigator.pushNamed(context, '/bottomNavigation');
                      });
                      pleaseWaitDialog(context);
                    }
                  },
                );
              },
              focusNode: fourFocusNode,
              controller: fourController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
              ],
            ),
          ),
        ),
      ],
    );
  }

  pleaseWaitDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: fixPadding * 2,
            vertical: fixPadding * 2,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SpinKitCircle(
                color: primaryColor,
                size: 40,
              ),
              heightSpace,
              Text(
                getTranslate(context, 'otp.please_wait'),
                style: semibold16Primary,
              )
            ],
          ),
        );
      },
    );
  }

  verificationText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 3),
      child: Text(
        getTranslate(context, 'otp.confirm_text'),
        style: semibold14Grey94,
        textAlign: TextAlign.center,
      ),
    );
  }

  verifyButton(Size size) {
    return GestureDetector(
      onTap: () {
        Timer(const Duration(seconds: 3), () {
          Navigator.pushNamed(context, '/bottomNavigation');
        });
        pleaseWaitDialog(context);
      },
      child: Container(
        height: size.height * 0.07,
        width: double.maxFinite,
        margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: grey94Color.withOpacity(0.2),
              blurRadius: 24,
            )
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          getTranslate(context, 'otp.verify'),
          style: bold18White,
        ),
      ),
    );
  }

  otpText() {
    return Center(
      child: Text(
        getTranslate(context, 'otp.otp_text'),
        style: bold28Black2,
      ),
    );
  }

  logoBox(Size size) {
    return Positioned(
      left: 0,
      right: 0,
      top: size.height * 0.1,
      child: Container(
        height: size.height * 0.2,
        width: size.height * 0.2,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFFCD9C1),
        ),
        child: Center(
          child: Image.asset(
            "assets/auth/fluent_phone-checkmark-16-regular.png",
            color: primaryColor,
            height: size.height * 0.1,
            width: size.height * 0.1,
          ),
        ),
      ),
    );
  }

  onWillPop() {
    Navigator.pushNamed(context, '/login');
  }
}
