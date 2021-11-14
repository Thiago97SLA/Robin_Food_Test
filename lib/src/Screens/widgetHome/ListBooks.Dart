import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:preuba_hewlett_packard/src/widget/Loading.dart';
import 'package:preuba_hewlett_packard/src/provider/DataApp.Dart';
import 'package:preuba_hewlett_packard/src/widget/FontStyleText.Dart';
import 'package:preuba_hewlett_packard/src/service/GetDescription.Dart';

class ListBooks extends StatelessWidget {
  final dynamic data;
  final bool autor;
  const ListBooks({Key key, this.data, this.autor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(autor);
    if (autor == true) {
      return AuthorContainer(data: data);
    } else {
      return Booksontainer(data: data);
    }
  }
}

class Booksontainer extends StatelessWidget {
  const Booksontainer({
    Key key,
    @required this.data,
  }) : super(key: key);

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Scrollbar(
        child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return showmoreinfobook(context, data[index]);
                      });
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            child: FadeInImage(
                              fit: BoxFit.cover,
                              placeholder:
                                  AssetImage('assets/Icon/loading.gif'),
                              image: NetworkImage(
                                  'https://covers.openlibrary.org/b/olid/${data[index]['cover_edition_key']}-S.jpg'),
                            )),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Color(0xFFC4C4C4), width: 1),
                            color: Color(0xFFC4C4C4),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        width: 70,
                        height: 70,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.55,
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            containerTitle(
                                context, data[index]['title'].toString()),
                            containerText(
                                context,
                                data[index]['author_name']
                                    .toString()
                                    .replaceAll('[', '')
                                    .replaceAll(']', '')),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AuthorContainer extends StatelessWidget {
  const AuthorContainer({
    Key key,
    @required this.data,
  }) : super(key: key);

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Scrollbar(
        child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return showmoreinfoAuthor(context, data[index]);
                      });
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            child: FadeInImage(
                              fit: BoxFit.cover,
                              placeholder:
                                  AssetImage('assets/Icon/loading.gif'),
                              image: NetworkImage(
                                  'https://covers.openlibrary.org/a/olid/${data[index]['key']}-S.jpg'),
                            )),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Color(0xFFC4C4C4), width: 1),
                            color: Color(0xFFC4C4C4),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        width: 70,
                        height: 70,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            containerTitle(context, data[index]['top_work']),
                            containerText(context, data[index]['name'])
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget showmoreinfoAuthor(BuildContext context, dynamic data) {
  return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      child: Stack(
        overflow: Overflow.visible,
        alignment: Alignment.topCenter,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 10, 15),
              child: SingleChildScrollView(
                  child: ListBody(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 10, 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            child: Image.network(
                              'https://covers.openlibrary.org/a/olid/${data['key']}-S.jpg',
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(
                                child: Icon(Icons.broken_image,
                                    color: Color(0xFF1C1066)),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xFFC4C4C4), width: 1),
                              color: Color(0xFFC4C4C4),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          width: 70,
                          height: 70,
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: FontWidget(
                                      overflow: TextOverflow.ellipsis,
                                      text: data['name'],
                                      size: 20,
                                      color: 0xFF000000,
                                      fontWeight: FontWeight.w700,
                                      textAlign: TextAlign.center),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: FontWidget(
                                      text: data['top_work'],
                                      size: 18,
                                      color: 0xFF000000,
                                      fontWeight: FontWeight.w600,
                                      textAlign: TextAlign.center),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  containerTitleDialog(context, 'Fecha de nacimiento'),
                  containerTextDialog(context, data['birth_date'].toString()),
                  containerTitleDialog(context, 'Temas principales'),
                  containerTextDialog(
                      context,
                      data['top_subjects']
                          .toString()
                          .replaceAll('[', '')
                          .replaceAll(']', '')),
                  containerTitleDialog(context, 'Nombres alternativos'),
                  containerTextDialog(
                      context,
                      data['alternate_names']
                          .toString()
                          .replaceAll('[', '')
                          .replaceAll(']', '')),
                ],
              )),
            ),
          ),
        ],
      ));
}

