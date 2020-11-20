import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:secret_keeper/database/card_model.dart';
import 'package:secret_keeper/main.dart';

class CardInput extends StatefulWidget {
  @override
  _CardInputState createState() => _CardInputState();
}

class _CardInputState extends State<CardInput> {

  //Reference of Box
  //Box<CardModel> cardBox;

  bool _obscureTextCVV = true, _obscureTextPIN = true;
  int checkField;

  TextEditingController cardNameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController expirationController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   cardBox = Hive.box<CardModel>(CardBoxName);
  // }

  void _toggleCVV() {
    setState(() {
      _obscureTextCVV = !_obscureTextCVV;
    });
  }

  void _togglePIN() {
    setState(() {
      _obscureTextPIN = !_obscureTextPIN;
    });
  }
  //
  // void addDataToHive(){
  //   final String cardNameInput = cardNameController.text;
  //   final String cardNumberInput = cardNumberController.text;
  //   final String userNameInput = userNameController.text;
  //   final String expirationInput = expirationController.text;
  //   final String cvvInput = userNameController.text;
  //   final String pinInput = pinController.text;
  //   final String notesInput = notesController.text;
  //
  //   CardModel cardModel = CardModel(cardName: cardNameInput, cardNumber: cardNumberInput, userName: userNameInput,
  //   expiration: expirationInput, cvv: cvvInput, pin: pinInput, note: notesInput);
  //
  //   cardBox.add(cardModel);
  //
  //   Navigator.pop(context);
  // }

  Widget CardName() {
    return TextFormField(
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        labelText: "Custom Card Name",
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
            color: Colors.red,
          ),
        ),
      ),
      textInputAction: TextInputAction.next,
    );
  }

  Widget CardNumber() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Card Number",
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
            color: Colors.red,
          ),
        ),
      ),
      textInputAction: TextInputAction.next,
    );
  }

  Widget CardholderName() {
    return TextFormField(
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        labelText: "Cardholder Name",
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
            color: Colors.red,
          ),
        ),
      ),
      textInputAction: TextInputAction.next,
    );
  }

  Widget Expiration() {
    return TextFormField(
      keyboardType: TextInputType.datetime,
      maxLength: 5,
      decoration: InputDecoration(
        labelText: "Expiration",
        counterText: "",
        hintText: "MM/DD",
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
            color: Colors.red,
          ),
        ),
      ),
      textInputAction: TextInputAction.next,
    );
  }

  Widget CVV() {
    return TextFormField(
      keyboardType: TextInputType.datetime,
      maxLength: 3,
      obscureText: _obscureTextCVV,
      decoration: InputDecoration(
        counterText: "",
        labelText: "CVV",
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
            color: Colors.red,
          ),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureTextCVV ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey.shade600,
          ),
          onPressed: _toggleCVV,
        ),
      ),
      textInputAction: TextInputAction.next,
    );
  }

  Widget Pin() {
    return TextFormField(
      keyboardType: TextInputType.number,
      obscureText: _obscureTextPIN,
      decoration: InputDecoration(
        labelText: "Pin",
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
            color: Colors.red,
          ),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureTextPIN ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey.shade600,
          ),
          onPressed: _togglePIN,
        ),
      ),
      textInputAction: TextInputAction.next,
    );
  }

  Widget Note() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLength: 250,
      textCapitalization: TextCapitalization.sentences,
      maxLines: null,
      decoration: InputDecoration(
        counterText: "",
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
            color: Colors.red,
          ),
        ),
      ),
      textInputAction: TextInputAction.newline,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Card Details"),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15,
                ),
                CardName(),
                SizedBox(
                  height: 15,
                ),
                CardNumber(),
                SizedBox(
                  height: 15,
                ),
                CardholderName(),
                SizedBox(
                  height: 15,
                ),
                Expiration(),
                SizedBox(
                  height: 15,
                ),
                CVV(),
                SizedBox(
                  height: 15,
                ),
                Pin(),
                SizedBox(
                  height: 15,
                ),
                Note(),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: FlatButton(
                    onPressed: () {
                      //addDataToHive();
                    },
                    padding: EdgeInsets.all(0),
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xffff5f6d),
                            Color(0xffff5f6d),
                            Color(0xffffc371),
                          ],
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        constraints: BoxConstraints(
                            maxWidth: double.infinity, minHeight: 50),
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
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
