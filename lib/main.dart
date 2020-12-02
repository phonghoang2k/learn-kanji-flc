// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MaterialApp(
//     home: QuoteList(),
//   ));
// }
//
// class QuoteList extends StatefulWidget {
//   @override
//   _QuoteListState createState() => _QuoteListState();
// }
//
// class _QuoteListState extends State<QuoteList> {
//   dynamic a, b, c, d = Colors.white;
//
//   // Widget quoteTemplate(quote, int isCorrect) {
//   //
//   //   return
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Center(child: Text('Basis Kanji 1')),
//         centerTitle: true,
//         backgroundColor: Color(0xff006265),
//       ),
//       body: StreamBuilder(
//         stream:
//             FirebaseFirestore.instance.collection('kanji-tests').snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//
//           return ListView(
//             // ignore: deprecated_member_use
//             children: snapshot.data.documents.map((doc) {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(height: 100.0),
//                   Text(
//                     doc['question'],
//                     style: TextStyle(
//                       fontSize: 50.0,
//                       color: Color(0xff006265),
//                     ),
//                   ),
//                   SizedBox(height: 25.0),
//                   Row(
//                     children: [
//                       Expanded(
//                         flex: 1,
//                         child: Card(
//                           color: a,
//                           elevation: 5.0,
//                           margin:
//                               const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 0),
//                           child: InkWell(
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   vertical: 25.0, horizontal: 12.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                                 children: [
//                                   Center(
//                                     child: Text(
//                                       doc['correct'],
//                                       style: TextStyle(
//                                         fontSize: 18.0,
//                                         color: Color(0xff006265),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             onTap: () {
//                               setState(() {
//                                 a = Colors.green;
//                               });
//                             },
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         flex: 1,
//                         child: Card(
//                           color: b,
//                           elevation: 5.0,
//                           margin:
//                           const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 0),
//                           child: InkWell(
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   vertical: 25.0, horizontal: 12.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                                 children: [
//                                   Center(
//                                     child: Text(
//                                       doc['wrong1'],
//                                       style: TextStyle(
//                                         fontSize: 18.0,
//                                         color: Color(0xff006265),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             onTap: () {
//                               setState(() {
//                                 b = Colors.redAccent;
//                               });
//                             },
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Expanded(
//                         flex: 1,
//                         child: Card(
//                           color: c,
//                           elevation: 5.0,
//                           margin:
//                           const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 0),
//                           child: InkWell(
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   vertical: 25.0, horizontal: 12.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                                 children: [
//                                   Center(
//                                     child: Text(
//                                       doc['wrong2'],
//                                       style: TextStyle(
//                                         fontSize: 18.0,
//                                         color: Color(0xff006265),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             onTap: () {
//                               setState(() {
//                                 c = Colors.redAccent;
//                               });
//                             },
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         flex: 1,
//                         child: Card(
//                           color: d,
//                           elevation: 5.0,
//                           margin:
//                           const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 0),
//                           child: InkWell(
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   vertical: 25.0, horizontal: 12.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                                 children: [
//                                   Center(
//                                     child: Text(
//                                       doc['wrong3'],
//                                       style: TextStyle(
//                                         fontSize: 18.0,
//                                         color: Color(0xff006265),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             onTap: () {
//                               setState(() {
//                                 d = Colors.redAccent;
//                               });
//                             },
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               );
//             }).toList(),
//           );
//         },
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/language.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Kanji',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'BeVietNam'),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
    );
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LanguagePage()));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xff006465),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 200.0,
                        width: 200.0,
                        child: Align(
                          child: Image.asset(
                            'assets/logo.png',
                            width: 200.0,
                            height: 200.0,
                          ),
                        ),
                      ),
                      CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        strokeWidth: 1,
                      )
                    ]))));
  }
}