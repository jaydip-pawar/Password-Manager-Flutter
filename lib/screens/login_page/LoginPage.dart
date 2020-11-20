import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:secret_keeper/screens/home_screen/Home.dart';
import 'package:secret_keeper/screens/signup_page/SignupPage.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String _emailID, _password = "",_email = "jaydippawar30@gmail.com", _pass = "JAY.j.p@1";
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  
  void _toggle(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void validateLogin(){
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      if(_emailID == _email && _password == _pass){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
      }
    }
  }

  Widget emailInput(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email ID",
        labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400),
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
            )
        ),
      ),
      validator: (email) {
        if (email.isEmpty)
          return 'Please Enter email ID';
        else if (!EmailValidator.validate(email))
          return 'Enter valid email address';
        else
          return null;
      },
      onSaved: (email)=> _emailID = email,
      textInputAction: TextInputAction.next,
    );
  }

  Widget passInput(){
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400),
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
          )
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey.shade600,
          ),
          onPressed: _toggle,
        ),
      ),
      validator: (password){
        Pattern pattern =
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
        RegExp regex = new RegExp(pattern);
        if (password.isEmpty){
          return 'Please Enter Password';
        }else if (!regex.hasMatch(password))
          return 'Enter valid password';
        else
          return null;
      },
      onSaved: (password)=> _password = password,
      textInputAction: TextInputAction.done,
      obscureText: _obscureText,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 16,right: 16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 50,),
                    Text("Welcome,",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
                    SizedBox(height: 6,),
                    Text("Sign in to continue!",style: TextStyle(fontSize: 20,color: Colors.grey.shade400),),
                  ],
                ),
                Column(
                  children: <Widget>[
                    emailInput(),
                    SizedBox(height: 16,),
                    passInput(),
                    SizedBox(height: 12,),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text("Forgot Password ?",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: FlatButton(
                        onPressed: validateLogin,
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
                            constraints: BoxConstraints(maxWidth: double.infinity,minHeight: 50),
                            child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                    SizedBox(height: 16,),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: FlatButton(
                        onPressed: (){},
                        color: Colors.indigo.shade50,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset("assets/images/facebook.png",height: 18,width: 18,),
                            SizedBox(width: 10,),
                            Text("Connect with Facebook",style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16,),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: FlatButton(
                        onPressed: (){},
                        color: Colors.indigo.shade50,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset("assets/images/facebook.png",height: 18,width: 18,),
                            SizedBox(width: 10,),
                            Text("Connect with Facebook",style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Don't have an account?",style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(width: 5,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return SignupPage();
                          }));
                        },
                        child: Text("Sign up",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}