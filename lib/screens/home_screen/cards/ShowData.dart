import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:secret_keeper/Database/Hive/CardModel.dart';

class ShowData extends StatefulWidget {
  final int id;

  const ShowData({Key key, this.id}) : super(key: key);

  @override
  _ShowDataState createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  bool _obscureTextCVV = true, _obscureTextPIN = true;

  TextEditingController cardNameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController expirationController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  var cardBox = Hive.box<CardModel>('cardBox');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Map<dynamic, dynamic> raw = cardBox.toMap();
    List list = raw.values.toList();
    CardModel cardModel = list[widget.id];
    cardNameController = TextEditingController(text: cardModel.cardName);
    cardNumberController = TextEditingController(text: cardModel.cardNumber);
    userNameController = TextEditingController(text: cardModel.userName);
    expirationController = TextEditingController(text: cardModel.expiration);
    cvvController = TextEditingController(text: cardModel.cvv);
    pinController = TextEditingController(text: cardModel.pin);
    notesController = TextEditingController(text: cardModel.note);
  }

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

  Widget CardName() {
    return TextFormField(
      controller: cardNameController,
      readOnly: true,
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
            color: Colors.grey.shade300,
          ),
        ),
      ),
    );
  }

  Widget CardNumber() {
    return TextFormField(
      controller: cardNumberController,
      readOnly: true,
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
            color: Colors.grey.shade300,
          ),
        ),
      ),
    );
  }

  Widget CardholderName() {
    return TextFormField(
      controller: userNameController,
      readOnly: true,
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
            color: Colors.grey.shade300,
          ),
        ),
      ),
    );
  }

  Widget Expiration() {
    return TextFormField(
      controller: expirationController,
      readOnly: true,
      decoration: InputDecoration(
        labelText: "Expiration",
        counterText: "",
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

  Widget CVV() {
    return TextFormField(
      controller: cvvController,
      readOnly: true,
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
            color: Colors.grey.shade300,
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
    );
  }

  Widget Pin() {
    return TextFormField(
      controller: pinController,
      obscureText: _obscureTextPIN,
      readOnly: true,
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
            color: Colors.grey.shade300,
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
        title: Text("Card Details"),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
