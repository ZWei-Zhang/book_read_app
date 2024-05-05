import 'package:book_read_app/json/store_json.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../json/home_json.dart';
import '../theme/colors.dart';
import 'book_detail_page.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePage();
}

class _StorePage extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
        child: SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          getSearchAndCart(),
          const SizedBox(
            height: 30,
          ),
          getRecommendation(),
          const SizedBox(
            height: 30,
          ),
          getGenres(),
          const SizedBox(
            height: 30,
          ),
          getTrendingBooks(),
        ],
      ),
    ));
  }

  Widget getSearchAndCart() {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            width: size.width * 0.8,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.25),
                borderRadius: BorderRadius.circular(12)),
            child: const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: '搜索...'),
              ),
            )),
        Flexible(
            child: IconButton(
          onPressed: () {},
          icon: const badges.Badge(
            badgeContent: Text(
              "3",
              style: TextStyle(color: Colors.white),
            ),
            badgeStyle: badges.BadgeStyle(
              badgeColor: primary,
            ),
            child: Icon(LineIcons.shoppingBag, size: 25),
          ),
        ))
      ],
    );
  }

  Widget getRecommendation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('推荐',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            Row(
              children: [
                Text('查看全部', style: TextStyle(fontSize: 14)),
                SizedBox(
                  width: 3,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(recommendationsList.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => BookDetailPage(
                              img: recommendationsList[index]['img'],
                              title: recommendationsList[index]['title'],
                              subTitle: recommendationsList[index]['sub_title'],
                              price: recommendationsList[index]['price']
                                  .toString(),
                              page: recommendationsList[index]['page'],
                              authorName: recommendationsList[index]
                                  ['author_name'],
                              rate: recommendationsList[index]['rate']
                                  .toString())));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 120,
                            height: 160,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: primary,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        recommendationsList[index]['img']),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            width: 120,
                            height: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.black.withOpacity(0.2),
                            ),
                          ),
                          Positioned(
                              right: 10,
                              top: 10,
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: Icon(
                                    recommendationsList[index]['favourite']
                                        ? LineIcons.heartAlt
                                        : LineIcons.heart,
                                    size: 20,
                                    color: danger),
                              )),
                          Positioned(
                              top: 100,
                              child: Container(
                                width: 65,
                                height: 25,
                                decoration: const BoxDecoration(
                                    color: primary,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(12),
                                        topRight: Radius.circular(12))),
                                child: Center(
                                  child: Text(
                                    "\$ ${recommendationsList[index]['price']}",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 120,
                        child: Text(
                          recommendationsList[index]['title'],
                          maxLines: 1,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: 120,
                        child: Text(
                          recommendationsList[index]['sub_title'],
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black.withOpacity(0.4)),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      SizedBox(
                          width: 120,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RatingBar.builder(
                                ignoreGestures: true,
                                initialRating: recommendationsList[index]
                                    ['rate'],
                                maxRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 14,
                                itemPadding: const EdgeInsets.only(right: 2),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: danger,
                                ),
                                onRatingUpdate: (rating) {},
                              ),
                              Text(
                                '(${recommendationsList[index]['rate'].toString()})',
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: danger,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              );
            }),
          ),
        )
      ],
    );
  }

  Widget getGenres() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Genres',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          Row(
            children: [
              Text('查看全部', style: TextStyle(fontSize: 14)),
              SizedBox(
                width: 3,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 14,
              )
            ],
          )
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Wrap(
        runSpacing: 10,
        children: List.generate(storeTags.length, (index) {
          return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                  decoration: BoxDecoration(
                      color: storeTags[index]['color'],
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    child: Text(
                      storeTags[index]['label'],
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  )));
        }),
      ),
    ]);
  }

  Widget getTrendingBooks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Trending Books',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            Row(
              children: [
                Text('查看全部', style: TextStyle(fontSize: 14)),
                SizedBox(
                  width: 3,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(trendingBooks.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => BookDetailPage(
                              img: trendingBooks[index]['img'],
                              title: trendingBooks[index]['title'],
                              subTitle: trendingBooks[index]['sub_title'],
                              price: trendingBooks[index]['price'].toString(),
                              page: trendingBooks[index]['page'],
                              authorName: trendingBooks[index]['author_name'],
                              rate: trendingBooks[index]['rate'].toString())));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 120,
                            height: 160,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: primary,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        trendingBooks[index]['img']),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            width: 120,
                            height: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.black.withOpacity(0.2),
                            ),
                          ),
                          Positioned(
                              right: 10,
                              top: 10,
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: Icon(
                                    trendingBooks[index]['favourite']
                                        ? LineIcons.heartAlt
                                        : LineIcons.heart,
                                    size: 20,
                                    color: danger),
                              )),
                          Positioned(
                              top: 100,
                              child: Container(
                                width: 65,
                                height: 25,
                                decoration: const BoxDecoration(
                                    color: primary,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(12),
                                        topRight: Radius.circular(12))),
                                child: Center(
                                  child: Text(
                                    "\$ ${trendingBooks[index]['price']}",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 120,
                        child: Text(
                          trendingBooks[index]['title'],
                          maxLines: 1,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: 120,
                        child: Text(
                          trendingBooks[index]['sub_title'],
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black.withOpacity(0.4)),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      SizedBox(
                          width: 120,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RatingBar.builder(
                                ignoreGestures: true,
                                initialRating: trendingBooks[index]['rate'],
                                maxRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 14,
                                itemPadding: const EdgeInsets.only(right: 2),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: danger,
                                ),
                                onRatingUpdate: (rating) {},
                              ),
                              Text(
                                '(${trendingBooks[index]['rate'].toString()})',
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: danger,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
