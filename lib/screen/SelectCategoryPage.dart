import 'package:DiaryApp/screen/DiaryPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SelectCategoryPage extends StatefulWidget {
  const SelectCategoryPage({Key key}) : super(key: key);

  @override
  _SelectCategoryPageState createState() => _SelectCategoryPageState();
}

class _SelectCategoryPageState extends State<SelectCategoryPage> {
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
          crossAxisCount: 2,
          childAspectRatio: 1.7,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          children: [
            categoryCard(
                "Umum", "assets/images/ic_umum.svg", Color(0xFF6280FF)),
            categoryCard(
                "Cinta", "assets/images/ic_cinta.svg", Color(0xFFFA91A5)),
            categoryCard(
                "Keluarga", "assets/images/ic_keluarga.svg", Color(0xFF82C168)),
            categoryCard(
                "Teman", "assets/images/ic_teman.svg", Color(0xFF11CBE0)),
            categoryCard(
                "Pendidikan", "assets/images/ic_pendidikan.svg", Color(0xFF6BC8ABB)),
            categoryCard(
                "Pekerjaan", "assets/images/ic_pekerjaan.svg", Color(0xFFFFB55E))
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
        "Tentang apa yang ingin kamu tulis ?",
        style: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget categoryCard(String title, String imgPath, Color backgroundColor) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DiaryPage()),
        )
      },
      child: Card(
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(imgPath),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
