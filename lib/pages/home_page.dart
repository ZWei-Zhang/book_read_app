// import 'package:badges/badges.dart';
import 'package:badges/badges.dart' as badges;
import 'package:book_read_app/pages/book_detail_page.dart';
import 'package:book_read_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../json/home_json.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '你好 ZWei-Zhang',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(profileUrl),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
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
                ),
                const SizedBox(height: 15),
                getSectionQuote(),
                const SizedBox(
                  height: 30,
                ),
                getReadyTodaySection(),
                const SizedBox(
                  height: 30,
                ),
                getSpecialForYou(),
              ],
            )));
  }

  Widget getSectionQuote() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: primary.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12)),
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '今日推荐',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '道可道，非常道；名可名，非常名。无名天地之始，有名万物之母。',
              style: TextStyle(
                  fontSize: 15, fontWeight: FontWeight.w500, height: 1.5),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text('老子/《道德经》',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            )
          ],
        ),
      ),
    );
  }

  Widget getReadyTodaySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "书单",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 15),
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                  image: NetworkImage(readyToday), fit: BoxFit.cover)),
        ),
        const SizedBox(height: 15),
        const Text(
          '自我发展的十大书籍',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 15),
        Wrap(
          children: List.generate(tags.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: tags[index]['color'],
                    borderRadius: BorderRadius.circular(12)),
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                child: Text(tags[index]['label'],
                    style: const TextStyle(fontSize: 12, color: Colors.white)),
              ),
            );
          }),
        )
      ],
    );
  }

  Widget getSpecialForYou() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('为你推荐',
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
            children: List.generate(specialForYouJson.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => BookDetailPage(
                              img: specialForYouJson[index]['img'],
                              title: specialForYouJson[index]['title'],
                              subTitle: specialForYouJson[index]['sub_title'],
                              price: specialForYouJson[index]['price'].toString(),
                              page: specialForYouJson[index]['page'],
                              authorName: specialForYouJson[index]
                                  ['author_name'],
                              rate: specialForYouJson[index]['rate'].toString())));
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
                                        specialForYouJson[index]['img']),
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
                                    specialForYouJson[index]['favourite']
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
                                    "\$ ${specialForYouJson[index]['price']}",
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
                          specialForYouJson[index]['title'],
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
                          specialForYouJson[index]['sub_title'],
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
                                initialRating: specialForYouJson[index]['rate'],
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
                                '(${specialForYouJson[index]['rate'].toString()})',
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
