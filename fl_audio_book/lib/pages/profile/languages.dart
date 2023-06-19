import 'package:fl_audio_book/localization/localization_const.dart';
import 'package:fl_audio_book/main.dart';
import 'package:fl_audio_book/theme/theme.dart';
import 'package:fl_audio_book/widget/column_builder.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? selectedLanguagesIndex;

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({Key? key}) : super(key: key);

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  SharedPreferences? pref;
  final String keys = 'value';

  @override
  void initState() {
    read();
    super.initState();
  }

  read() async {
    pref = await SharedPreferences.getInstance();
    setState(() {
      selectedLanguagesIndex = pref?.getInt(keys) ?? 0;
    });
  }

  void changeLanguages(String languageCode) async {
    Locale temp = await setLocale(languageCode);

    // ignore: use_build_context_synchronously
    MyApp.setLocale(context, temp);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
          getTranslate(context, 'language.language'),
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(
          left: fixPadding * 2,
          right: fixPadding * 2,
          bottom: fixPadding,
        ),
        physics: const BouncingScrollPhysics(),
        children: [
          languageListview(size),
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
        setState(() {
          if (selectedLanguagesIndex == 0) {
            changeLanguages(Languages.languageList[0].languageCode!);
          } else if (selectedLanguagesIndex == 1) {
            changeLanguages(Languages.languageList[1].languageCode!);
          } else if (selectedLanguagesIndex == 2) {
            changeLanguages(Languages.languageList[2].languageCode!);
          } else if (selectedLanguagesIndex == 3) {
            changeLanguages(Languages.languageList[3].languageCode!);
          } else if (selectedLanguagesIndex == 4) {
            changeLanguages(Languages.languageList[4].languageCode!);
          }
        });
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
          getTranslate(context, 'language.update'),
          style: bold18White,
        ),
      ),
    );
  }

  languageListview(Size size) {
    return ColumnBuilder(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedLanguagesIndex = index;
            });
            pref?.setInt(keys, selectedLanguagesIndex!);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: fixPadding),
            padding: const EdgeInsets.symmetric(
                vertical: fixPadding, horizontal: fixPadding * 2),
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
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    Languages.languageList[index].name.toString(),
                    style: semibold16Black2,
                  ),
                ),
                selectedLanguagesIndex == index
                    ? Container(
                        height: size.height * 0.035,
                        width: size.height * 0.035,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: whiteColor,
                          border: Border.all(
                            color: primaryColor,
                            width: 8,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: primaryColor.withOpacity(0.25),
                              blurRadius: 5,
                            )
                          ],
                        ),
                      )
                    : Container(
                        height: size.height * 0.035,
                        width: size.height * 0.035,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: whiteColor,
                            boxShadow: [
                              BoxShadow(
                                color: blackColor.withOpacity(0.25),
                                blurRadius: 5,
                              )
                            ]),
                      ),
              ],
            ),
          ),
        );
      },
      itemCount: Languages.languageList.length,
    );
  }
}

class Languages {
  final int? id;
  final String? name;
  final String? languageCode;

  Languages({this.id, this.languageCode, this.name});

  static List<Languages> languageList = [
    Languages(id: 1, name: "English", languageCode: 'en'),
    Languages(id: 2, name: "हिन्दी", languageCode: 'hi'),
    Languages(id: 3, name: "Indonesia", languageCode: 'id'),
    Languages(id: 4, name: "中国人", languageCode: 'zh'),
    Languages(id: 5, name: "عربي", languageCode: 'ar'),
  ];
}
