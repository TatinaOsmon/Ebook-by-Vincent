// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_audio_book/cubit/home_cubit.dart';
import 'package:fl_audio_book/cubit/home_state.dart';
import 'package:fl_audio_book/detail.dart';
import 'package:fl_audio_book/models/ebook.dart';
import 'package:fl_audio_book/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../localization/localization_const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class BookListBuilder extends StatelessWidget {
  final List<Book> books;

  const BookListBuilder({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookDetailsScreen(
                  book: book,
                  pdfUrls: const [],
                ),
              ),
            );
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Container(
                  height: 141,
                  width: 130,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(book.image),
                      fit: BoxFit.cover,
                      // fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: 100,
                child: Text(
                  book.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: 100,
                child: Text(
                  book.author,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 10),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 12,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    book.rate.toString(),
                    style: const TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _HomeScreenState extends State<HomeScreen> {
  dynamic result;

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        toolbarHeight: size.height * 0.11,
        elevation: 0,
        titleSpacing: 0,
        centerTitle: false,
        leadingWidth: 90,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
          child: Row(
            children: [
              Container(
                height: size.height * 0.065,
                width: size.height * 0.065,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/home/ebook01.jpg"),
                  ),
                ),
              ),
              widthSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getTranslate(context, 'Ebook App'),
                      style: bold18Black2,
                    ),
                    Text(
                      getTranslate(context, 'home.time_read'),
                      style: bold14Grey94,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: SizedBox(
            height: 48,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                InkWell(
                  onTap: () {
                    // Handle Action category click
                    // Open books related to Action category
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Action',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38)),
                  ),
                ),
                const SizedBox(width: 16),
                InkWell(
                  onTap: () {
                    // Handle Romance category click
                    // Open books related to Romance category
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Romance',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38)),
                  ),
                ),
                const SizedBox(width: 16),
                InkWell(
                  onTap: () {
                    // Handle History category click
                    // Open books related to History category
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('History',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38)),
                  ),
                ),
                const SizedBox(width: 16),
                InkWell(
                  onTap: () {
                    // Handle Health/Fitness category click
                    // Open books related to Health/Fitness category
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Health/Fitness',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38)),
                  ),
                ),
                const SizedBox(width: 16),
                InkWell(
                  onTap: () {
                    final state = context.read<HomeCubit>().state;
                    final popularBooks = state.books?.popularList ?? [];
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Container(
                          color: Colors.white,
                          child: BookListBuilder(books: popularBooks),
                        ),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Popular Books',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38)),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                InkWell(
                  onTap: () {
                    final state = context.read<HomeCubit>().state;
                    final recommendedBooks = state.books?.recommendedList ?? [];

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Container(
                          color: Colors.white,
                          margin: const EdgeInsets.only(top: 30),
                          child: BookListBuilder(
                            books: recommendedBooks,
                          ),
                        ),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Recommended Books',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38)),
                  ),
                ),
                const SizedBox(width: 16),
                InkWell(
                  onTap: () {
                    // Handle History category click
                    // Open books related to History category
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('New Release Books',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38)),
                  ),
                ),
                const SizedBox(width: 16),
                InkWell(
                  onTap: () {
                    // Handle History category click
                    // Open books related to History category
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Fantastic',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38)),
                  ),
                ),
                const SizedBox(width: 16),
                InkWell(
                  onTap: () {
                    // Handle History category click
                    // Open books related to History category
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Classic',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38)),
                  ),
                ),
                const SizedBox(width: 16),
                InkWell(
                  onTap: () {
                    // Handle History category click
                    // Open books related to History category
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Art',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),

      // Rest of your Scaffold code...

      // actions: [
      //   IconButton(
      //     onPressed: () {
      //       Navigator.pushNamed(context, '/notification');
      //     },
      //     icon: const Icon(
      //       CupertinoIcons.bell,
      //       color: primaryColor,
      //     ),
      //   ),
      // ],

      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.status == FetchStatus.loading) {
            return const CircularProgressIndicator();
          } else if (state.status == FetchStatus.success) {
            return ListView.builder(
              padding: const EdgeInsets.only(bottom: fixPadding),
              physics: const BouncingScrollPhysics(),
              itemCount: 8,
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                              right: 275), // Adjust the padding as desired
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Popular Books',
                              style: TextStyle(
                                fontSize: 20, // Adjust the font size as desired
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 200,
                          child: BookListBuilder(
                              books: state.books?.popularList ?? []),
                        ),
                        const SizedBox(height: 16),
                      ],
                    );

                  case 1:
                    return Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                              right: 210), // Adjust the padding as desired
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Recommended Books',
                              style: TextStyle(
                                fontSize: 20, // Adjust the font size as desired
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 200,
                          child: BookListBuilder(
                              books: state.books?.recommendedList ?? []),
                        ),
                        const SizedBox(height: 16),
                      ],
                    );
                  case 2:
                    return Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'New Release Books',
                              style: TextStyle(
                                fontSize: 20, // Adjust the font size as desired
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 200,
                          child: BookListBuilder(
                              books: state.books?.newReleasesList ?? []),
                        ),
                        const SizedBox(height: 16),
                      ],
                    );
                  case 3:
                    return Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Fantasctic',
                              style: TextStyle(
                                fontSize: 20, // Adjust the font size as desired
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 200,
                          child: BookListBuilder(
                              books: state.books?.newReleasesList ?? []),
                        ),
                        const SizedBox(height: 16),
                      ],
                    );
                  case 4:
                    return Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Classic',
                              style: TextStyle(
                                fontSize: 20, // Adjust the font size as desired
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 200,
                          child: BookListBuilder(
                              books: state.books?.newReleasesList ?? []),
                        ),
                        const SizedBox(height: 16),
                      ],
                    );
                  case 5:
                    return Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Art',
                              style: TextStyle(
                                fontSize: 20, // Adjust the font size as desired
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 200,
                          child: BookListBuilder(
                              books: state.books?.newReleasesList ?? []),
                        ),
                        const SizedBox(height: 16),
                      ],
                    );
                  case 6:
                    return Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                              right: 345), // Adjust the padding as desired
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'History',
                              style: TextStyle(
                                fontSize: 20, // Adjust the font size as desired
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 200,
                          child: BookListBuilder(
                              books: state.books?.popularList ?? []),
                        ),
                        const SizedBox(height: 16),
                      ],
                    );
                  case 7:
                    return Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                              right: 275), // Adjust the padding as desired
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Popular Books',
                              style: TextStyle(
                                fontSize: 20, // Adjust the font size as desired
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 200,
                          child: BookListBuilder(
                              books: state.books?.popularList ?? []),
                        ),
                        const SizedBox(height: 16),
                      ],
                    );

                  // case 4:
                  //   return Column(
                  //     children: [
                  //       const Padding(
                  //         padding: EdgeInsets.only(left: 20),
                  //         child: Align(
                  //           alignment: Alignment.centerLeft,
                  //           child: Text(
                  //             'Classic',
                  //             style: TextStyle(
                  //               fontSize: 20, // Adjust the font size as desired
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       const SizedBox(height: 8),
                  //       SizedBox(
                  //         height: 200,
                  //         child: BookListBuilder(
                  //             books: state.books?.classicList ?? []),
                  //       ),
                  //       const SizedBox(height: 16),
                  //     ],
                  //   );
                  // case 5:
                  //   return Column(
                  //     children: [
                  //       const Padding(
                  //         padding: EdgeInsets.only(left: 20),
                  //         child: Align(
                  //           alignment: Alignment.centerLeft,
                  //           child: Text(
                  //             'Romantic',
                  //             style: TextStyle(
                  //               fontSize: 20, // Adjust the font size as desired
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       const SizedBox(height: 8),
                  //       SizedBox(
                  //         height: 200,
                  //         child: BookListBuilder(
                  //             books: state.books?.romanticList ?? []),
                  //       ),
                  //       const SizedBox(height: 16),
                  //     ],
                  //   );
                  // case 6:
                  //   return Column(
                  //     children: [
                  //       const Padding(
                  //         padding: EdgeInsets.only(left: 20),
                  //         child: Align(
                  //           alignment: Alignment.centerLeft,
                  //           child: Text(
                  //             'Art',
                  //             style: TextStyle(
                  //               fontSize: 20, // Adjust the font size as desired
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       const SizedBox(height: 8),
                  //       SizedBox(
                  //         height: 200,
                  //         child: BookListBuilder(
                  //             books: state.books?.artList ?? []),
                  //       ),
                  //       const SizedBox(height: 16),
                  //     ],
                  //   );

                  default:
                    return const SizedBox.shrink();
                }
              },
            );
          } else {
            return const Text('Error occurred');
          }
        },
      ),

