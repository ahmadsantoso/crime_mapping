import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crime_mapping/services/auth.dart';
import 'package:crime_mapping/screens/register/register.dart';
import 'package:crime_mapping/screens/homepage/homepage.dart';

class Login extends StatefulWidget {
  static final routeName = '/login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthServices auth = AuthServices();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _isLoading = false;

  handleOnSubmit() async {
    try {
      setState(() => _isLoading = true);
      await AuthServices.signIn(
          _emailController.text, _passwordController.text);
      Navigator.of(context).pushReplacementNamed(HomePage.routeName);
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
                SizedBox(height: 60),
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
                SizedBox(height: 20),
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
                    hintText: 'Masukan Kata Sandi',
                    labelText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
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
                        : Text('Sign In'),
                    onPressed: handleOnSubmit,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Do not have an account?'),
                    SizedBox(height: 50),
                    InkWell(
                      child: Text(
                        '   Register here',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () =>
                          Navigator.of(context).pushNamed(Register.routeName),
                    ),
                  ],
                ),
                SizedBox(height: 70),
                Text('Version 0.0.1'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
