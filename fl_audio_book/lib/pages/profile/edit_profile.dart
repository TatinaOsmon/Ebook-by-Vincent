import 'package:fl_audio_book/localization/localization_const.dart';
import 'package:fl_audio_book/pages/profile/languages.dart';
import 'package:fl_audio_book/theme/theme.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController changeuserNameController = TextEditingController();
  TextEditingController changenumberController = TextEditingController();
  TextEditingController changeemailController = TextEditingController();

  @override
  void initState() {
    userNameController.text = "Jenny Wilson";
    numberController.text = "+91(9876543210)";
    emailController.text = "willie.jennings@example.com";
    changeuserNameController.text = userNameController.text;
    changenumberController.text = numberController.text;
    changeemailController.text = emailController.text;
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
        elevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          getTranslate(context, 'edit_profile.edit_profile'),
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
          left: fixPadding * 2,
          right: fixPadding * 2,
          top: fixPadding,
          bottom: fixPadding * 2,
        ),
        children: [
          userProfile(size),
          heightSpace,
          heightSpace,
          heightSpace,
          userNameTitle(),
          heightSpace,
          userNameField(context, size),
          heightSpace,
          heightSpace,
          mobilenumberTitle(),
          heightSpace,
          mobileNumberField(context, size),
          heightSpace,
          heightSpace,
          emailAddressTitle(),
          heightSpace,
          emailField(context, size),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          updateButton(size),
        ],
      ),
    );
  }

  updateButton(Size size) {
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
          getTranslate(context, 'edit_profile.update'),
          style: bold18White,
        ),
      ),
    );
  }

  emailField(BuildContext context, size) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.25),
            blurRadius: 5,
          )
        ],
      ),
      child: TextField(
        onTap: () {
          emailChangeDialog(context, size);
        },
        readOnly: true,
        controller: emailController,
        decoration: const InputDecoration(
          border: InputBorder.none,
          suffixIconConstraints: BoxConstraints(maxWidth: 20),
          suffixIcon: Icon(
            Icons.mode_edit_outlined,
            size: 19,
            color: blackColor2,
          ),
        ),
      ),
    );
  }

  emailAddressTitle() {
    return Text(
      getTranslate(context, 'edit_profile.email_address'),
      style: bold17Black2,
    );
  }

  emailChangeDialog(BuildContext context, size) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.all(fixPadding * 2),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                getTranslate(context, 'edit_profile.change_email'),
                style: bold20Black2,
              ),
              heightSpace,
              heightSpace,
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: fixPadding * 1.5),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: blackColor.withOpacity(0.25),
                      blurRadius: 5,
                    )
                  ],
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: const ColorScheme.light(primary: primaryColor),
                  ),
                  child: TextField(
                    controller: changeemailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText:
                          getTranslate(context, 'edit_profile.enter_email'),
                      hintStyle: semibold16Grey94,
                    ),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              Row(
                children: [
                  cancelButton(
                    context,
                    () {
                      Navigator.pop(context);
                      changeemailController.text = emailController.text;
                    },
                    size,
                  ),
                  widthSpace,
                  widthSpace,
                  okayButton(context, () {
                    if (changeemailController.text.isNotEmpty) {
                      setState(() {
                        emailController.text = changeemailController.text;
                      });
                    }
                    Navigator.pop(context);
                  }, size),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  mobileNumberField(BuildContext context, size) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.25),
            blurRadius: 5,
          )
        ],
      ),
      child: TextField(
        onTap: () {
          numberChangeDialog(context, size);
        },
        readOnly: true,
        controller: numberController,
        decoration: const InputDecoration(
          border: InputBorder.none,
          suffixIconConstraints: BoxConstraints(maxWidth: 20),
          suffixIcon: Icon(
            Icons.mode_edit_outlined,
            size: 19,
            color: blackColor2,
          ),
        ),
      ),
    );
  }

  mobilenumberTitle() {
    return Text(
      getTranslate(context, 'edit_profile.mobile_number'),
      style: bold17Black2,
    );
  }

  numberChangeDialog(BuildContext context, size) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.all(fixPadding * 2),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                getTranslate(context, 'edit_profile.change_mobile'),
                style: bold20Black2,
              ),
              heightSpace,
              heightSpace,
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: fixPadding * 1.5),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: blackColor.withOpacity(0.25),
                      blurRadius: 5,
                    )
                  ],
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: const ColorScheme.light(primary: primaryColor),
                  ),
                  child: TextField(
                    controller: changenumberController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText:
                          getTranslate(context, 'edit_profile.enter_number'),
                      hintStyle: semibold16Grey94,
                    ),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              Row(
                children: [
                  cancelButton(context, () {
                    Navigator.pop(context);
                    changenumberController.text = numberController.text;
                  }, size),
                  widthSpace,
                  widthSpace,
                  okayButton(context, () {
                    if (changenumberController.text.isNotEmpty) {
                      setState(() {
                        numberController.text = changenumberController.text;
                      });
                    }
                    Navigator.pop(context);
                  }, size),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  okayButton(BuildContext context, Function() onTap, Size size) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: size.height * 0.06,
          padding: const EdgeInsets.symmetric(horizontal: fixPadding / 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: primaryColor,
            boxShadow: [
              BoxShadow(
                color: primaryColor.withOpacity(0.25),
                blurRadius: 5,
              )
            ],
          ),
          alignment: Alignment.center,
          child: FittedBox(
            child: Text(
              getTranslate(context, 'edit_profile.okay'),
              style: bold18White,
            ),
          ),
        ),
      ),
    );
  }

  cancelButton(BuildContext context, Function() onTap, Size size) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: size.height * 0.06,
          padding: const EdgeInsets.symmetric(horizontal: fixPadding / 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: whiteColor,
            boxShadow: [
              BoxShadow(
                color: blackColor.withOpacity(0.25),
                blurRadius: 5,
              )
            ],
          ),
          alignment: Alignment.center,
          child: FittedBox(
            child: Text(
              getTranslate(context, 'edit_profile.cancel'),
              style: bold18Black2,
            ),
          ),
        ),
      ),
    );
  }

  userNameTitle() {
    return Text(
      getTranslate(context, 'edit_profile.user_name'),
      style: bold17Black2,
    );
  }

  userNameField(BuildContext context, size) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.25),
            blurRadius: 5,
          )
        ],
      ),
      child: TextField(
        onTap: () {
          userNameChangeDialog(context, size);
        },
        readOnly: true,
        keyboardType: TextInputType.name,
        controller: userNameController,
        decoration: const InputDecoration(
          border: InputBorder.none,
          suffixIconConstraints: BoxConstraints(maxWidth: 20),
          suffixIcon: Icon(
            Icons.mode_edit_outlined,
            size: 19,
            color: blackColor2,
          ),
        ),
      ),
    );
  }

  userNameChangeDialog(BuildContext context, size) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.all(fixPadding * 2),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                getTranslate(context, 'edit_profile.change_name'),
                style: bold20Black2,
              ),
              heightSpace,
              heightSpace,
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: fixPadding * 1.5),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: blackColor.withOpacity(0.25),
                      blurRadius: 5,
                    )
                  ],
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: const ColorScheme.light(primary: primaryColor),
                  ),
                  child: TextField(
                    controller: changeuserNameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText:
                          getTranslate(context, 'edit_profile.enter_name'),
                      hintStyle: semibold16Grey94,
                    ),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              Row(
                children: [
                  cancelButton(context, () {
                    Navigator.pop(context);
                    changeuserNameController.text = userNameController.text;
                  }, size),
                  widthSpace,
                  widthSpace,
                  okayButton(context, () {
                    if (changeuserNameController.text.isNotEmpty) {
                      setState(() {
                        userNameController.text = changeuserNameController.text;
                      });
                    }
                    Navigator.pop(context);
                  }, size),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  userProfile(Size size) {
    return Center(
      child: SizedBox(
        height: size.height * 0.2,
        width: size.height * 0.23,
        child: Stack(
          children: [
            Container(
              height: size.height * 0.2,
              width: size.height * 0.2,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    "assets/profile/Ellipse 14.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            selectedLanguagesIndex == 4
                ? Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    child: GestureDetector(
                      onTap: () {
                        changePhotoSheet(size);
                      },
                      child: Container(
                        height: size.height * 0.065,
                        width: size.height * 0.065,
                        decoration: const BoxDecoration(
                          color: backgroundColor,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          "assets/profile/Glyph_ undefined.png",
                          height: size.height * 0.035,
                          width: size.height * 0.035,
                        ),
                      ),
                    ),
                  )
                : Positioned(
                    top: 0,
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        changePhotoSheet(size);
                      },
                      child: Container(
                        height: size.height * 0.065,
                        width: size.height * 0.065,
                        decoration: const BoxDecoration(
                          color: backgroundColor,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          "assets/profile/Glyph_ undefined.png",
                          height: size.height * 0.035,
                          width: size.height * 0.035,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  changePhotoSheet(Size size) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      barrierColor: blackColor.withOpacity(0.3),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(fixPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: blackColor.withOpacity(0.25),
                      blurRadius: 5,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Center(
                        child: Text(
                          getTranslate(context, 'edit_profile.select_image'),
                          style: semibold16Grey94,
                        ),
                      ),
                    ),
                    divider(),
                    bottomsheetOption(context,
                        getTranslate(context, 'edit_profile.take_photo')),
                    divider(),
                    bottomsheetOption(context,
                        getTranslate(context, 'edit_profile.chosse_library')),
                    divider(),
                    bottomsheetOption(context,
                        getTranslate(context, 'edit_profile.remove_photo')),
                  ],
                ),
              ),
              heightSpace,
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: size.height * 0.07,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: blackColor.withOpacity(0.25),
                        blurRadius: 5,
                      )
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    getTranslate(context, 'edit_profile.cancel'),
                    style: semibold18Primary,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  bottomsheetOption(BuildContext context, String name) {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
      },
      title: Center(
        child: Text(
          name,
          style: semibold16Black2,
        ),
      ),
    );
  }

  divider() {
    return Container(
      height: 1,
      width: double.maxFinite,
      color: greyD9Color,
    );
  }
}