// case 3:
//   return Column(
//     children: [
//       const Text('Category Books'),
//       const SizedBox(height: 8),
//       SizedBox(
//         height: 200,
//         child: BookListBuilder(books: state.books.categoryList ?? []),
//       ),
//       const SizedBox(height: 16),

      //   return Column(
      //     children: [
      //       const Text('Popular Books'),
      //       const SizedBox(height: 8),
      //       SizedBox(
      //         height: 200,
      //         child: BookListBuilder(book: state.books.popularList!),
      //       ),
      //       const SizedBox(height: 16),
      //     ],
      //   );
      // case 1:
      //   return Column(
      //     children: [
      //       const Text('Recommended Books'),
      //       const SizedBox(height: 8),
      //       SizedBox(
      //         height: 200,
      //         child: BookListBuilder(book: state.books.recommendedList!),
      //       ),
      //       const SizedBox(height: 16),
      //     ],
      //   );
      // case 2:
      //   return Column(
      //     children: [
      //       const Text('New Release Books'),
      //       const SizedBox(height: 8),
      //       SizedBox(
      //         height: 200,
      //         child: BookListBuilder(book: state.books.newReleasesList),
      //       ),
      //       const SizedBox(height: 16),
      //     ],
      //   );
      // case 3:
      //   return Column(
      //     children: [
      //       const Text('Category Books'),
      //       const SizedBox(height: 8),
      //       SizedBox(
      //         height: 200,
      //         child: BookListBuilder(book: state.books.categoryList),
      //       ),
      //       const SizedBox(height: 16),
      //     ],
      //   );
    );
  }

