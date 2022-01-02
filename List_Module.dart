import 'dart:convert';
import 'package:http/http.dart' as http;

class list_module {
  String? title;
  String? date;
  String? imgurl;
  String? content;
  String? description;
  String? link;
  String? id;
  list_module(this.title, this.date, this.imgurl, this.content,
      this.description, this.link, this.id);
}

Future getListData(String type) async {
  List<list_module> all_list = [];
  var responce = await http.get(Uri.parse(
      "https://newsdata.io/api/1/news?apikey=pub_3209edd13e0fc5e5e69b59c64091ac7c5c36&language=en&category=$type"));
  var jsonBody = jsonDecode(responce.body);
  var jsonResult = jsonBody["results"];
  for (var u in jsonResult) {
    all_list.add(list_module(
        u["title"],
        u["pubDate"],
        u["image_url"].toString(),
        u["full_description"],
        u["description"],
        u["link"],
        u["source_id"]));
  }
  return all_list;
}
