import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:secret_keeper/Database/Hive/PasswordModel.dart';

class ShowData extends StatefulWidget {
  final int id;

  const ShowData({Key key, this.id}) : super(key: key);
  @override
  _ShowDataState createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  bool _obscureText = true;

  TextEditingController websiteNameController = TextEditingController();
  TextEditingController websiteAddressController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  var passwordBox = Hive.box<PasswordModel>('passwordBox');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Map<dynamic, dynamic> raw = passwordBox.toMap();
    List list = raw.values.toList();
    PasswordModel passwordModel = list[widget.id];
    websiteNameController =
        TextEditingController(text: passwordModel.websiteName);
    websiteAddressController =
        TextEditingController(text: passwordModel.websiteAddress);
    userNameController = TextEditingController(text: passwordModel.userName);
    passwordController = TextEditingController(text: passwordModel.password);
    notesController = TextEditingController(text: passwordModel.notes);
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget WebsiteName() {
    return TextFormField(
      controller: websiteNameController,
      readOnly: true,
      decoration: InputDecoration(
        labelText: "Name of website",
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

  Widget WebsiteAddress() {
    return TextFormField(
      controller: websiteAddressController,
      readOnly: true,
      decoration: InputDecoration(
        labelText: "Website address",
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

  Widget UserName() {
    return TextFormField(
      controller: userNameController,
      readOnly: true,
      decoration: InputDecoration(
        labelText: "Username / Email",
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

  Widget Password() {
    return TextFormField(
      controller: passwordController,
      obscureText: _obscureText,
      readOnly: true,
      decoration: InputDecoration(
        labelText: "Password",
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
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey.shade600,
          ),
          onPressed: _toggle,
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
        title: Text("Passwords"),
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
                  height: 20,
                ),
                WebsiteName(),
                SizedBox(
                  height: 20,
                ),
                WebsiteAddress(),
                SizedBox(
                  height: 20,
                ),
                UserName(),
                SizedBox(
                  height: 20,
                ),
                Password(),
                SizedBox(
                  height: 20,
                ),
                Note(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
