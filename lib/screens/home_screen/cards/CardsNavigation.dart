import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:secret_keeper/Database/Hive/CardModel.dart';
import 'package:secret_keeper/screens/home_screen/cards/ShowData.dart';

class CardsNavigation extends StatefulWidget {
  @override
  _CardsNavigationState createState() => _CardsNavigationState();
}

class _CardsNavigationState extends State<CardsNavigation> {
  var cardBox = Hive.box<CardModel>('cardBox');

  String _cName, _cNumber, _uName, _expiration, _cvv, _pin, _note;

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
      valueListenable: cardBox.listenable(),
      builder: (BuildContext context, Box<CardModel> box, _) {
        if(box.isEmpty){
          return Text("No Data");
        }
        else{
          Map<dynamic, dynamic> raw = cardBox.toMap();
          List list = raw.values.toList();
          return ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              CardModel cardModel = list[index];
              return Dismissible(
                background: stackBehindDismiss(),
                key: ObjectKey(list[index]),
                direction: DismissDirection.endToStart,
                onDismissed: (direction){
                  setState(() {
                    _cName = cardModel.cardName;
                    _cNumber = cardModel.cardNumber;
                    _uName = cardModel.userName;
                    _expiration = cardModel.expiration;
                    _cvv = cardModel.cvv;
                    _pin = cardModel.pin;
                    _note = cardModel.note;
                    cardBox.deleteAt(index);
                  });
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(
                    content: Text("Entry deleted!"),
                    action: SnackBarAction(
                      label: "UNDO",
                      textColor: Color(0xFFFFFFFF),
                      onPressed: () {
                        //To undo deletion
                        undoDeletion(_cName, _cNumber, _uName, _expiration, _cvv, _pin, _note);
                      },
                    ),
                  ));
                },
                child: ListTile(
                  title: Text(cardModel.cardName),
                  subtitle: Text(cardModel.userName),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
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

  void undoDeletion(cName, cNumber, uName, expiration, cvv, pin, note){
    setState((){
      CardModel cardModel = CardModel(
          cardName: cName,
        cardNumber: cNumber,
        userName: uName,
        expiration: expiration,
        cvv: cvv,
        pin: pin,
        note: note
      );
      cardBox.add(cardModel);
    });
  }
}
