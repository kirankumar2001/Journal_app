import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:journal_app/componants.dart';
import '../constants.dart';
import 'add_entry_screen.dart';

class ReadEntryList extends StatefulWidget {
  final List<QueryDocumentSnapshot> docs;
  const ReadEntryList({super.key, required this.docs});

  @override
  State<ReadEntryList> createState() => _ReadEntryListState();
}

class _ReadEntryListState extends State<ReadEntryList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: kScreenBg,
          child: widget.docs.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    JournyTitle(),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Please Add Entry',
                          style: KButtonText,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    JournyButton(
                      label: 'Add Entry',
                      fn: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddEntryScreen(),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    JournyTitle(),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return EntryTile(
                            title: widget.docs.elementAt(index)['Title'],
                            entry: widget.docs.elementAt(index)['Entry'],
                            date: widget.docs.elementAt(index)['Date'],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: widget.docs.length,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    JournyButton(
                        label: 'BACK',
                        fn: () {
                          Navigator.pop(context);
                        }),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
