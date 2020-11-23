import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:secret_keeper/Database/Hive/BankModel.dart';
import 'package:secret_keeper/screens/home_screen/banks/ShowData.dart';

class BanksNavigation extends StatefulWidget {
  @override
  _BanksNavigationState createState() => _BanksNavigationState();
}

class _BanksNavigationState extends State<BanksNavigation> {

  var bankBox = Hive.box<BankModel>('bankBox');

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
      box: bankBox,
      builder: (context, box) {
        Map<dynamic, dynamic> raw = box.toMap();
        List list = raw.values.toList();

        return ListView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) {
            BankModel bankModel = list[index];
            return ListTile(
              title: Text(bankModel.bankName),
              subtitle: Text(bankModel.accountNumber),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: (){
                      bankBox.deleteAt(index);
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
