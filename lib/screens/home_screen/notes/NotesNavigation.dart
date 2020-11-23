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

  Widget _buildListView() {
    return WatchBoxBuilder(
      box: notesBox,
      builder: (context, box) {
        Map<dynamic, dynamic> raw = box.toMap();
        List list = raw.values.toList();

        return ListView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) {
            NotesModel notesModel = list[index];
            return ListTile(
              title: Text(notesModel.title),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: (){
                      notesBox.deleteAt(index);
                    },
                  )
                ],
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ShowData(id: index,)));
              },
            );
          },
        );
      },
    );
  }
}
