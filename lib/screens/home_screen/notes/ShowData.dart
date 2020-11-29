import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:secret_keeper/Database/Hive/NotesModel.dart';

class ShowData extends StatefulWidget {
  final int id;

  const ShowData({Key key, this.id}) : super(key: key);

  @override
  _ShowDataState createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  TextEditingController titleController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  var notesBox = Hive.box<NotesModel>('notesBox');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Map<dynamic, dynamic> raw = notesBox.toMap();
    List list = raw.values.toList();
    NotesModel notesModel = list[widget.id];
    titleController = TextEditingController(text: notesModel.title);
    notesController = TextEditingController(text: notesModel.note);
  }

  Widget Title() {
    return TextFormField(
      controller: titleController,
      readOnly: true,
      decoration: InputDecoration(
        labelText: "Title of note",
        labelStyle: TextStyle(fontSize: 14, color: Colors.grey.shade400),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
    );
  }

  Widget Note() {
    return TextFormField(
      controller: notesController,
      readOnly: true,
      decoration: InputDecoration(
        labelText: "Note",
        labelStyle: TextStyle(fontSize: 14, color: Colors.grey.shade400),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Notes"),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15,
                ),
                Title(),
                SizedBox(
                  height: 15,
                ),
                Note(),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
