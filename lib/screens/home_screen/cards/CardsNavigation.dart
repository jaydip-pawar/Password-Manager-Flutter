import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:secret_keeper/Database/Hive/CardModel.dart';
import 'package:secret_keeper/screens/home_screen/passwords/ShowData.dart';

class CardsNavigation extends StatefulWidget {
  @override
  _CardsNavigationState createState() => _CardsNavigationState();
}

class _CardsNavigationState extends State<CardsNavigation> {
  var cardBox = Hive.box<CardModel>('cardBox');

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
      box: cardBox,
      builder: (context, box) {
        Map<dynamic, dynamic> raw = box.toMap();
        List list = raw.values.toList();

        return ListView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) {
            CardModel cardModel = list[index];
            return ListTile(
              title: Text(cardModel.cardName),
              subtitle: Text(cardModel.cardNumber),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      cardBox.deleteAt(index);
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
