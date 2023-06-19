import 'package:fl_audio_book/localization/localization_const.dart';
import 'package:fl_audio_book/pages/profile/languages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            registerDetailBox(size, context),
            logoBox(size),
            backButton(context)
          ],
        ),
      ),
    );
  }

  backButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: fixPadding),
      child: IconButton(
        padding: const EdgeInsets.all(20),
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: whiteColor,
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
                  registerText(),
                  heightSpace,
                  heightSpace,
                  userNameTitle(),
                  heightSpace,
                  userNameField(context),
                  heightSpace,
                  heightSpace,
                  mobileNumberTitle(),
                  heightSpace,
                  mobileNumberField(context),
                  heightSpace,
                  heightSpace,
                  emailTitle(),
                  heightSpace,
                  emailField(context),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  registerButton(size),
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

  registerButton(Size size) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/otp');
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
          getTranslate(context, 'register.register'),
          style: bold18White,
        ),
      ),
    );
  }

  registerText() {
    return Center(
      child: Text(
        getTranslate(context, 'register.register'),
        style: bold28Black2,
      ),
    );
  }

  userNameTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      child: Text(
        getTranslate(context, 'register.user_name'),
        style: bold17Black2,
      ),
    );
  }

  userNameField(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      padding: const EdgeInsets.symmetric(horizontal: fixPadding),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.25),
            blurRadius: 6,
          )
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(primary: primaryColor),
        ),
        child: TextField(
          controller: userNameController,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              decoration: BoxDecoration(
                border: selectedLanguagesIndex == 4
                    ? const Border(
                        left: BorderSide(color: greyD9Color),
                      )
                    : const Border(
                        right: BorderSide(color: greyD9Color),
                      ),
              ),
              child: const Icon(
                CupertinoIcons.person,
                size: 20,
              ),
            ),
            hintText: getTranslate(context, 'register.enter_name'),
            hintStyle: semibold16Grey94,
          ),
        ),
      ),
    );
  }

  mobileNumberTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      child: Text(
        getTranslate(context, 'register.mobile_number'),
        style: bold17Black2,
      ),
    );
  }

  mobileNumberField(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      padding: const EdgeInsets.symmetric(horizontal: fixPadding),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.25),
            blurRadius: 6,
          )
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(primary: primaryColor),
        ),
        child: TextField(
          controller: mobileNumberController,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              decoration: BoxDecoration(
                border: selectedLanguagesIndex == 4
                    ? const Border(
                        left: BorderSide(color: greyD9Color),
                      )
                    : const Border(
                        right: BorderSide(color: greyD9Color),
                      ),
              ),
              child: const Icon(
                CupertinoIcons.device_phone_portrait,
                size: 20,
              ),
            ),
            hintText: getTranslate(context, 'register.enter_number'),
            hintStyle: semibold16Grey94,
          ),
        ),
      ),
    );
  }

  emailTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      child: Text(
        getTranslate(context, 'register.email_address'),
        style: bold17Black2,
      ),
    );
  }

  emailField(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      padding: const EdgeInsets.symmetric(horizontal: fixPadding),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.25),
            blurRadius: 6,
          )
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(primary: primaryColor),
        ),
        child: TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              decoration: BoxDecoration(
                border: selectedLanguagesIndex == 4
                    ? const Border(
                        left: BorderSide(color: greyD9Color),
                      )
                    : const Border(
                        right: BorderSide(color: greyD9Color),
                      ),
              ),
              child: const Icon(
                CupertinoIcons.mail,
                size: 20,
              ),
            ),
            hintText: getTranslate(context, 'register.enter_email'),
            hintStyle: semibold16Grey94,
          ),
        ),
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
            "assets/splash/book-reader.png",
            color: primaryColor,
            height: size.height * 0.1,
            width: size.height * 0.1,
          ),
        ),
      ),
    );
  }
}
