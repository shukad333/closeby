import 'package:closeby/model/Professional.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class AllProfessionals extends StatefulWidget {
  const AllProfessionals({Key? key}) : super(key: key);

  @override
  _AllProfessionalsState createState() => _AllProfessionalsState();
}



class _AllProfessionalsState extends State<AllProfessionals> {

  @override
  void initState() {
    print("init");
    getCloseBy();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Close By"),
      ),
      body: ListView.builder(itemBuilder: _listViewItemBuilder,itemCount: items.length,)
    );
  }


  Widget _listViewItemBuilder(BuildContext context, int index){
    var newsDetail = this.items[index];
    return ListTile(
        contentPadding: EdgeInsets.all(10.0),
        // leading: _itemThumbnail(newsDetail),
        title: _itemTitle(newsDetail),
      subtitle: Text(newsDetail.professions![0].professionType!),
    );

  }

  // Widget _itemThumbnail(NewsDetail newsDetail){
  //   return Container(
  //     constraints: BoxConstraints.tightFor(width: 100.0),
  //     child: newsDetail.url == null ? null : Image.network(newsDetail.url, fit: BoxFit.fitWidth),
  //   );
  // }

  Widget _itemTitle(Professional professional){
    var n = professional.name!=null?professional.name:"Some Text";

    return Text(n!, style: TextStyle(fontStyle: FontStyle.italic));
  }

  late List<Professional> items = [];

  void getCloseBy() async {
    var url =
    Uri.http('10.0.2.2:5000', '/professionals', {'q': '{http}'});
    final http.Response response = await http.get(url);
    print(response.body);
    final Map<String,dynamic> responseData = json.decode(response.body);
    print(responseData);
    responseData['data'].forEach((pro) {
      final Professional professionals = Professional.fromJson(pro);
      setState(() {
        items.add(professionals);
      });
    });
  }
}




