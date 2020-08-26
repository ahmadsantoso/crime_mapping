import 'package:crime_mapping/shared/font.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crime_mapping/services/auth.dart';
import 'package:crime_mapping/screens/login/login.dart';

class Register extends StatefulWidget {
  static final routeName = '/register';

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthServices auth = AuthServices();

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _isLoading = false;
  String jenkelVal;
  int jenkelType = 0;

  void _handleJenkelType(int value) {
    setState(() {
      jenkelType = value;
      switch (jenkelType) {
        case 1:
          jenkelVal = 'Laki-Laki';
          break;
        case 2:
          jenkelVal = 'Perempuan';
          break;
      }
    });
  }

  handleOnSubmit() async {
    try {
      setState(() => _isLoading = true);
      await AuthServices.signUp(
          _emailController.text, _passwordController.text);
      Navigator.of(context).pop(Login.routeName);
    } catch (e) {
      print('Error: $e');
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: <Widget>[
                Image.asset('assets/soni.png'),
                SizedBox(height: 40),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.lightBlue[400],
                              width: 2,
                            ),
                          ),
                          labelText: 'Nama Lengkap',
                          hintText: 'Nama Lengkap',
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 40),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.lightBlue[400],
                              width: 2,
                            ),
                          ),
                          labelText: 'Email',
                          hintText: 'Masukan Email',
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.lightBlue[400],
                              width: 2,
                            ),
                          ),
                          labelText: 'Password',
                          hintText: 'Masukan Password',
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.lightBlue[400],
                              width: 2,
                            ),
                          ),
                          labelText: 'Alamat',
                          hintText: 'Alamat',
                          prefixIcon: Icon(
                            Icons.home,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.lightBlue[400],
                              width: 2,
                            ),
                          ),
                          labelText: 'Nomor Telepon',
                          hintText: 'Nomor Telepon',
                          prefixIcon: Icon(
                            Icons.local_phone,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Jenis Kelamin',
                        style: blackText,
                      ),
                      Row(
                        children: <Widget>[
                          //
                          Radio(
                            value: 1,
                            groupValue: jenkelType,
                            onChanged: _handleJenkelType,
                            activeColor: Colors.lightBlue,
                          ),
                          Text(
                            'Laki - Laki',
                            style: blackText,
                          ),
                          SizedBox(width: 30.0),
                          //
                          Radio(
                              value: 2,
                              groupValue: jenkelType,
                              onChanged: _handleJenkelType,
                              activeColor: Colors.lightBlue),
                          Text(
                            'Perempuan',
                            style: blackText,
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      ButtonTheme(
                        splashColor: Colors.tealAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        textTheme: ButtonTextTheme.primary,
                        buttonColor: Colors.lightBlue[400],
                        minWidth: double.infinity,
                        height: 65,
                        child: RaisedButton(
                          child: _isLoading
                              ? CircularProgressIndicator(
                                  backgroundColor: Colors.white)
                              : Text('Sign Up'),
                          onPressed: handleOnSubmit,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