// Widget recommendedlistview(BuildContext context, Size size) {
//   // ignore: prefer_typing_uninitialized_variables
//   var recommendedlist;
//   return Column(
//     children: [
//       titleText(context, getTranslate(context, 'home.recommended'), () {
//         Navigator.pushNamed(context, '/recommended');
//       }),
//       SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         physics: const BouncingScrollPhysics(),
//         padding: const EdgeInsets.all(fixPadding),
//         child: Row(
//           children: recommendedlist
//               .map(
//                 (recommended) => listContent(
//                   context as Size, // Pass the context here
//                   size as String,
//                   recommended['image'].toString(),
//                   recommended['name'].toString(),
//                   recommended['rate'].toString(),
//                   recommended['view'].toString(),
//                   recommended['author'].toString() as Function(),
//                   () {
//                     Navigator.pushNamed(context, '/storyDetail');
//                   },
//                 ),
//               )
//               .toList(),
//         ),
//       ),
//     ],
//   );
// }

// Widget newReleaselistview(BuildContext context, Size size) {
//   // ignore: prefer_typing_uninitialized_variables
//   var newReleaselist;
//   return Column(
//     children: [
//       titleText(context, getTranslate(context, 'home.new_release'), () {
//         Navigator.pushNamed(context, '/newRelease');
//       }),
//       SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         physics: const BouncingScrollPhysics(),
//         padding: const EdgeInsets.all(fixPadding),
//         child: Row(
//           children: newReleaselist
//               .map(
//                 (newRelease) => listContent(
//                   context as Size, // Pass the context here
//                   size as String,
//                   newRelease['image'].toString(),
//                   newRelease['name'].toString(),
//                   newRelease['rate'].toString(),
//                   newRelease['view'].toString(),
//                   newRelease['author'].toString() as Function(),
//                   () {
//                     Navigator.pushNamed(context, '/storyDetail');
//                   },
//                 ),
//               )
//               .toList(),
//         ),
//       )
//     ],
//   );
// }