Widget showmoreinfobook(BuildContext context, dynamic book) {
  final data = Provider.of<DataApp>(context, listen: false);
  String urlimg =
      'https://covers.openlibrary.org/b/olid/${book['cover_edition_key']}-S.jpg';
  return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      child: Stack(
        overflow: Overflow.visible,
        alignment: Alignment.topCenter,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 10, 15),
              child: SingleChildScrollView(
                  child: ListBody(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 10, 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            child: Image.network(
                              urlimg,
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(
                                child: Icon(Icons.broken_image,
                                    color: Color(0xFF1C1066)),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xFFC4C4C4), width: 1),
                              color: Color(0xFFC4C4C4),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          width: 70,
                          height: 70,
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  child: FontWidget(
                                      overflow: TextOverflow.ellipsis,
                                      text: book['author_name']
                                          .toString()
                                          .replaceAll('[', '')
                                          .replaceAll(']', ''),
                                      size: 20,
                                      color: 0xFF000000,
                                      fontWeight: FontWeight.w700,
                                      textAlign: TextAlign.center),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  child: FontWidget(
                                      text: book['title'].toString(),
                                      size: 18,
                                      color: 0xFF000000,
                                      fontWeight: FontWeight.w600,
                                      textAlign: TextAlign.center),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  FutureBuilder(
                    future: getDescription(context, book['key']),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      return snapshot.hasData
                          ? Container(
                              child: Column(
                                children: [
                                  //containerTitleDialog(context, 'Descripcion'),
                                  //continerDescrip(snapshot.data),
                                  containerTitleDialog(
                                      context, 'Fecha de Publicación'),
                                  containerTextDialog(context,
                                      book['first_publish_year'].toString()),
                                  containerTitleDialog(
                                      context, 'Lugares de Publicación'),
                                  containerTextDialog(
                                      context,
                                      book['publish_place']
                                          .toString()
                                          .replaceAll('[', '')
                                          .replaceAll(']', '')),
                                  containerTitleDialog(
                                      context, 'Contribuyentes'),
                                  containerTextDialog(
                                      context,
                                      book['contributor']
                                          .toString()
                                          .replaceAll('[', '')
                                          .replaceAll(']', '')),
                                  containerTitleDialog(
                                      context, 'Idiomas de Publicación'),
                                  containerTextDialog(
                                      context,
                                      book['language']
                                          .toString()
                                          .replaceAll('[', '')
                                          .replaceAll(']', '')),
                                ],
                              ),
                            )
                          : loadinginfo();
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      Flushbar(
                        backgroundColor: Color(0xFF1F1F1F),
                        message: "Se agrego a favoritos",
                        duration: Duration(seconds: 2),
                      )..show(context);
                      List listdata = data.dataAppfv;
                      Map<String, String> datafv = {
                        'title': book['title'].toString(),
                        'author_name': book['author_name']
                            .toString()
                            .replaceAll('[', '')
                            .replaceAll(']', ''),
                        'imagen': urlimg
                      };
                      listdata.add(datafv);
                      listdata = listdata.toSet().toList();
                      data.setdataAppfv = listdata;
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Color(0xFF192938),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: FontWidget(
                          text: 'Agregar a favoritos',
                          size: 18,
                          color: 0xFFFFFFFF,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.center),
                    ),
                  )
                ],
              )),
            ),
          ),
        ],
      ));
}

Widget containerTextDialog(BuildContext context, String text) {
  if (text == 'null') {
    text = 'No registrado';
  }
  return Container(
    width: MediaQuery.of(context).size.width * 0.8,
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: FontWidget(
        text: text,
        size: 14,
        color: 0xFF000000,
        fontWeight: FontWeight.w500,
        textAlign: TextAlign.start),
  );
}

Widget containerTitleDialog(BuildContext context, String text) {
  if (text == 'null') {
    text = 'No registrado';
  }
  return Container(
    width: MediaQuery.of(context).size.width * 0.8,
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: FontWidget(
        text: text,
        size: 16,
        color: 0xFF000000,
        fontWeight: FontWeight.w700,
        textAlign: TextAlign.start),
  );
}

Widget containerTitle(BuildContext context, String text) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.6,
    child: FontWidget(
        text: text,
        size: 18,
        color: 0xFF000000,
        fontWeight: FontWeight.w700,
        textAlign: TextAlign.start),
  );
}

Widget containerText(BuildContext context, String text) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.6,
    child: FontWidget(
        text: text,
        size: 14,
        color: 0xFF000000,
        fontWeight: FontWeight.w500,
        textAlign: TextAlign.start),
  );
}

Widget continerDescrip(dynamic data) {
  String text;
  try {
    text = data;
  } catch (e) {}
  return Container(
    child: FontWidget(
        text: text,
        size: 16,
        color: 0xFF000000,
        fontWeight: FontWeight.w500,
        textAlign: TextAlign.center),
  );
}
