import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/components/static_appbar.dart';
import 'package:myapp/utils/screen_config.dart';

class Challenge extends StatefulWidget {
  final String title;

  const Challenge({this.title}) : super();

  @override
  _ChallengeState createState() => _ChallengeState();
}

enum Status { UNDEFINDED, TRUE, FALSE }

class KeyWord {
  String text;
  String meaning;
  bool isTrue = false;
  bool isChoose = false;

  KeyWord({this.text, this.meaning});
}

class _ChallengeState extends State<Challenge> {
  bool start = false;
  String quiz;
  List<Status> _dataCheck;
  List<String> _listQiz = ["Sun/Day", "Nine", "Moon", "Four", "Six", "Five", "Book", "Blue", "Three", "Dog", "Eight", "White", "One", "Fish", "Seven", "Two"];
  List<KeyWord> _listWord = [
    KeyWord(text: "日", meaning: "Sun/Day"),
    KeyWord(text: "月", meaning: "Moon"),
    KeyWord(text: "本", meaning: "Book"),
    KeyWord(text: "一", meaning: "One"),
    KeyWord(text: "二", meaning: "Two"),
    KeyWord(text: "三", meaning: "Three"),
    KeyWord(text: "四", meaning: "Four"),
    KeyWord(text: "五", meaning: "Five"),
    KeyWord(text: "六", meaning: "Six"),
    KeyWord(text: "七", meaning: "Seven"),
    KeyWord(text: "八", meaning: "Eight"),
    KeyWord(text: "九", meaning: "Nine"),
    KeyWord(text: "犬", meaning: "Dog"),
    KeyWord(text: "魚", meaning: "Fish"),
    KeyWord(text: "青", meaning: "Blue"),
    KeyWord(text: "白", meaning: "White"),
  ];

  @override
  void initState() {
    _dataCheck = List.generate(_listWord.length, (index) => Status.UNDEFINDED);
    quiz = _listQiz.elementAt(Random().nextInt(15));
    super.initState();
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        start = !start;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF006465),
        appBar: staticAppbar(title: "${widget.title}"),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _progress(),
              SizedBox(height: SizeConfig.safeBlockVertical * 2),
              Text(quiz, style: TextStyle(color: Colors.white, fontSize: 35), textAlign: TextAlign.center),
              SizedBox(height: SizeConfig.safeBlockVertical * 2),
              _buildGrid(),
            ],
          ),
        ),
      ),
    );
  }

  GridView _buildGrid() {
    return GridView.builder(
      itemCount: _listWord.length,
      physics: ScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 1),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.all(0.5),
          color: _dataCheck[index] != Status.UNDEFINDED
              ? _dataCheck[index] != Status.FALSE
                  ? Color(0xFF05FF00)
                  : Colors.red
              : Colors.white,
          child: AbsorbPointer(
            absorbing: _dataCheck[index] != Status.UNDEFINDED,
            child: FlatButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                setState(() {
                  print(_listWord[index].meaning);
                  if (_listWord[index].meaning == quiz) {
                    _dataCheck[index] = Status.TRUE;
                  } else {
                    _dataCheck[index] = Status.FALSE;
                    _dataCheck[_listWord.indexWhere((element) => element.meaning == quiz)] = Status.TRUE;
                  }
                });
                Future.delayed(Duration(milliseconds: 200), () {
                  setState(() {
                    (_dataCheck[index] == Status.FALSE) ? _dataCheck[index] = Status.UNDEFINDED : {};
                    start = !start;
                    if (start) {
                      quiz = _listQiz.elementAt(Random().nextInt(15));
                    }
                  });
                });
              },
              child: Text(
                "${_listWord.elementAt(index).text}",
                style: TextStyle(fontSize: 20, color: Color(0xFF006465)),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _progress() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(90),
      child: Container(
        height: SizeConfig.safeBlockHorizontal * 4.8,
        width: SizeConfig.safeBlockHorizontal * 80,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(width: SizeConfig.blockSizeHorizontal * 80, color: Color(0xFF006465)),
            AnimatedPositioned(
              left: start ? -SizeConfig.blockSizeHorizontal * 80 : 0,
              curve: Curves.easeIn,
              onEnd: () {
                Future.delayed(Duration(milliseconds: 200), () {
                  setState(() {
                    start = !start;
                    if (start) {
                      quiz = _listQiz.elementAt(Random().nextInt(15));
                    }
                  });
                });
              },
              duration: Duration(seconds: start ? 3 : 0),
              child: Container(
                height: SizeConfig.safeBlockHorizontal * 6,
                width: SizeConfig.safeBlockHorizontal * 80,
                decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Color(0xFF006465)), borderRadius: BorderRadius.circular(90)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