// Widget paidBookListview(BuildContext context, Size size) {
//   // ignore: prefer_typing_uninitialized_variables
//   var paidbooklist;
//   return Column(
//     children: [
//       titleText(context, getTranslate(context, 'home.paid_book'), () {
//         Navigator.pushNamed(context, '/paidstory');
//       }),
//       SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         physics: const BouncingScrollPhysics(),
//         padding: const EdgeInsets.all(fixPadding),
//         child: Row(
//           children: paidbooklist
//               .map(
//                 (paidbook) => Container(
//                   width: size.width * 0.35,
//                   margin: const EdgeInsets.symmetric(horizontal: fixPadding),
//                   color: Colors.transparent,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         height: size.height * 0.2,
//                         padding: const EdgeInsets.all(fixPadding / 2),
//                         width: double.maxFinite,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5),
//                           image: DecorationImage(
//                             image: AssetImage(
//                               paidbook['image'].toString(),
//                             ),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         child: Align(
//                           alignment: Alignment.bottomRight,
//                           child: Container(
//                             height: size.height * 0.03,
//                             width: size.height * 0.03,
//                             decoration: const BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: primaryColor,
//                             ),
//                             alignment: Alignment.center,
//                             child: const Text(
//                               "\$",
//                               style: bold16White,
//                             ),
//                           ),
//                         ),
//                       ),
//                       height5Space,
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             paidbook['name'].toString(),
//                             style: bold15Black2,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                           Row(
//                             children: [
//                               Row(
//                                 children: [
//                                   const Icon(
//                                     Icons.star,
//                                     size: 14,
//                                     color: primaryColor,
//                                   ),
//                                   width5Space,
//                                   Text(paidbook['rate'].toString(),
//                                       style: regular14Black2,
//                                       overflow: TextOverflow.ellipsis)
//                                 ],
//                               ),
//                               widthSpace,
//                               Row(
//                                 children: [
//                                   const Icon(
//                                     Icons.visibility,
//                                     size: 14,
//                                     color: primaryColor,
//                                   ),
//                                   width5Space,
//                                   Text(
//                                     paidbook['view'].toString(),
//                                     style: regular14Black2,
//                                     overflow: TextOverflow.ellipsis,
//                                   )
//                                 ],
//                               ),
//                             ],
//                           ),
//                           Text(
//                             paidbook['author'].toString(),
//                             style: semibold14Grey94,
//                             overflow: TextOverflow.ellipsis,
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               )
//               .toList(),
//         ),
//       )
//     ],
//   );
// }

// Widget listContent(Size size, String image, String name, String rate,
//     String view, String author, Function() onTap, Null Function() param7) {
//   Widget imageWidget;
//   if (image.startsWith('http')) {
//     // Image from URL
//     imageWidget = Image.network(
//       image,
//       fit: BoxFit.cover,
//       width: double.maxFinite,
//       height: size.height * 0.2,
//     );
//   } else {
//     // Image from asset
//     imageWidget = Image.asset(
//       image,
//       fit: BoxFit.cover,
//       width: double.maxFinite,
//       height: size.height * 0.2,
//     );
//   }

