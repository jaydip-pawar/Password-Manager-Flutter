import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:secret_keeper/database/bank_model.dart';
import 'package:secret_keeper/main.dart';

class BankInput extends StatefulWidget {
  @override
  _BankInputState createState() => _BankInputState();
}

class _BankInputState extends State<BankInput> {

  //Reference of Box
  //Box<BankModel> bankBox;

  TextEditingController titleController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController accountTypeController = TextEditingController();
  TextEditingController ifscController = TextEditingController();
  TextEditingController branchNameController = TextEditingController();
  TextEditingController branchAddressController = TextEditingController();
  TextEditingController bankNumberController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   bankBox = Hive.box<BankModel>(BankBoxName);
  // }
  //
  // void addDataToHive(){
  //   final String titleInput = titleController.text;
  //   final String bankNameInput = bankNameController.text;
  //   final String accountNumberInput = accountNumberController.text;
  //   final String accountTypeInput = accountTypeController.text;
  //   final String ifscInput = ifscController.text;
  //   final String branchNameInput = branchNameController.text;
  //   final String branchAddressInput = branchAddressController.text;
  //   final String bankNumberInput = bankNumberController.text;
  //   final String notesInput = notesController.text;
  //
  //   BankModel bankModel = BankModel(title: titleInput, bankName: bankNameInput, accountNumber: accountNumberInput, accountType: accountTypeInput,
  //       ifsc: ifscInput, branchName: branchNameInput, branchAddress: branchAddressInput, bankNumber: bankNumberInput, note: notesInput);
  //
  //   bankBox.add(bankModel);
  //
  //   Navigator.pop(context);
  // }

  Widget Title() {
    return TextFormField(
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
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
            color: Colors.red,
          ),
        ),
      ),
      textInputAction: TextInputAction.next,
    );
  }

  Widget BankName() {
    return TextFormField(
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
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
            color: Colors.red,
          ),
        ),
      ),
      textInputAction: TextInputAction.next,
    );
  }

  Widget AccountNumber() {
    return TextFormField(
      keyboardType: TextInputType.number,
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
            color: Colors.red,
          ),
        ),
      ),
      textInputAction: TextInputAction.next,
    );
  }

  Widget AccountType() {
    return TextFormField(
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
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
            color: Colors.red,
          ),
        ),
      ),
      textInputAction: TextInputAction.next,
    );
  }

  Widget IFSC() {
    return TextFormField(
      keyboardType: TextInputType.text,
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
            color: Colors.red,
          ),
        ),
      ),
      textInputAction: TextInputAction.next,
    );
  }

  Widget BranchName() {
    return TextFormField(
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
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
            color: Colors.red,
          ),
        ),
      ),
      textInputAction: TextInputAction.next,
    );
  }

  Widget BranchAddress() {
    return TextFormField(
      keyboardType: TextInputType.streetAddress,
      textCapitalization: TextCapitalization.words,
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
            color: Colors.red,
          ),
        ),
      ),
      textInputAction: TextInputAction.next,
    );
  }

  Widget BankPhoneNumber() {
    return TextFormField(
      keyboardType: TextInputType.number,
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
            color: Colors.red,
          ),
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
        title: Text("Add Bank Details"),
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
                Container(
                  height: 50,
                  width: double.infinity,
                  child: FlatButton(
                    onPressed: () {},
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