// import 'package:fl_audio_book/localization/localization_const.dart';
// import 'package:fl_audio_book/theme/theme.dart';
// import 'package:fl_audio_book/widget/column_builder.dart';
// import 'package:flutter/material.dart';

// class GetPremiumScreen extends StatefulWidget {
//   const GetPremiumScreen({Key? key}) : super(key: key);

//   @override
//   State<GetPremiumScreen> createState() => _GetPremiumScreenState();
// }

// class _GetPremiumScreenState extends State<GetPremiumScreen> {
//   final offerlist = [
//     {
//       "time": "1 Month",
//       "price": "9.99",
//       "per": "month",
//       "isBestOffer": false,
//     },
//     {
//       "time": "1 Year",
//       "price": "115.99",
//       "per": "year",
//       "isBestOffer": true,
//     },
//     {
//       "time": "6 Month",
//       "price": "59.99",
//       "per": "6 month",
//       "isBestOffer": false,
//     },
//   ];

//   final whatyouget = [
//     "Unlock The hotest paid book",
//     "Download book read and listen offline",
//     "Cancel anytime without anymore charged",
//     "Add free expriance"
//   ];

//   int selectedIndex = 1;

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       appBar: AppBar(
//         backgroundColor: backgroundColor,
//         elevation: 0,
//         centerTitle: false,
//         titleSpacing: 0,
//         foregroundColor: blackColor2,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.arrow_back),
//         ),
//         title: Text(
//           getTranslate(context, 'get_premium.get_premium'),
//           style: const TextStyle(fontWeight: FontWeight.w700),
//         ),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.only(
//           left: fixPadding * 2,
//           right: fixPadding * 2,
//           bottom: fixPadding * 2,
//         ),
//         physics: const BouncingScrollPhysics(),
//         children: [
//           premiumLogo(size),
//           height5Space,
//           premiumText(),
//           offerListview(),
//           heightSpace,
//           heightSpace,
//           heightSpace,
//           whatYougetTitle(),
//           height5Space,
//           whatyougetLitsview(),
//           heightSpace,
//           heightSpace,
//           heightSpace,
//           heightSpace,
//           getPremiumButton(size),
//         ],
//       ),
//     );
//   }

//   getPremiumButton(Size size) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.pushNamed(context, '/payment');
//       },
//       child: Container(
//         width: double.infinity,
//         height: size.height * 0.07,
//         decoration: BoxDecoration(
//           color: primaryColor,
//           borderRadius: BorderRadius.circular(30),
//           boxShadow: [
//             BoxShadow(
//               color: grey94Color.withOpacity(0.2),
//               blurRadius: 24,
//               offset: const Offset(12, 12),
//             )
//           ],
//         ),
//         alignment: Alignment.center,
//         child: Text(
//           getTranslate(context, 'get_premium.get_premium'),
//           style: bold18White,
//         ),
//       ),
//     );
//   }

//   whatYougetTitle() {
//     return Text(
//       getTranslate(context, 'get_premium.what_you_get'),
//       style: bold18Black2,
//     );
//   }

//   whatyougetLitsview() {
//     return ColumnBuilder(
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: fixPadding / 2),
//           child: Row(
//             children: [
//               const Icon(
//                 Icons.done,
//                 color: primaryColor,
//               ),
//               widthSpace,
//               Expanded(
//                 child: Text(
//                   whatyouget[index],
//                   style: semibold14Black2,
//                 ),
//               )
//             ],
//           ),
//         );
//       },
//       itemCount: whatyouget.length,
//     );
//   }

//   premiumText() {
//     return Text(
//       getTranslate(context, 'get_premium.premium_text'),
//       style: semibold24Black2,
//       textAlign: TextAlign.center,
//     );
//   }

//   premiumLogo(Size size) {
//     return Center(
//       child: Image.asset(
//         "assets/getPremium/mingcute_vip-1-fill.png",
//         height: size.height * 0.1,
//         width: size.height * 0.1,
//       ),
//     );
//   }

//   offerListview() {
//     return ColumnBuilder(
//       itemBuilder: (context, index) {
//         return GestureDetector(
//           onTap: () {
//             setState(() {
//               selectedIndex = index;
//             });
//           },
//           child: Container(
//             width: double.infinity,
//             padding: const EdgeInsets.all(fixPadding * 2),
//             margin: const EdgeInsets.symmetric(vertical: fixPadding),
//             decoration: BoxDecoration(
//               color:
//                   selectedIndex == index ? const Color(0xffFFF5EE) : whiteColor,
//               borderRadius: BorderRadius.circular(10),
//               border: selectedIndex == index
//                   ? Border.all(
//                       color: primaryColor,
//                       width: 2,
//                     )
//                   : null,
//               boxShadow: [
//                 BoxShadow(
//                   color: blackColor.withOpacity(0.25),
//                   blurRadius: 5,
//                 ),
//               ],
//             ),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       if (offerlist[index]['isBestOffer'] == true)
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               padding: const EdgeInsets.symmetric(
//                                 vertical: fixPadding / 3,
//                                 horizontal: fixPadding,
//                               ),
//                               decoration: BoxDecoration(
//                                 color: primaryColor,
//                                 borderRadius: BorderRadius.circular(5),
//                               ),
//                               child: Text(
//                                 getTranslate(context, 'get_premium.best_offer'),
//                                 style: bold16White,
//                               ),
//                             ),
//                             height5Space,
//                           ],
//                         ),
//                       Text(
//                         offerlist[index]['time'].toString(),
//                         style: bold18Black2,
//                       ),
//                     ],
//                   ),
//                 ),
//                 width5Space,
//                 RichText(
//                   text: TextSpan(
//                     text: "\$ ${offerlist[index]['price']}",
//                     style: bold18Black2,
//                     children: [
//                       const TextSpan(text: "/", style: regular18Black2),
//                       TextSpan(
//                         text: offerlist[index]['per'].toString(),
//                         style: regular18Black2,
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//       itemCount: offerlist.length,
//     );
//   }
// }
