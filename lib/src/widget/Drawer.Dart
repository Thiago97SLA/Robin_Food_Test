import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:preuba_hewlett_packard/src/provider/DataApp.Dart';
import 'package:preuba_hewlett_packard/src/widget/FontStyleText.Dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Consumer<DataApp>(builder: (context, data, _) {
          return ListView(
            shrinkWrap: true,
            primary: false,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: FontWidget(
                    text: 'Favoritos',
                    size: 20,
                    color: 0xFF0000000,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.center),
              ),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: data.dataAppfv.length,
                itemBuilder: (BuildContext context, int index) {
                  print(data.dataAppfv[index]['title']);
                  return Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Row(
                      children: [
                        Container(
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              child: FadeInImage(
                                fit: BoxFit.cover,
                                placeholder:
                                    AssetImage('assets/Icon/loading.gif'),
                                image: NetworkImage(
                                    data.dataAppfv[index]['imagen']),
                              )),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xFFC4C4C4), width: 1),
                              color: Color(0xFFC4C4C4),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          width: 50,
                          height: 50,
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                width: MediaQuery.of(context).size.width / 2,
                                child: FontWidget(
                                    text: data.dataAppfv[index]['title'],
                                    size: 18,
                                    color: 0xFF0000000,
                                    fontWeight: FontWeight.w500,
                                    textAlign: TextAlign.start),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                width: MediaQuery.of(context).size.width / 2,
                                child: FontWidget(
                                    text: data.dataAppfv[index]['author_name'],
                                    size: 16,
                                    color: 0xFF0000000,
                                    fontWeight: FontWeight.w500,
                                    textAlign: TextAlign.start),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
              if (data.dataAppfv.toString() == '[]')
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: FontWidget(
                          text: 'Debes agregar libros a tu lista de favoritos',
                          size: 16,
                          color: 0xFF0000000,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start),
                    ),
                    Container(
                        width: 40,
                        height: 40,
                        child: Image.asset('assets/Icon/booksnew.png'))
                  ],
                )),
              if (data.dataAppfv.toString() != '[]')
                GestureDetector(
                  onTap: () {
                    Flushbar(
                      backgroundColor: Color(0xFF1F1F1F),
                      message: "Se eliminaron todos los libros",
                      duration: Duration(seconds: 2),
                    )..show(context);
                    List listdata = data.dataAppfv;
                    listdata = [];
                    data.setdataAppfv = listdata;
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: FontWidget(
                        text: 'Borrar lista',
                        size: 18,
                        color: 0xFFFFFFFF,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center),
                  ),
                )
            ],
          );
        }),
      ),
    );
  }
}
