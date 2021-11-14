import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:preuba_hewlett_packard/src/widget/Drawer.Dart';
import 'package:preuba_hewlett_packard/src/provider/DataApp.Dart';
import 'package:preuba_hewlett_packard/src/service/GetBooks.Dart';
import 'package:preuba_hewlett_packard/src/widget/Backgrounp.Dart';
import 'package:preuba_hewlett_packard/src/widget/FontStyleText.Dart';
import 'package:preuba_hewlett_packard/src/Screens/widgetHome/ListBooks.Dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String word;
  bool autor = false;
  bool libro = true;

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataApp>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF192938),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: FontWidget(
                      text: 'Search your book'.toUpperCase(),
                      size: 25,
                      color: 0xFFFFFFFF,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.center),
                ),
                Image.asset(
                  'assets/Icon/libreria-digital.png',
                  scale: 12,
                ),
              ],
            )
          ],
        ),
      ),
      drawer: DrawerApp(),
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            Background('assets/background/Home.png'),
            Scrollbar(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 15, 20, 5),
                        decoration: BoxDecoration(
                            color: Color(0x8fffffff),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border:
                                Border.all(color: Color(0xFF192938), width: 3)),
                        child: TextFormField(
                          validator: (value) => !value.contains(
                            RegExp(r'^[a-zA-Z0-9 ]*$'),
                          )
                              ? 'Caracter invalidos'
                              : null,
                          onSaved: (value) => word = value,
                          decoration: InputDecoration(
                            icon: Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Icon(Icons.menu_book_rounded),
                            ),
                            hintText:
                                autor ? 'Buscar Autores' : 'Buscar Libros',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Container(
                                  child: FontWidget(
                                      text: 'Autores',
                                      size: 20,
                                      color: 0xFF000000,
                                      fontWeight: FontWeight.w500,
                                      textAlign: TextAlign.center),
                                ),
                                Checkbox(
                                  activeColor: Color(0xff1C1066),
                                  value: this.autor,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.autor = value;
                                      this.libro = !value;
                                      data.setstatusload = false;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  child: FontWidget(
                                      text: 'Libros',
                                      size: 20,
                                      color: 0xFF000000,
                                      fontWeight: FontWeight.w500,
                                      textAlign: TextAlign.center),
                                ),
                                Checkbox(
                                  activeColor: Color(0xff1C1066),
                                  value: this.libro,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.libro = value;
                                      this.autor = !value;
                                      data.setstatusload = false;
                                    });
                                  },
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                final form = _formKey.currentState;
                                if (form.validate()) {
                                  print(autor);
                                  form.save();
                                  setState(() {});
                                  getBooks(context, word, autor);
                                }
                              },
                              child: Container(
                                  width: 90,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF192938),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                    child: FontWidget(
                                        text: 'Buscar',
                                        size: 20,
                                        color: 0xFFFFFFFF,
                                        fontWeight: FontWeight.w500,
                                        textAlign: TextAlign.center),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Consumer<DataApp>(
                    builder: (context, isLoading, __) {
                      if (data.statusload == true)
                        return Consumer<DataApp>(
                            builder: (context, dataApp, _) {
                          return ListBooks(data: data.dataApp, autor: autor);
                        });
                      else
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: Center(
                              child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.15,
                            ),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                color: Color(0xAfffffff),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                border: Border.all(
                                    color: Color(0xFFc4c4c4), width: 3)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: FontWidget(
                                      text: 'Esperando busqueda',
                                      size: 20,
                                      color: 0xFF0000000,
                                      fontWeight: FontWeight.w500,
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Image.asset(
                                    'assets/Icon/books.png',
                                    scale: 10,
                                  ),
                                ),
                              ],
                            ),
                          )),
                        );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
