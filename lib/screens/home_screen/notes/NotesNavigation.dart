import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:secret_keeper/Database/Hive/NotesModel.dart';
import 'package:secret_keeper/screens/home_screen/notes/ShowData.dart';

class NotesNavigation extends StatefulWidget {
  @override
  _NotesNavigationState createState() => _NotesNavigationState();
}

class _NotesNavigationState extends State<NotesNavigation> {
  var notesBox = Hive.box<NotesModel>('notesBox');
  String _title, _note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: _buildListView(),
          )
        ],
      ),
    );
  }

  Widget stackBehindDismiss() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20.0),
      color: Colors.red,
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }

  Widget _buildListView() {
    return ValueListenableBuilder(
      valueListenable: notesBox.listenable(),
      builder: (BuildContext context, Box<NotesModel> box, _) {
        if (box.isEmpty) {
          return Text("No Data");
        } else {
          Map<dynamic, dynamic> raw = notesBox.toMap();
          List list = raw.values.toList();
          return ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              NotesModel notesModel = list[index];
              return Dismissible(
                background: stackBehindDismiss(),
                key: ObjectKey(list[index]),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  setState(() {
                    _title = notesModel.title;
                    _note = notesModel.note;
                    notesBox.deleteAt(index);
                  });
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Entry deleted!"),
                    action: SnackBarAction(
                      label: "UNDO",
                      textColor: Color(0xFFFFFFFF),
                      onPressed: () {
                        //To undo deletion
                        undoDeletion(_title, _note);
                      },
                    ),
                  ));
                },
                child: ListTile(
                  title: Text(notesModel.title),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ShowData(
                          id: index,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        }
      },
    );
  }

  void undoDeletion(title, note) {
    setState(() {
      NotesModel notesModel = NotesModel(title: title, note: note);
      notesBox.add(notesModel);
    });
  }
}
