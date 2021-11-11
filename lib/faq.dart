import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class Faq extends StatefulWidget {
  Faq({Key? key}) : super(key: key);

  @override
  _FaqState createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[400],
        title: Text(
          "FAQ",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('faq').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return ListView(
            children: snapshot.data!.docs.map((document) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.all(7),
                    child: ExpansionPanelList(
                      expandedHeaderPadding:
                          EdgeInsets.symmetric(horizontal: 23, vertical: 10),
                      animationDuration: Duration(milliseconds: 1000),
                      children: [
                        ExpansionPanel(
                          backgroundColor: Colors.white,
                          headerBuilder: (context, isExpanded) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 15),
                              child: RichText(
                                text: TextSpan(
                                    text: "${document['order']}.  ",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.greenAccent[400],
                                    ),
                                    children: [
                                      TextSpan(text: "${document['question']}")
                                    ]),
                              ),
                            );
                          },
                          body: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: ListTile(
                              title: Text(
                                "${document['answer']}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              contentPadding: EdgeInsets.fromLTRB(30, 0, 10, 5),
                              subtitle: Text(
                                "${document['url']}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          isExpanded: _expanded,
                          canTapOnHeader: true,
                        ),
                      ],
                      dividerColor: Colors.black,
                      expansionCallback: (panelIndex, isExpanded) {
                        _expanded = !_expanded;
                        setState(() {});
                      },
                    ),
                  )
                ]),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
