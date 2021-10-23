import 'package:DiaryApp/models/Diary.dart';
import 'package:DiaryApp/screen/SelectDiaryPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF1E1A33),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          coverView(),
          headerView(),
          //emptyView(),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                padding: EdgeInsets.only(bottom: 8.0),
                itemBuilder: (BuildContext context, int index) {
                  return diaryCard(Diary("17 Agustus 1945", "Umum", "happy",
                      "Itulah hari kemerdekaan kita, Hari merdeka nusa dan bangsa hari lahirnya bangsa indonesia merdeka, sekali merdeka tetap merdeka"));
                }
            ),
          )
        ]));
  }

  Widget coverView() {
    return Image.asset(
      "assets/images/header_image.png",
      fit: BoxFit.cover,
      width: double.infinity,
    );
  }

  Widget headerView() {
    return Padding(
      padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Hallo, Deni",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Row(
            children: [
              SvgPicture.asset("assets/images/ic_calendar.svg"),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: SvgPicture.asset("assets/images/ic_filter.svg"),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget diaryCard(Diary diary) {
    return GestureDetector(
      onTap: () =>
      {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SelectDiaryPage()),
        )
      },
      child: Card(
        margin: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        color: Colors.blue,
        child: Container(
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Opacity(
                      opacity: 0.5,
                      child: SvgPicture.asset("assets/images/ic_umum.svg"))),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          diary.date,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SvgPicture.asset(
                          "assets/images/ic_happy.svg",
                          width: 45,
                          height: 40,
                        )
                      ],
                    ),
                    Text(
                      diary.category,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        diary.content,
                        maxLines: 3,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget emptyView() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: SvgPicture.asset("assets/images/empty_diary.svg"),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
          child: Text(
            "Diary kamu masih kosong nih, yuk mulai menulis untuk mengekspresikan perasaan mu",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
