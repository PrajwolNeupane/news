import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:url_launcher/url_launcher.dart';

class Description extends StatefulWidget {
  String? imgurl;
  String? title;
  String? content;
  String? description;
  String? date;
  String? link;
  String? id;
  Description(this.imgurl, this.title, this.content, this.description,
      this.date, this.link, this.id);

  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: HexColor("##ffffff"),
      appBar: appBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: h * 0.015),
        children: [
          topPart(widget.date.toString()),
          SizedBox(
            height: h * 0.03,
          ),
          tittlePart(widget.title.toString(), widget.id.toString()),
          image(widget.imgurl.toString()),
          content_part(widget.content.toString(), widget.description.toString(),
              widget.link.toString()),
          SizedBox(
            height: h * 0.02,
          ),
        ],
      ),
    );
  }

  Widget content_part(String content, String description, String link) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          content == "null"
              ? Text(
                  description,
                  style: TextStyle(
                      fontFamily: "NB",
                      color: Colors.grey[700],
                      fontSize: w * 0.06),
                )
              : Text(
                  content,
                  style: TextStyle(
                      fontFamily: "NB",
                      color: Colors.grey[700],
                      fontSize: w * 0.06),
                ),
          SizedBox(
            height: h * 0.03,
          ),
          Text("Read more",
              style: TextStyle(
                  fontFamily: "NB",
                  color: Colors.grey[700],
                  fontSize: w * 0.06)),
          SizedBox(
            height: h * 0.01,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.link,
                size: w * 0.08,
                color: HexColor("#6d43ec"),
              ),
              InkWell(
                onTap: () async {
                  final String url = link;
                  if (await canLaunch(url)) {
                    await launch(url);
                  }
                },
                child: AutoSizeText(
                  link,
                  style: TextStyle(
                      fontFamily: "NB",
                      color: HexColor("#6d43ec"),
                      fontSize: w * 0.05),
                  maxLines: 1,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget image(String imgurl) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return imgurl == "null"
        ? SizedBox(
            height: h * 0.04,
          )
        : Padding(
            padding: EdgeInsets.symmetric(vertical: h * 0.04),
            child: Container(
              width: w,
              height: h * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(h * 0.05)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(h * 0.05)),
                child: Image.network(
                  imgurl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
  }

  Widget tittlePart(String title, String id) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            title,
            style: TextStyle(
                color: HexColor("#484953"),
                fontFamily: "NEB",
                fontSize: w * 0.085,
                height: w * 0.0035),
            maxLines: 5,
          ),
          SizedBox(
            height: h * 0.01,
          ),
          Text(
            id,
            style: TextStyle(
                color: Colors.grey[500], fontFamily: "NB", fontSize: w * 0.05),
          )
        ],
      ),
    );
  }

  Widget topPart(String date) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: h * 0.07,
            width: w * 0.3,
            decoration: BoxDecoration(
                color: HexColor("#6d43ec"),
                borderRadius: BorderRadius.all(Radius.circular(h * 0.02))),
            child: Center(
              child: Text(
                "Latest",
                style: TextStyle(
                    color: HexColor("##ffffff"),
                    fontFamily: "NB",
                    fontSize: w * 0.05),
              ),
            ),
          ),
          Text(
            date,
            style: TextStyle(
                color: Colors.grey[500], fontFamily: "NB", fontSize: w * 0.05),
          )
        ],
      ),
    );
  }

  AppBar appBar() {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return AppBar(
      elevation: 0.0,
      automaticallyImplyLeading: false,
      backgroundColor: HexColor("##ffffff"),
      title: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: CircleAvatar(
          backgroundColor: Colors.grey[200],
          radius: h * 0.035,
          child: Icon(
            Icons.arrow_back,
            color: HexColor("#484953"),
          ),
        ),
      ),
      actions: [
        SizedBox(width: 20),
        CircleAvatar(
          backgroundColor: Colors.grey[200],
          radius: h * 0.035,
          child: Icon(
            Icons.share,
            color: HexColor("#484953"),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.grey[200],
          radius: h * 0.035,
          child: Icon(
            Icons.bookmark_outline_sharp,
            color: HexColor("#484953"),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.grey[200],
          radius: h * 0.035,
          child: Icon(
            Icons.more_vert,
            color: HexColor("#484953"),
          ),
        ),
      ],
    );
  }
}