//   return GestureDetector(
//     onTap: onTap,
//     child: Container(
//       width: size.width * 0.34,
//       margin: const EdgeInsets.symmetric(horizontal: fixPadding),
//       color: Colors.transparent,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           imageWidget,
//           height5Space,
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 name,
//                 style: bold15Black2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//               Row(
//                 children: [
//                   Row(
//                     children: [
//                       const Icon(
//                         Icons.star,
//                         size: 14,
//                         color: primaryColor,
//                       ),
//                       width5Space,
//                       Text(
//                         rate,
//                         style: regular14Black2,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ],
//                   ),
//                   widthSpace,
//                   Row(
//                     children: [
//                       const Icon(
//                         Icons.visibility,
//                         size: 14,
//                         color: primaryColor,
//                       ),
//                       width5Space,
//                       Text(
//                         view,
//                         style: regular14Black2,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Text(
//                 author,
//                 style: semibold14Grey94,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }

// Widget titleText(BuildContext context, String title, Function() onTap) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Expanded(
//           child: Text(
//             title,
//             style: bold18Black2,
//           ),
//         ),
//         GestureDetector(
//           onTap: onTap,
//           child: Text(
//             getTranslate(context, 'home.see_all'),
//             style: bold14Primary,
//           ),
//         )
//       ],
//     ),
//   );
// }

// class MostPopularList extends StatelessWidget {
//   final Size size;

//   const MostPopularList({Key? key, required this.size}) : super(key: key);

//   BuildContext? get context => null;

//   get popularlist => null;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         titleText(getTranslate(context, 'home.most_popular'), () {
//           Navigator.pushNamed(context, '/mostpopular');
//         }),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           physics: const BouncingScrollPhysics(),
//           padding: const EdgeInsets.all(fixPadding),
//           child: Row(
//             children: popularlist
//                 .map(
//                   (popular) => listContent(
//                     size,
//                     popular['image'].toString(),
//                     popular['name'].toString(),
//                     popular['rate'].toString(),
//                     popular['view'].toString(),
//                     popular['author'].toString(),
//                     () {
//                       Navigator.pushNamed(context, '/storyDetail');
//                     },
//                   ),
//                 )
//                 .toList(),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget listContent(Size size, String image, String name, String rate,
//       String view, String author, VoidCallback onTap) {
//     return Container(
//       width: size.width * 0.35,
//       margin: const EdgeInsets.symmetric(horizontal: fixPadding),
//       color: Colors.transparent,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             height: size.height * 0.2,
//             padding: const EdgeInsets.all(fixPadding / 2),
//             width: double.maxFinite,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(5),
//               image: DecorationImage(
//                 image: AssetImage(image),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: Align(
//               alignment: Alignment.bottomRight,
//               child: Container(
//                 height: size.height * 0.03,
//                 width: size.height * 0.03,
//                 decoration: const BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: primaryColor,
//                 ),
//                 alignment: Alignment.center,
//                 child: const Text(
//                   "\$",
//                   style: bold16White,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 5),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 name,
//                 style: bold15Black2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//               Row(
//                 children: [
//                   Row(
//                     children: [
//                       const Icon(
//                         Icons.star,
//                         size: 14,
//                         color: primaryColor,
//                       ),
//                       const SizedBox(width: 5),
//                       Text(
//                         rate,
//                         style: regular14Black2,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(width: 10),
//                   Row(
//                     children: [
//                       const Icon(
//                         Icons.visibility,
//                         size: 14,
//                         color: primaryColor,
//                       ),
//                       const SizedBox(width: 5),
//                       Text(
//                         view,
//                         style: regular14Black2,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Text(
//                 author,
//                 style: semibold14Grey94,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget titleText(String title, Function() onTap) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: Text(
//               title,
//               style: bold18Black2,
//             ),
//           ),
//           GestureDetector(
//             onTap: onTap,
//             child: Text(
//               getTranslate(context!, 'home.see_all'),
//               style: bold14Primary,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// // class RecommendedList extends StatelessWidget {
// //   final Size size;

