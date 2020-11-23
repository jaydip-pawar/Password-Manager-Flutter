import 'package:flutter/material.dart';
import 'package:secret_keeper/screens/home_screen/banks/BanksNavigation.dart';
import 'package:secret_keeper/screens/home_screen/cards/CardsNavigation.dart';
import 'package:secret_keeper/screens/home_screen/notes/NotesNavigation.dart';
import 'package:secret_keeper/screens/home_screen/passwords/PasswordsNavigation.dart';
import 'package:secret_keeper/screens/input_screen/bank_input/BankInput.dart';
import 'package:secret_keeper/screens/input_screen/card_input/CardInput.dart';
import 'package:secret_keeper/screens/input_screen/note_input/NoteInput.dart';
import 'package:secret_keeper/screens/input_screen/password_input/PasswordInput.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Properties

  int currentTab = 0;
  final List<Widget> screens = [
    PasswordsNavigation(),
    CardsNavigation(),
    BanksNavigation(),
    NotesNavigation(),
  ];

  //Active Page (Tab)

  Widget currentScreen = PasswordsNavigation();
  final PageStorageBucket bucket = PageStorageBucket();
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Row(children: [
    Text(
      "SECRET",
      style: TextStyle(color: Colors.orange[900], fontWeight: FontWeight.w700),
    ),
    Text(
      "KEEPER",
      style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w700),
    ),
  ]);

  void checkNavigation(){
    if(currentTab == 0)
      Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordInput()));
    else if(currentTab == 1)
      Navigator.push(context, MaterialPageRoute(builder: (context) => CardInput()));
    else if(currentTab == 2)
      Navigator.push(context, MaterialPageRoute(builder: (context) => BankInput()));
    else
      Navigator.push(context, MaterialPageRoute(builder: (context) => NoteInput()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: cusSearchBar,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (this.cusIcon.icon == Icons.search) {
                  this.cusIcon = Icon(Icons.cancel, color: Colors.black87);
                  this.cusSearchBar = Container(
                    height: 50,
                    child: TextField(
                      textInputAction: TextInputAction.go,
                      autofocus: true,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Search here"),
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  );
                } else {
                  this.cusIcon = Icon(Icons.search);
                  this.cusSearchBar = Row(children: [
                    Text(
                      "SECRET",
                      style: TextStyle(
                          color: Colors.orange[900],
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "KEEPER",
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.w700),
                    ),
                  ]);
                }
              });
            },
            icon: cusIcon,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),

      //FAB Button

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.orangeAccent,
        onPressed: () {
          checkNavigation();
        },
      ),

      //FAB Position

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      //Bottom App Bar

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = PasswordsNavigation();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.paste_sharp,
                          color: currentTab == 0 ? Colors.orange : Colors.grey,
                        ),
                        Text(
                          'Passwords',
                          style: TextStyle(
                            color:
                                currentTab == 0 ? Colors.orange : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = CardsNavigation();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.credit_card_rounded,
                          color: currentTab == 1 ? Colors.orange : Colors.grey,
                        ),
                        Text(
                          'Cards',
                          style: TextStyle(
                            color:
                                currentTab == 1 ? Colors.orange : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = BanksNavigation();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.food_bank_outlined,
                          color: currentTab == 2 ? Colors.orange : Colors.grey,
                        ),
                        Text(
                          'Banks',
                          style: TextStyle(
                            color:
                                currentTab == 2 ? Colors.orange : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = NotesNavigation();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.notes,
                          color: currentTab == 3 ? Colors.orange : Colors.grey,
                        ),
                        Text(
                          'Notes',
                          style: TextStyle(
                            color:
                                currentTab == 3 ? Colors.orange : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
