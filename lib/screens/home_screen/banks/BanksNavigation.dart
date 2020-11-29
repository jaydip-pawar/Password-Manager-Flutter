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
  String _title,
      _bName,
      _aNumber,
      _aType,
      _ifsc,
      _branchName,
      _branchAddress,
      _bNumber,
      _note;

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
      valueListenable: bankBox.listenable(),
      builder: (BuildContext context, Box<BankModel> box, _) {
        if (box.isEmpty) {
          return Text("No Data");
        } else {
          Map<dynamic, dynamic> raw = bankBox.toMap();
          List list = raw.values.toList();
          return ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              BankModel bankModel = list[index];
              return Dismissible(
                background: stackBehindDismiss(),
                key: ObjectKey(list[index]),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  setState(() {
                    _title = bankModel.title;
                    _bName = bankModel.bankName;
                    _aNumber = bankModel.accountNumber;
                    _aType = bankModel.accountType;
                    _ifsc = bankModel.ifsc;
                    _branchName = bankModel.branchName;
                    _branchAddress = bankModel.branchAddress;
                    _bNumber = bankModel.bankNumber;
                    _note = bankModel.note;
                    bankBox.deleteAt(index);
                  });
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Entry deleted!"),
                    action: SnackBarAction(
                      label: "UNDO",
                      textColor: Color(0xFFFFFFFF),
                      onPressed: () {
                        //To undo deletion
                        undoDeletion(_title, _bName, _aNumber, _aType, _ifsc,
                            _branchName, _branchAddress, _bNumber, _note);
                      },
                    ),
                  ));
                },
                child: ListTile(
                  title: Text(bankModel.bankName),
                  subtitle: Text(bankModel.accountNumber),
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

  void undoDeletion(title, bName, aNumber, aType, ifsc, branchName,
      branchAddress, bNumber, note) {
    setState(
      () {
        BankModel bankModel = BankModel(
            title: title,
            bankName: bName,
            accountNumber: aNumber,
            accountType: aType,
            ifsc: ifsc,
            branchName: branchName,
            branchAddress: branchAddress,
            bankNumber: bNumber,
            note: note);
        bankBox.add(bankModel);
      },
    );
  }
}
