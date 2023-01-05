import 'package:flutter/material.dart';
import 'package:uas_sistem_aplikasi_lintas_platform/data_uwg.dart';
import 'package:uas_sistem_aplikasi_lintas_platform/detail_page.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  _buatListUwg() async {
    for (var i = 0; i < uwg.length; i++) {
      final uwgnya = uwg[i];
      final String nama = uwgnya['nama'];
      final String gambar = uwgnya['gambar'];
      final String deskripsi = uwgnya['deskripsi'];

      listDataUwg.add(
        Container(
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(nama, gambar, deskripsi);
              }));
            },
            child: Card(
              color: Color(0xffded5b7),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Image.asset(
                      gambar,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(nama)
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _buatListUwg();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f7f7),
      appBar: AppBar(
          backgroundColor: Color(0xfff4f1ed),
          title: Text(
            'UWG APP',
            style: TextStyle(color: Colors.brown),
          )),
      body: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        childAspectRatio: 1,
        children: listDataUwg,
      ),
    );
  }
}
