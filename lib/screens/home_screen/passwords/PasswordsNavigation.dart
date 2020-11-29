import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:secret_keeper/Database/Hive/PasswordModel.dart';
import 'package:secret_keeper/screens/home_screen/passwords/ShowData.dart';

class PasswordsNavigation extends StatefulWidget {
  @override
  _PasswordsNavigationState createState() => _PasswordsNavigationState();
}

class _PasswordsNavigationState extends State<PasswordsNavigation> {
  var passwordBox = Hive.box<PasswordModel>('passwordBox');

  String _wName, _wAddress, _userName, _password, _notes, _id;

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
      valueListenable: passwordBox.listenable(),
      builder: (BuildContext context, Box<PasswordModel> box, _) {
        if (box.isEmpty) {
          return Text("No Data");
        } else {
          // Map<dynamic, dynamic> raw = passwordBox.toMap();
          // List list = raw.values.toList();
          final passwordList = passwordBox.values.toList().cast<PasswordModel>();
          passwordList
              .sort((a, b) => a.websiteName.compareTo(b.websiteName));
          return ListView.builder(
            shrinkWrap: true,
            itemCount: passwordList.length,
            itemBuilder: (context, index) {
              PasswordModel passwordModel = passwordList[index];
              return Dismissible(
                background: stackBehindDismiss(),
                key: ObjectKey(passwordModel.id),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  setState(() {
                    _wName = passwordModel.websiteName;
                    _wAddress = passwordModel.websiteAddress;
                    _userName = passwordModel.userName;
                    _password = passwordModel.password;
                    _notes = passwordModel.notes;
                    passwordBox.delete(passwordModel.id);
                  });
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Entry deleted!"),
                    action: SnackBarAction(
                      label: "UNDO",
                      textColor: Color(0xFFFFFFFF),
                      onPressed: () {
                        //To undo deletion
                        undoDeletion(
                          _wName, _wAddress, _userName, _password, _notes, _id);
                      },
                    ),
                  ));
                },
                child: ListTile(
                  title: Text(passwordModel.websiteName),
                  subtitle: Text(passwordModel.websiteAddress),
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

  void undoDeletion(wName, wAddress, userName, password, notes, id) {
    setState(
      () {
        PasswordModel passwordModel = PasswordModel(
            websiteName: wName,
            websiteAddress: wAddress,
            userName: userName,
            password: password,
            notes: notes,
            id: id);
        passwordBox.put(passwordModel.id, passwordModel);
      },
    );
  }
}
