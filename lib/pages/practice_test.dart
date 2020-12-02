import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/components/static_appbar.dart';
import 'package:myapp/utils/screen_config.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PracticeTest extends StatefulWidget {
  @override
  _PracticeTestState createState() => _PracticeTestState();
}

class Question {
  String key;
  List<Anwser> anwsers;

  Question(this.key, this.anwsers);
}

class Anwser {
  String key;
  bool isTrue;

  Anwser(this.key, this.isTrue);
}

class _PracticeTestState extends State<PracticeTest> {
  int _totalQuestion = 10;
  int _curentQuestionIndex = 0;
  double _progress = 0;
  bool isTrue = false;
  List<Question> _listQuestion = [
    Question("日", [
      Anwser("Sun/Day", false),
      Anwser("Dog", false),
      Anwser("Cat", false),
      Anwser("Moon", false)
    ]),
    Question("月", [
      Anwser("Sun/Day", false),
      Anwser("Moon", false),
      Anwser("Fish", false),
      Anwser("One", false)
    ]),
    Question("本", [
      Anwser("Book", false),
      Anwser("Cat", false),
      Anwser("Sun/Day", false),
      Anwser("Now", false)
    ]),
    Question("四", [
      Anwser("Three", false),
      Anwser("One", false),
      Anwser("Four", false),
      Anwser("Ten", false)
    ]),
    Question("五", [
      Anwser("Five", false),
      Anwser("Dog", false),
      Anwser("Now", false),
      Anwser("Sun/Day", false)
    ]),
    Question("八", [
      Anwser("One", false),
      Anwser("Eight", false),
      Anwser("Nine", false),
      Anwser("Sun/Day", false)
    ]),
    Question("魚", [
      Anwser("Cat", false),
      Anwser("Dog", false),
      Anwser("Fish", false),
      Anwser("Moon", false)
    ]),
    Question("青", [
      Anwser("Black", false),
      Anwser("White", false),
      Anwser("Blue", false),
      Anwser("Yellow", false)
    ]),
    Question("三", [
      Anwser("Three", false),
      Anwser("Dog", false),
      Anwser("Sun/Day", false),
      Anwser("Moon", false)
    ]),
    Question("犬", [
      Anwser("Dog", false),
      Anwser("Cat", false),
      Anwser("Duck", false),
      Anwser("Bird", false)
    ]),
  ];
  Question _curentQuestion;

  @override
  void initState() {
    _curentQuestion = _listQuestion.elementAt(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: staticAppbar(title: "Practive Test"),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Text("Câu hỏi ${_curentQuestionIndex + 1}/${_totalQuestion}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LinearPercentIndicator(
                width: SizeConfig.blockSizeHorizontal * 90,
                lineHeight: SizeConfig.blockSizeVertical * 1,
                percent: _progress,
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.grey,
              ),
            ),
            Text(
              _curentQuestion.key.toString() ?? "",
              style: TextStyle(fontSize: 100, color: Color(0xFF006465)),
            ),
            GridView.builder(
              itemCount: 4,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 9 / 7),
              itemBuilder: (context, index) {
                return AnswerCard(_listQuestion
                    .elementAt(_curentQuestionIndex)
                    .anwsers
                    .elementAt(index));
              },
            )
          ],
        ),
      ),
    );
  }

  Widget AnswerCard(Anwser anwser) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: SizeConfig.blockSizeVertical * 10,
        width: SizeConfig.blockSizeHorizontal * 40,
        color:Colors.transparent,
        child: Card(
          child: RaisedButton(
            color:anwser.isTrue ? Color(0xFF05FF00) : Colors.white,
            onPressed: () {
              setState(() {
                anwser.isTrue = true;
              });
              Future.delayed(Duration(milliseconds: 500), () {
                setState(() {
                  if (_curentQuestionIndex >= 9) {
                    _curentQuestionIndex = 0;
                    _progress = 0;
                  } else {
                    _curentQuestionIndex += 1;
                    _progress += 0.1;
                    _curentQuestion =
                        _listQuestion.elementAt(_curentQuestionIndex);
                    print(_progress);
                  }
                });
              });
            },
            child: Center(
              child: Text(
                anwser.key,
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 8,
                    fontWeight: FontWeight.bold,
                    color: anwser.isTrue ? Colors.white : Color(0xFF006465)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
