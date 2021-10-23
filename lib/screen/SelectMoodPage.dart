import 'package:DiaryApp/screen/SelectCategoryPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SelectMoodPage extends StatefulWidget {
  const SelectMoodPage({Key key}) : super(key: key);

  @override
  _SelectMoodPageState createState() => _SelectMoodPageState();
}

class _SelectMoodPageState extends State<SelectMoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1A33),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        coverView(),
        headerView(),
        //emptyView(),
        gridCategories()
      ]),
    );
  }

  Widget gridCategories() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            moodCard("Sedih", "assets/images/ic_sad.svg"),
            moodCard("Marah", "assets/images/ic_angry.svg"),
            moodCard("Takut", "assets/images/ic_afraid.svg"),
            moodCard("Kaget", "assets/images/ic_surprise.svg"),
            moodCard("Senang", "assets/images/ic_happy.svg"),
          ],
        ),
      ),
    );
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
      child: Text(
        "Gimana perasaan kamu saat ini ?",
        style: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget moodCard(String title, String imgPath) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SelectCategoryPage()),
        )
      },
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF4C485C)),
                  shape: BoxShape.circle),
              child: SvgPicture.asset(imgPath)),
          Text(title, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500))
        ],
      ),
    );
  }
}
