import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({Key key}) : super(key: key);

  @override
  _DiaryPageState createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF1E1A33),
        body: Column(
          children: [
            diaryField("Umum", "assets/images/ic_umum.svg", Color(0xFF6280FF)),
            RaisedButton(
              onPressed: () => {},
              child: Text("Simpan", style: TextStyle(fontSize: 14, color: Colors.white),),
              color: Color(0xFF6280FF),
            )
          ],
        ),
      ),
    );
  }

  Widget diaryHeader() {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text("24 Des 2021",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ))),
            ),
          ]),
    );
  }

  Widget diaryField(String title, String imgPath, Color backgroundColor) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        color: backgroundColor,
        child: Container(
          constraints: BoxConstraints(
              minHeight: 100, minWidth: double.infinity, maxHeight: 400),
          child: Column(
            children: [
              diaryHeader(),
              Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                            hintText: 'Tulis apa yang kamu pikirkan saat ini'),
                      ),
                    ),
                    Positioned(
                        right: 0,
                        bottom: 0,
                        child: Opacity(
                            opacity: 0.4,
                            child: SvgPicture.asset(imgPath,
                                width: 150, height: 150))),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
