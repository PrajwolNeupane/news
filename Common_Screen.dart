import 'package:flutter/material.dart';
import 'package:global_news/Screens/Description.dart';
import 'package:global_news/Services/List_Module.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:auto_size_text/auto_size_text.dart';


class Common_Screen extends StatefulWidget {
  String? type;
  Common_Screen(this.type);

  @override
  _Common_ScreenState createState() => _Common_ScreenState();
}

class _Common_ScreenState extends State<Common_Screen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getListData(widget.type.toString()),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(
                color: HexColor("#6d43ec"),
              ),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return custom_box(
                      snapshot.data[index].title,
                      snapshot.data[index].date,
                      snapshot.data[index].imgurl,
                      snapshot.data[index].content.toString(),
                      snapshot.data[index].description.toString(),
                      snapshot.data[index].link.toString(),
                      snapshot.data[index].id.toString());
                });
          }
        });
  }

  Widget custom_box(String title, String date, String imgurl, String content,
      String description, String link, String id) {
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Description(
                      imgurl, title, content, description, date, link, id)));
        },
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                color: HexColor("#6d43ec"),
                borderRadius: BorderRadius.all(
                  Radius.circular(MediaQuery.of(context).size.height * 0.03),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.04,
                    horizontal: MediaQuery.of(context).size.height * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "NEB",
                          fontSize: MediaQuery.of(context).size.height * 0.05,
                          height: MediaQuery.of(context).size.height * 0.0017),
                      maxLines: 3,
                    ),
                    Text(date,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "NB",
                            fontSize:
                                MediaQuery.of(context).size.height * 0.03)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
