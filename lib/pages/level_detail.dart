import 'package:flutter/material.dart';
import 'package:myapp/components/static_appbar.dart';
import 'package:myapp/pages/challenge.dart';
import 'package:myapp/pages/flashcard.dart';
import 'package:myapp/pages/practice_test.dart';
import 'package:myapp/pages/word_choose.dart';
import 'package:myapp/utils/screen_config.dart';


class LevelDetail extends StatefulWidget {
  final String moduleTitle;

  const LevelDetail({this.moduleTitle}) : super();

  @override
  _LevelDetailState createState() => _LevelDetailState();
}

class _LevelDetailState extends State<LevelDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: staticAppbar(title: "Level Detail"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
                  '20%',
                  style: TextStyle(color: Color(0xff006265)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 3, bottom: 25),
              width: SizeConfig.blockSizeHorizontal * 75,
              height: SizeConfig.blockSizeVertical * 1.3,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: LinearProgressIndicator(
                  value: 0.2,
                  valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff006265)),
                  backgroundColor: Color(0xff80B2B2),
                ),
              ),
            ),
            Container(
              height: SizeConfig.blockSizeVertical * 8.8,
              width: SizeConfig.blockSizeHorizontal * 95,
              margin: EdgeInsets.all(5),
              child: Card(
                color: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                child: FlatButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => WordChoose())),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        width: SizeConfig.safeBlockHorizontal * 20,
                        child: ImageIcon(
                          AssetImage('assets/menu-icon.png'),
                          color: Color(0xff006265),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Kanji Detail',
                          style: TextStyle(fontSize: 16, color: Color(0xff006265)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: SizeConfig.blockSizeVertical * 8.8,
              width: SizeConfig.blockSizeHorizontal * 95,
              margin: EdgeInsets.all(5),
              child: Card(
                color: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Flashcard()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        width: SizeConfig.safeBlockHorizontal * 21.5,
                        child: ImageIcon(
                          AssetImage('assets/flashcard.png'),
                          color: Color(0xff006265),
                          size: 34,
                        ),
                      ),
                      Text(
                        'Learning with flashcards',
                        style: TextStyle(fontSize: 16, color: Color(0xff006265)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: SizeConfig.blockSizeVertical * 8.8,
              width: SizeConfig.blockSizeHorizontal * 95,
              margin: EdgeInsets.all(5),
              child: Card(
                color: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                child: FlatButton(
                  onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=> PracticeTest())),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        width: SizeConfig.safeBlockHorizontal * 20,
                        child: ImageIcon(AssetImage('assets/practice-icon.png'), color: Color(0xff006265)),
                      ),
                      Text('Practice Test', style: TextStyle(fontSize: 16, color: Color(0xff006265))),
                      Spacer(),
                      Container(
                        child: ImageIcon(AssetImage('assets/more-icon.png'), color: Color(0xff006265)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: SizeConfig.blockSizeVertical * 8.8,
              width: SizeConfig.blockSizeHorizontal * 95,
              margin: EdgeInsets.all(5),
              child: Card(
                color: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                child: FlatButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Challenge(title: widget.moduleTitle))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        width: SizeConfig.safeBlockHorizontal * 20,
                        child: ImageIcon(AssetImage('assets/challenge-icon.png'), color: Color(0xff006265)),
                      ),
                      Text('Challenge', style: TextStyle(fontSize: 16, color: Color(0xff006265))),
                      Spacer(),
                      Container(child: ImageIcon(AssetImage('assets/more-icon.png'), color: Color(0xff006265))),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