// //   const RecommendedList({Key? key, required this.size}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocBuilder<HomeCubit, HomeState>(
// //       builder: (context, state) {
// //         if (state is HomeLoadedState) {
// //           return SingleChildScrollView(
// //             scrollDirection: Axis.horizontal,
// //             physics: const BouncingScrollPhysics(),
// //             padding: const EdgeInsets.all(fixPadding),
// //             child: Row(
// //               children: state.recommendedList!
// //                   .map(
// //                     (recommended) => listContent(
// //                       size,
// //                       recommended['image'].toString(),
// //                       recommended['name'].toString(),
// //                       recommended['rate'].toString(),
// //                       recommended['view'].toString(),
// //                       recommended['author'].toString(),
// //                       () {
// //                         Navigator.pushNamed(context, '/storyDetail');
// //                       },
// //                     ),
// //                   )
// //                   .toList(),
// //             ),
// //           );
// //         } else {
// //           return const SizedBox();
// //         }
// //       },
// //     );
// //   }

// //   Widget listContent(Size size, String image, String name, String rate,
// //       String view, String author, Function() onTap) {
// //     Widget imageWidget;
// //     if (image.startsWith('http')) {
// //       // Image from URL
// //       imageWidget = Image.network(
// //         image,
// //         fit: BoxFit.cover,
// //         width: double.maxFinite,
// //         height: size.height * 0.2,
// //       );
// //     } else {
// //       // Image from asset
// //       imageWidget = Image.asset(
// //         image,
// //         fit: BoxFit.cover,
// //         width: double.maxFinite,
// //         height: size.height * 0.2,
// //       );
// //     }

