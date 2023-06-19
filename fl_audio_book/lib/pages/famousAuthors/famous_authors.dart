// import 'package:fl_audio_book/localization/localization_const.dart';
// import 'package:fl_audio_book/theme/theme.dart';
// import 'package:flutter/material.dart';

// class FamousAuthorsScreen extends StatelessWidget {
//   FamousAuthorsScreen({Key? key}) : super(key: key);

//   final authorslist = [
//     {"image": "assets/famousAuthor/Ellipse 13.png", "name": "Abdul kalam"},
//     {
//       "image": "assets/famousAuthor/Ellipse 13 (1).png",
//       "name": "Shelley Harris"
//     },
//     {"image": "assets/famousAuthor/Ellipse 13 (2).png", "name": "Stephenie"},
//     {"image": "assets/famousAuthor/Ellipse 13 (3).png", "name": "Anne Rice "},
//     {"image": "assets/famousAuthor/Ellipse 13 (4).png", "name": "I.T.Lucas"},
//     {"image": "assets/famousAuthor/Ellipse 13 (5).png", "name": "Jeet Thayil"},
//     {
//       "image": "assets/famousAuthor/Ellipse 13 (6).png",
//       "name": "Rhonda Byrne's "
//     },
//     {"image": "assets/famousAuthor/Ellipse 13 (7).png", "name": "Emma Brodie"},
//     {"image": "assets/famousAuthor/Ellipse 13 (8).png", "name": "Laura Hankin"},
//     {"image": "assets/famousAuthor/Ellipse 13 (9).png", "name": "G Bailey"},
//     {"image": "assets/famousAuthor/Ellipse 13 (10).png", "name": "Dan Brown"},
//     {"image": "assets/famousAuthor/Ellipse 13 (11).png", "name": "Ruskin Bond"},
//     {
//       "image": "assets/famousAuthor/Ellipse 13 (12).png",
//       "name": "J. K. Rowling"
//     },
//     {
//       "image": "assets/famousAuthor/Ellipse 13 (13).png",
//       "name": "Nora Roberts"
//     },
//     {
//       "image": "assets/famousAuthor/Ellipse 13 (14).png",
//       "name": "Nora Roberts"
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       appBar: AppBar(
//         backgroundColor: backgroundColor,
//         elevation: 0,
//         foregroundColor: blackColor2,
//         titleSpacing: 0,
//         centerTitle: false,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.arrow_back,
//           ),
//         ),
//         title: Text(
//           getTranslate(context, 'famous_author.famous_authors'),
//           style: const TextStyle(fontWeight: FontWeight.w700),
//         ),
//       ),
//       body: GridView.builder(
//         padding: const EdgeInsets.only(
//           bottom: fixPadding * 2,
//           left: fixPadding * 2,
//           right: fixPadding * 2,
//         ),
//         physics: const BouncingScrollPhysics(),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3,
//           crossAxisSpacing: fixPadding * 3,
//           mainAxisSpacing: fixPadding * 2,
//           childAspectRatio: size.width / (size.height / 1.65),
//         ),
//         itemCount: authorslist.length,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               Navigator.pushNamed(context, '/authorScreen');
//             },
//             child: Container(
//               color: Colors.transparent,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Container(
//                       height: size.height * 0.11,
//                       width: size.height * 0.11,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                           image: AssetImage(
//                             authorslist[index]['image'].toString(),
//                           ),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Text(
//                     authorslist[index]['name'].toString(),
//                     style: bold14Black2,
//                     overflow: TextOverflow.ellipsis,
//                   )
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
