import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:secret_keeper/Database/Hive/BankModel.dart';

class ShowData extends StatefulWidget {
  final int id;

  const ShowData({Key key, this.id}) : super(key: key);

  @override
  _ShowDataState createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {

  TextEditingController titleController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController accountTypeController = TextEditingController();
  TextEditingController ifscController = TextEditingController();
  TextEditingController branchNameController = TextEditingController();
  TextEditingController branchAddressController = TextEditingController();
  TextEditingController bankNumberController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  var bankBox = Hive.box<BankModel>('bankBox');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Map<dynamic, dynamic> raw = bankBox.toMap();
    List list = raw.values.toList();
    BankModel bankModel = list[widget.id];
    titleController = TextEditingController(text: bankModel.title);
    bankNameController = TextEditingController(text: bankModel.bankName);
    accountNumberController = TextEditingController(text: bankModel.accountNumber);
    accountTypeController = TextEditingController(text: bankModel.accountType);
    ifscController = TextEditingController(text: bankModel.ifsc);
    branchNameController = TextEditingController(text: bankModel.branchName);
    branchAddressController = TextEditingController(text: bankModel.branchAddress);
    bankNumberController = TextEditingController(text: bankModel.bankNumber);
    notesController = TextEditingController(text: bankModel.note);
  }

  Widget Title() {
    return TextFormField(
      controller: titleController,
      readOnly: true,
      decoration: InputDecoration(
        labelText: "Title",
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

  Widget BankName() {
    return TextFormField(
      controller: bankNameController,
      readOnly: true,
      decoration: InputDecoration(
        labelText: "Bank Name",
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

  Widget AccountNumber() {
    return TextFormField(
      controller: accountNumberController,
      readOnly: true,
      decoration: InputDecoration(
        labelText: "Account Number",
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

  Widget AccountType() {
    return TextFormField(
      controller: accountTypeController,
      readOnly: true,
      decoration: InputDecoration(
        labelText: "Account Type",
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

  Widget IFSC() {
    return TextFormField(
      controller: ifscController,
      readOnly: true,
      decoration: InputDecoration(
        labelText: "IFSC",
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

  Widget BranchName() {
    return TextFormField(
      controller: branchNameController,
      readOnly: true,
      decoration: InputDecoration(
        labelText: "Branch Name",
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

  Widget BranchAddress() {
    return TextFormField(
        controller: branchAddressController,
        readOnly: true,
      decoration: InputDecoration(
        labelText: "Branch Address",
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

  Widget BankPhoneNumber() {
    return TextFormField(
      controller: bankNumberController,
      readOnly: true,
      decoration: InputDecoration(
        labelText: "Bank Phone Number",
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
        title: Text("Bank Details"),
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
                Title(),
                SizedBox(
                  height: 15,
                ),
                BankName(),
                SizedBox(
                  height: 15,
                ),
                AccountNumber(),
                SizedBox(
                  height: 15,
                ),
                AccountType(),
                SizedBox(
                  height: 15,
                ),
                IFSC(),
                SizedBox(
                  height: 15,
                ),
                BranchName(),
                SizedBox(
                  height: 15,
                ),
                BranchAddress(),
                SizedBox(
                  height: 15,
                ),
                BankPhoneNumber(),
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
