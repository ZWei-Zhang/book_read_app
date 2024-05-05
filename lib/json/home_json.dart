import 'package:book_read_app/theme/colors.dart';
import 'package:flutter/material.dart';

const String profileUrl = 'https://c-ssl.dtstatic.com/uploads/blog/202304/15/20230415081411_f2e46.thumb.400_0.jpg';
const String readyToday = 'https://images.unsplash.com/photo-1544716278-e513176f20b5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGJvb2t8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60';

const List tags = [
  {
    "label" : "教育",
    "color" : Color(0xFF7871aa)
  },
  {
    "label" : "自我发展",
    "color" : Color(0xFF7fb069)
  },
  {
    "label" : "心理学",
    "color" : Color(0xFFcc7e85)
  }

];

const List storeTags = [
  {
    "label" : "Education",
    "color" : Color(0xFF7871aa)
  },
  {
    "label" : "Self-development",
    "color" : Color(0xFF7fb069)
  },
  {
    "label" : "Psychology",
    "color" : Color(0xFFcc7e85)
  },
  {
    "label" : "Fantasy",
    "color" : Color(0xFF76818e)
  },
  {
    "label" : "Adventures",
    "color" : Color(0xFFcf4d6f)
  },
  {
    "label" : "Science-fiction",
    "color" : Color(0xFFc86fc9)
  },
  {
    "label" : "Detectives",
    "color" : Color(0xFF8f8073)
  }

];

const List specialForYouJson = [
  {
    "img" : "https://cdn.weread.qq.com/weread/cover/6/cpplatform_3flv23gsk5i1wyfewbxcmq/t6_cpplatform_3flv23gsk5i1wyfewbxcmq1714035435.jpg",
    "price" : "5.00",
    "title" : "卓越基因",
    "sub_title" : "1st ed.",
    "author_name" : "[美]吉姆·柯林斯 比尔·拉齐尔",
    "rate" : 4.31,
    "favourite" : true,
    "page" : "87" 
  },
  {
    "img" : "https://cdn.weread.qq.com/weread/cover/44/cpplatform_tweycmwdgv5kegl9rgght1/t6_cpplatform_tweycmwdgv5kegl9rgght11687684560.jpg",
    "price" : "8.99",
    "title" : "芒格之道",
    "sub_title" : "A Court of Thorns and Roses",
    "author_name" : "查理·芒格",
    "rate" : 4.15,
    "favourite" : false,
    "page" : "263" 
  },
  {
    "img" : "https://cdn.weread.qq.com/weread/cover/75/YueWen_41218663/t6_YueWen_41218663.jpg",
    "price" : "3.40",
    "title" : "苏东坡全传",
    "sub_title" : "First large print edition.",
    "author_name" : "秦晓",
    "rate" : 3.20,
    "favourite" : false,
    "page" : "60" 
  },
  {
    "img" : "https://cdn.weread.qq.com/weread/cover/94/3300011794/t6_3300011794.jpg",
    "price" : "5.99",
    "title" : "请画一下爱",
    "sub_title" : "A Novel",
    "author_name" : "ShuRan 舒然",
    "rate" : 4.12,
    "favourite" : true,
    "page" : "872" 
  },
  {
    "img" : "https://cdn.weread.qq.com/weread/cover/95/cpplatform_sdmajvezrwad4cgirmsspn/t6_cpplatform_sdmajvezrwad4cgirmsspn1714473374.jpg",
    "price" : "2.99",
    "title" : "第七重解答",
    "sub_title" : "A Novel",
    "author_name" : "[法]保罗·霍尔顿",
    "rate" : 2.00,
    "favourite" : false,
    "page" : "76" 
  }
];

List reviewsPeople = [
  {
    "img" : "https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
    "name" : "Miranda",
    "rate" : 3.0,
    "text" :"For once I actually thought Colleen wasn’t going to make me cry."
  },
  {
    "img" : "https://images.unsplash.com/photo-1523701911984-474f3d34537b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDZ8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    "name" : "Selena",
    "rate" : 4.5,
    "text" :"I wanted to give this book 5 stars but just couldn’t. There are so many f-bombs I almost stopped reading it but I kept at it. Glad I did too. But I will never read it again or listen to it because I don’t need that word in my mind. Why oh why is it so necessary to the story?"
  }
];

const List similarBooksJson = [
  {
    "img" : "https://wfqqreader-1252317822.image.myqcloud.com/cover/793/37095793/t6_37095793.jpg",
    "price" : "2.50",
    "title" : "I'm Glad My Mom Died",
    "sub_title" : "I'm Glad My Mom Died",
    "author_name" : "Jennette McCurdy",
    "rate" : 4.0,
    "favourite" : false,
    "page" : "200" 
  },
  {
    "img" : "https://cdn.weread.qq.com/weread/cover/78/3300018278/t6_3300018278.jpg",
    "price" : "5.99",
    "title" : "The Love Hypothesis",
    "sub_title" : "The Love Hypothesis",
    "author_name" : "Ali Hazelwood",
    "rate" : 3.5,
    "favourite" : false,
    "page" : "150" 
  },
  {
    "img" : "https://cdn.weread.qq.com/weread/cover/58/cpplatform_kh3smngft9p3rgyvekfixw/t6_cpplatform_kh3smngft9p3rgyvekfixw1714457907.jpg",
    "price" : "2.20",
    "title" : "The 48 Laws of Power",
    "sub_title" : "The 48 Laws of Power",
    "author_name" : "Robert Greene",
    "rate" : 4.07,
    "favourite" : false,
    "page" : "60" 
  },
];