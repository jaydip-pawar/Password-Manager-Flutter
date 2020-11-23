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
      box: passwordBox,
      builder: (context, box) {
        Map<dynamic, dynamic> raw = box.toMap();
        List list = raw.values.toList();

        return ListView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) {
            PasswordModel passwordModel = list[index];
            return ListTile(
              title: Text(passwordModel.websiteName),
              subtitle: Text(passwordModel.websiteAddress),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      passwordBox.deleteAt(index);
                    },
                  )
                ],
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => ShowData(
                          id: index,
                        )));
              },
            );
          },
        );
      },
    );
  }
}
