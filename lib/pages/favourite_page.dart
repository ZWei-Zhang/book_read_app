import 'package:book_read_app/json/favourite_json.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../theme/colors.dart';
import 'book_detail_page.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});
  @override
  State<FavouritePage> createState() => _FavouritePage();
}

class _FavouritePage extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: getBody());
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
          getFavouriteList()
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

  Widget getFavouriteList() {
    var size = MediaQuery.of(context).size;
    return Wrap(
        spacing: 15,
        runSpacing: 20,
        children: List.generate(favouriteBooksJson.length, (index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => BookDetailPage(
                          img: favouriteBooksJson[index]['img'],
                          title: favouriteBooksJson[index]['title'],
                          subTitle: favouriteBooksJson[index]['sub_title'],
                          price: favouriteBooksJson[index]['price'].toString(),
                          page: favouriteBooksJson[index]['page'],
                          authorName: favouriteBooksJson[index]['author_name'],
                          rate: favouriteBooksJson[index]['rate'].toString())));
            },
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: (size.width - 55) / 2,
                      height: (size.width + 40) / 2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              image: NetworkImage(
                                  favouriteBooksJson[index]['img']),
                              fit: BoxFit.cover)),
                    ),
                    Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Center(
                            child: Icon(
                              favouriteBooksJson[index]['favourite']
                                  ? LineIcons.heartAlt
                                  : LineIcons.heart,
                              color: danger,
                              size: 22,
                            ),
                          ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: (size.width - 55) / 2,
                  child: Text(
                    favouriteBooksJson[index]['title'],
                    maxLines: 1,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: (size.width - 55) / 2,
                  child: Text(
                    favouriteBooksJson[index]['sub_title'],
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 14, color: Colors.black.withOpacity(0.8)),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: (size.width - 55) / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RatingBar.builder(
                        ignoreGestures: true,
                        initialRating: favouriteBooksJson[index]['rate'],
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
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        '(${favouriteBooksJson[index]['rate'].toString()})',
                        style: const TextStyle(
                            fontSize: 13,
                            color: danger,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }));
  }
}