// //     return GestureDetector(
// //       onTap: onTap,
// //       child: Container(
// //         width: size.width * 0.34,
// //         margin: const EdgeInsets.symmetric(horizontal: fixPadding),
// //         color: Colors.transparent,
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             imageWidget,
//             height5Space,
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   name,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15,
//                     color: Colors.black87,
//                   ),
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 Row(
//                   children: [
//                     Row(
//                       children: [
//                         const Icon(
//                           Icons.star,
//                           size: 14,
//                           color: Colors.orange,
//                         ),
//                         width5Space,
//                         Text(
//                           rate,
//                           style: const TextStyle(
//                             fontSize: 14,
//                             color: Colors.black87,
//                           ),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ],
//                     ),
//                     widthSpace,
//                     Row(
//                       children: [
//                         const Icon(
//                           Icons.visibility,
//                           size: 14,
//                           color: Colors.orange,
//                         ),
//                         width5Space,
//                         Text(
//                           view,
//                           style: const TextStyle(
//                             fontSize: 14,
//                             color: Colors.black87,
//                           ),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 Text(
//                   author,
//                   style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 14,
//                     color: Colors.grey[700],
//                   ),
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class HomeLoadedState {}

// class NewReleaseList extends StatelessWidget {
//   final Size size;

//   const NewReleaseList({Key? key, required this.size}) : super(key: key);

//   BuildContext? get context => null;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         titleText(getTranslate(context, 'home.new_release'), () {
//           Navigator.pushNamed(context, '/newrelease');
//         }),
//         BlocBuilder<HomeCubit, HomeState>(
//           builder: (context, state) {
//             if (state is HomeLoadedState) {
//               return SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   physics: const BouncingScrollPhysics(),
//                   padding: const EdgeInsets.all(fixPadding),
//                   child: Row(
//                     children: state.newReleaseList!
//                         .map(
//                           (newrelease) => listContent(
//                             size,
//                             newrelease['image'].toString(),
//                             newrelease['name'].toString(),
//                             newrelease['rate'].toString(),
//                             newrelease['view'].toString(),
//                             newrelease['author'].toString(),
//                             () {
//                               Navigator.pushNamed(context, '/storyDetail');
//                             },
//                           ),
//                         )
//                         .toList(),
//                   ));
//             } else {
//               return const SizedBox();
//             }
//           },
//         ),
//       ],
//     );
//   }

//   Widget listContent(Size size, String image, String name, String rate,
//       String view, String author, Function() onTap) {
//     Widget imageWidget;
//     if (image.startsWith('http')) {
//       // Image from URL
//       imageWidget = Image.network(
//         image,
//         fit: BoxFit.cover,
//         width: double.maxFinite,
//         height: size.height * 0.2,
//       );
//     } else {
//       // Image from asset
//       imageWidget = Image.asset(
//         image,
//         fit: BoxFit.cover,
//         width: double.maxFinite,
//         height: size.height * 0.2,
//       );
//     }

//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: size.width * 0.34,
//         margin: const EdgeInsets.symmetric(horizontal: fixPadding),
//         color: Colors.transparent,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             imageWidget,
//             height5Space,
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   name,
//                   style: bold15Black2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 Row(
//                   children: [
//                     Row(
//                       children: [
//                         const Icon(
//                           Icons.star,
//                           size: 14,
//                           color: primaryColor,
//                         ),
//                         width5Space,
//                         Text(
//                           rate,
//                           style: regular14Black2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ],
//                     ),
//                     widthSpace,
//                     Row(
//                       children: [
//                         const Icon(
//                           Icons.visibility,
//                           size: 14,
//                           color: primaryColor,
//                         ),
//                         width5Space,
//                         Text(
//                           view,
//                           style: regular14Black2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 Text(
//                   author,
//                   style: semibold14Grey94,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget titleText(String title, Function() onTap) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: Text(
//               title,
//               style: bold18Black2,
//             ),
//           ),
//           GestureDetector(
//             onTap: onTap,
//             child: Text(
//               getTranslate(context!, 'home.see_all'),
//               style: bold14Primary,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CategoryList extends StatelessWidget {
//   final Size size;

//   const CategoryList({Key? key, required this.size}) : super(key: key);

//   get context => null;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         titleText(getTranslate(context, 'home.category'), () {
//           Navigator.pushNamed(context, '/category');
//         }),
//         BlocBuilder<HomeCubit, HomeState>(
//           builder: (context, state) {
//             if (state is HomeLoadedState) {
//               return SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   physics: const BouncingScrollPhysics(),
//                   padding: const EdgeInsets.all(fixPadding),
//                   child: Row(
//                     children: state.categoryList!
//                         .map(
//                           (category) => listContent(
//                             size,
//                             category['image'].toString(),
//                             category['name'].toString(),
//                             category['totalbooks'].toString(),
//                             () {
//                               Navigator.pushNamed(context, '/categoryDetail');
//                             },
//                           ),
//                         )
//                         .toList(),
//                   ));
//             } else {
//               return const SizedBox();
//             }
//           },
//         ),
//       ],
//     );
//   }

//   Widget listContent(Size size, String image, String name, String totalBooks,
//       Function() onTap) {
//     Widget imageWidget;
//     if (image.startsWith('http')) {
//       // Image from URL
//       imageWidget = Image.network(
//         image,
//         fit: BoxFit.cover,
//         width: size.width * 0.34,
//         height: size.width * 0.34,
//       );
//     } else {
//       // Image from asset
//       imageWidget = Image.asset(
//         image,
//         fit: BoxFit.cover,
//         width: size.width * 0.34,
//         height: size.width * 0.34,
//       );
//     }

//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: fixPadding),
//         color: Colors.transparent,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8.0),
//               child: imageWidget,
//             ),
//             height5Space,
//             Text(
//               name,
//               style: bold15Black2,
//               overflow: TextOverflow.ellipsis,
//             ),
//             Text(
//               '$totalBooks ${getTranslate(context!, 'home.books')}',
//               style: semibold14Grey94,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget titleText(String title, Function() onTap) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: Text(
//               title,
//               style: bold18Black2,
//             ),
//           ),
//           GestureDetector(
//             onTap: onTap,
//             child: Text(
//               getTranslate(context!, 'home.see_all'),
//               style: bold14Primary,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
}
