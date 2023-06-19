import 'package:audioplayers/audioplayers.dart';
import 'package:fl_audio_book/localization/localization_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({Key? key}) : super(key: key);

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  bool isFavorite = false;

  final chapterlist = [
    "1",
    "2",
    "3",
    "4",
    "5",
  ];

  String? chapterText;

  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    chapterText = chapterlist[1];

    setAudio();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.loop);

    audioPlayer.setSourceAsset('audio/Hello.mp3');
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            elevation: 0,
            centerTitle: false,
            backgroundColor: backgroundColor,
            foregroundColor: blackColor2,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
            actions: [
              shareIconButton(context, size),
              favoriteIconButton(context),
            ],
            expandedHeight: size.height * 0.59,
            flexibleSpace: FlexibleSpaceBar(
              background: topImageBox(size),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                heightSpace,
                heightSpace,
                playPauseButton(),
                heightSpace,
                timeText(),
                slider(),
                heightSpace,
                descriptionText(),
                heightSpace,
                heightSpace,
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigation(size),
    );
  }

  favoriteIconButton(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(fixPadding),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: blackColor,
            content: Text(
              isFavorite
                  ? getTranslate(context, 'favorite.add_book')
                  : getTranslate(context, 'favorite.remove_book'),
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: whiteColor,
              ),
            ),
            behavior: SnackBarBehavior.floating,
            duration: const Duration(milliseconds: 1500),
          ),
        );
      },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        size: 22,
        color: blackColor2,
      ),
    );
  }

  shareIconButton(BuildContext context, Size size) {
    return IconButton(
      padding: const EdgeInsets.symmetric(vertical: fixPadding, horizontal: 1),
      onPressed: () {
        shareBottomSheet(context, size);
      },
      icon: const Icon(
        Icons.share_outlined,
        size: 22,
        color: blackColor2,
      ),
    );
  }

  descriptionText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: fixPadding * 2),
      child: Text.rich(
        TextSpan(
          text:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Urna, lectus quam neque, euismod dui. Eniurna enim, pharetra, diam hendrerit. Commodo aliquamf neque duis cursus aliquam.",
          style: semibold16Grey94,
          children: [
            TextSpan(text: " "),
            TextSpan(
              text:
                  "Blandit libero urnporta odio tristique est ante.Urna, lectus quam",
              style: semibold16Black2,
            ),
            TextSpan(text: " "),
            TextSpan(
                text:
                    "nequeop euismod dui. Eniurna enim, pharetra, diamaliquam hendrerit. ",
                style: semibold16Grey94),
          ],
        ),
      ),
    );
  }

  slider() {
    return Slider(
      activeColor: primaryColor,
      inactiveColor: const Color(0xffC4C4C4),
      thumbColor: primaryColor,
      min: 0,
      max: duration.inSeconds.toDouble(),
      value: position.inSeconds.toDouble(),
      onChanged: (value) async {
        final position = Duration(seconds: value.toInt());
        await audioPlayer.seek(position);
        await audioPlayer.resume();
      },
    );
  }

  timeText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            formatTime(position),
            style: semibold14Grey94,
          ),
          Text(
            formatTime(duration - position),
            style: semibold14Grey94,
          )
        ],
      ),
    );
  }

  playPauseButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.arrow_back_ios,
          color: Color(0xFFB7B7B7),
        ),
        widthSpace,
        widthSpace,
        InkWell(
          onTap: () async {
            if (isPlaying) {
              await audioPlayer.pause();
            } else {
              await audioPlayer.resume();
            }
          },
          child: Icon(
            isPlaying ? Icons.pause_circle : Icons.play_circle,
            color: primaryColor,
            size: 50,
          ),
        ),
        widthSpace,
        widthSpace,
        const Icon(
          Icons.arrow_forward_ios,
          color: Color(0xFFB7B7B7),
        ),
      ],
    );
  }

  bottomNavigation(Size size) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Container(
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: chapterlist.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {
                          setState(() {
                            chapterText = chapterlist[index];
                          });
                          Navigator.pop(context);
                        },
                        title: Center(
                          child: Text(
                            "${getTranslate(context, 'audio_book.chapter')} ${chapterlist[index]}",
                          ),
                        ),
                      ),
                      chapterlist.length - 1 == index
                          ? const SizedBox()
                          : Container(
                              height: 1,
                              width: double.maxFinite,
                              color: const Color(0xFFD4D4D4),
                            )
                    ],
                  );
                },
              ),
            );
          },
        );
      },
      child: Container(
        height: size.height * 0.07,
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: grey94Color.withOpacity(0.3),
              blurRadius: 5,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${getTranslate(context, 'audio_book.chapter')} $chapterText / ${chapterlist.length}",
              style: semibold18Primary,
            ),
            width5Space,
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: primaryColor,
              size: 26,
            )
          ],
        ),
      ),
    );
  }

  buttonWidget(Size size, String text, Function() onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: size.height * 0.07,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: grey94Color.withOpacity(0.2),
                blurRadius: 24,
                offset: const Offset(12, 12),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: bold18White,
          ),
        ),
      ),
    );
  }

  shareBottomSheet(BuildContext context, Size size) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(fixPadding * 2),
          decoration: const BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                getTranslate(context, 'audio_book.share_via'),
                style: bold18Black2,
              ),
              heightSpace,
              heightSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  socialOptions(context, size,
                      "assets/storyDetail/facebook 1.png", "Facebook"),
                  socialOptions(context, size,
                      "assets/storyDetail/whatsapp 1.png", "WhatsApp"),
                  socialOptions(context, size,
                      "assets/storyDetail/instagram 1.png", "Instagram"),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  socialOptions(BuildContext context, Size size, String image, String name) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Column(
        children: [
          Image.asset(
            image,
            height: size.height * 0.045,
            width: size.height * 0.045,
            fit: BoxFit.cover,
          ),
          height5Space,
          Text(
            name,
            style: regular17Black2,
          )
        ],
      ),
    );
  }

  topImageBox(Size size) {
    return SizedBox(
      height: size.height * 0.62,
      width: double.maxFinite,
      child: Stack(
        children: [
          imageAndTitle(size),
          detailBox(),
        ],
      ),
    );
  }

  detailBox() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: fixPadding / 2),
        padding: const EdgeInsets.symmetric(
            horizontal: fixPadding * 2.5, vertical: fixPadding),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: blackColor.withOpacity(0.25),
            )
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            detailWidget(
                Icons.download, getTranslate(context, 'audio_book.download'),
                () {
              Navigator.pushNamed(context, '/payment');
              setState(() {
                audioPlayer.pause();
              });
            }),
            divider(),
            detailWidget(CupertinoIcons.forward_fill,
                "${getTranslate(context, 'audio_book.speed')} 10x", () {}),
            divider(),
            detailWidget(Icons.music_note, "1h", () {}),
          ],
        ),
      ),
    );
  }

  imageAndTitle(Size size) {
    return Container(
      height: size.height * 0.59,
      width: double.maxFinite,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage("assets/storyDetail/image.png"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            backgroundColor.withOpacity(0.2),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          heightSpace,
          const Text(
            "Whiter Than Snow",
            style: bold24Black2,
          ),
          Text(
            "${getTranslate(context, "story_detail.by")} Sandra Dallas",
            style: regular18Black2,
          ),
          heightSpace,
          height5Space,
          Container(
            height: size.height * 0.28,
            width: size.width * 0.4,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: blackColor.withOpacity(0.25),
                  blurRadius: 5,
                )
              ],
              image: const DecorationImage(
                image: AssetImage("assets/storyDetail/Rectangle 25.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          heightSpace,
          Text(
            "${getTranslate(context, 'audio_book.chapter')} $chapterText",
            style: semibold14Black2,
          )
        ],
      ),
    );
  }

  divider() {
    return Container(
      height: 22,
      width: 1,
      color: const Color(0xFFD4D4D4),
      margin: const EdgeInsets.symmetric(
        horizontal: fixPadding,
      ),
    );
  }

  detailWidget(IconData icon, String title, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            Icon(
              icon,
              color: primaryColor,
              size: 14,
            ),
            width5Space,
            Text(
              title,
              style: bold14Black2,
            )
          ],
        ),
      ),
    );
  }
}
