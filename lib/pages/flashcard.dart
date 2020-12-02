import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../components/static_appbar.dart';
import '../utils/screen_config.dart';
import '../utils/screen_config.dart';
import 'word_choose.dart';

class Flashcard extends StatefulWidget {
  @override
  _FlashcardState createState() => _FlashcardState();
}

class _FlashcardState extends State<Flashcard> {
  List<Map<String, dynamic>> _cardKanjiList = [

    {"text": "日", "meaning": "Sun/Day", "katakana": "ニチ", "hiragana": "ひひ"},
    {"text": "月", "meaning": "Moon", "katakana": "ゲツ", "hiragana": "つき"},
    {"text": "本", "meaning": "Book", "katakana": "ホン", "hiragana": "もと"},
    {"text": "青", "meaning": "Moon", "katakana": "セイ", "hiragana": "あお"},
    {"text": "本", "meaning": "Book", "katakana": "ホン", "hiragana": "もと"},
    {"text": "青", "meaning": "Moon", "katakana": "セイ", "hiragana": "あお"},
  ];
  bool isView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: staticAppbar(title: "Basic kanji 1", action: [
        Container(
            margin: EdgeInsets.only(right: 5),
            child: IconButton(
              splashRadius: 10,
              splashColor: Color(0xff006265),
              icon: isView == true
                  ? Icon(Icons.remove_red_eye_outlined, size: 30, color: Colors.white)
                  : Icon(Icons.visibility_off, size: 30, color: Colors.white),
              onPressed: () {
                setState(() {
                  isView = !isView;
                });
              },
            ))
      ]),
      body: _getBody(),
    );
  }
  Widget _getBody() {
    return Container(
        child: Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Card(
          margin: EdgeInsets.fromLTRB(50, 30, 50, 50),
          elevation: 4,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 3, right: 20),
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.star_border,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "${_cardKanjiList[index]['text']}",
                  style: TextStyle(fontSize: 160, color: Color(0xff006265)),
                ),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical * 5),
              isView == false
                  ? Container()
                  : Column(
                      children: [
                        Center(
                          child: Text(
                            "${_cardKanjiList[index]['meaning']}",
                            style: TextStyle(fontSize: 50, color: Color(0xff006265)),
                          ),
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical * 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                child: Text(
                              "${_cardKanjiList[index]['katakana'].toString()}",
                              style: TextStyle(fontSize: 28, color: Color(0xff006265)),
                            )),
                            Center(
                              child: Container(
                                color: Colors.black,
                                width: 1,
                                height: SizeConfig.blockSizeVertical * 13,
                              ),
                            ),
                            Container(
                              child: Text(
                                "${_cardKanjiList[index]['hiragana'].toString()}",
                                style: TextStyle(fontSize: 28, color: Color(0xff006265)),
                              ),
                            )
                          ],
                        )
                      ],
                    )
            ],
          ),
        );
      },
      autoplay: false,
      itemCount: _cardKanjiList.length,
      scrollDirection: Axis.horizontal,
      // pagination: SwiperPagination(alignment: Alignment.bottomCenter),
      // control: SwiperControl(),
    ));
  }
}
