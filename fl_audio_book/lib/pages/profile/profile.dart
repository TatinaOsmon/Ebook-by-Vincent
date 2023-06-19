import 'package:fl_audio_book/localization/localization_const.dart';
import 'package:fl_audio_book/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
        automaticallyImplyLeading: false,
        title: Text(
          getTranslate(context, 'profile.profile'),
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
          left: fixPadding * 2,
          right: fixPadding * 2,
          bottom: fixPadding * 2,
        ),
        children: [
          userProfileDetail(size),
          heightSpace,
          heightSpace,
          // premiumbox(context),
          // heightSpace,
          // heightSpace,
          firstBox(context),
          heightSpace,
          heightSpace,
          secondBox(context, size),
        ],
      ),
    );
  }

  secondBox(BuildContext context, size) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          listTileWidget(
            CupertinoIcons.gear,
            getTranslate(context, 'profile.app_settings'),
            blackColor2,
            () {
              Navigator.pushNamed(context, '/appSettings');
            },
          ),
          divider(),
          listTileWidget(
            CupertinoIcons.doc_plaintext,
            getTranslate(context, 'profile.terms_Condition'),
            blackColor2,
            () {
              Navigator.pushNamed(context, '/termsAndCondition');
            },
          ),
          divider(),
          listTileWidget(
            Icons.privacy_tip_outlined,
            getTranslate(context, 'profile.privacy_policy'),
            blackColor2,
            () {
              Navigator.pushNamed(context, '/privacyPolicy');
            },
          ),
          divider(),
          listTileWidget(Icons.help_outline_outlined,
              getTranslate(context, 'profile.help_Support'), blackColor2, () {
            Navigator.pushNamed(context, '/helpAndSupport');
          }),
          divider(),
          listTileWidget(
              Icons.logout, getTranslate(context, 'profile.logout'), redColor,
              () {
            logoutdialog(context, size);
          }),
        ],
      ),
    );
  }

  logoutdialog(BuildContext context, size) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.all(fixPadding * 2),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                getTranslate(context, 'profile.logout'),
                style: bold20Black2,
              ),
              height5Space,
              heightSpace,
              Text(
                getTranslate(context, 'profile.logout_text'),
                style: semibold18Black2,
              ),
              height5Space,
              heightSpace,
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: size.height * 0.06,
                        padding: const EdgeInsets.symmetric(
                            horizontal: fixPadding / 2),
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
                        alignment: Alignment.center,
                        child: FittedBox(
                          child: Text(
                            getTranslate(context, 'profile.cancel'),
                            style: bold18Black2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  widthSpace,
                  widthSpace,
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Container(
                        height: size.height * 0.06,
                        padding: const EdgeInsets.symmetric(
                            horizontal: fixPadding / 2),
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
                        child: FittedBox(
                          child: Text(
                            getTranslate(context, 'profile.logout'),
                            style: bold18White,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  firstBox(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          listTileWidget(
            CupertinoIcons.person,
            getTranslate(context, 'profile.edit_profile'),
            blackColor2,
            () {
              Navigator.pushNamed(context, '/editProfile');
            },
          ),
          divider(),
          listTileWidget(
            CupertinoIcons.arrow_down_to_line_alt,
            getTranslate(context, 'profile.download'),
            blackColor2,
            () {
              Navigator.pushNamed(context, '/download');
            },
          ),
          divider(),
          listTileWidget(
            CupertinoIcons.globe,
            getTranslate(context, 'profile.language'),
            blackColor2,
            () {
              Navigator.pushNamed(context, '/languages');
            },
          ),
          divider(),
          listTileWidget(Icons.collections_bookmark_outlined,
              getTranslate(context, 'profile.follow_list'), blackColor2, () {
            Navigator.pushNamed(context, '/followlist');
          }),
        ],
      ),
    );
  }

  divider() {
    return Container(
      height: 1,
      width: double.maxFinite,
      color: grey94Color.withOpacity(0.3),
    );
  }

  listTileWidget(IconData icon, String name, Color color, Function() onTap) {
    return ListTile(
      onTap: onTap,
      minLeadingWidth: 0,
      leading: Icon(
        icon,
        size: 19,
        color: color,
      ),
      title: Text(
        name,
        style: bold15Black2.copyWith(height: 1.1, color: color),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 18,
        color: color,
      ),
    );
  }

  premiumbox(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: primaryColor,
        ),
      ),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, '/getPremium');
        },
        minLeadingWidth: 0,
        leading: Image.asset(
          "assets/profile/Group.png",
          height: 20,
          width: 20,
        ),
        title: Text(
          getTranslate(context, 'profile.get_premium'),
          style: bold15Primary,
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 18,
          color: primaryColor,
        ),
      ),
    );
  }

  userProfileDetail(Size size) {
    return Row(
      children: [
        Container(
          height: size.height * 0.08,
          width: size.height * 0.08,
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
        widthSpace,
        width5Space,
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Jenny Wilson",
                style: bold18Black2,
              ),
              Text(
                "willie.jennings@example.com",
                style: semibold14Black2,
              )
            ],
          ),
        )
      ],
    );
  }
}
