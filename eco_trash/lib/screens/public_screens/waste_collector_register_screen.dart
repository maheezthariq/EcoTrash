import 'package:flutter/material.dart';
import 'package:eco_trash/services/auth_service.dart';
import 'package:quickalert/quickalert.dart';

class WasteCollectorRegisterScreen extends StatefulWidget {
  @override
  _WasteCollectorRegisterScreenState createState() =>
      _WasteCollectorRegisterScreenState();
}

class _WasteCollectorRegisterScreenState
    extends State<WasteCollectorRegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _name;
  String? _email;
  String? _password;
  bool _passtoggle = true;

  void _registerWasteCollector() async {
    try {
      await AuthService().registerWasteCollector(_name!, _email!, _password!);
      _showSuccessAlert();
    } catch (er) {
      print(er.toString());
      _showErrorAlert();
    }
  }

  void _showSuccessAlert() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      title: "Registration",
      text: 'Successful!',
      confirmBtnText: 'Continue',
      confirmBtnColor: const Color.fromARGB(255, 101, 145, 103),
      onConfirmBtnTap: () {
        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
      },
    );
  }

  void _showErrorAlert() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: "Oops!",
      text: 'Registration failed!',
      confirmBtnText: 'Try again',
      confirmBtnColor: const Color.fromARGB(255, 67, 78, 68),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/login1.JPG'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 80,
                    height: 100,
                    margin: const EdgeInsets.fromLTRB(0, 150, 0, 40),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/qd.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child:
                        _buildTextField("Full Name", (value) => _name = value),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: _buildTextField("Email", (value) => _email = value),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: _buildPasswordField(
                        "Password", (value) => _password = value),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          _registerWasteCollector();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 1, 17, 1),
                        minimumSize: const Size(100, 50),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                      child: const Text("SIGN UP",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Abadi',
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, Function(String?) onSaved) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        validator: (text) {
          if (text!.isEmpty) {
            return "$label can't be empty";
          }
          return null;
        },
        onSaved: onSaved,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "Enter your $label",
          hintStyle: const TextStyle(color: Colors.white),
          filled: true,
          fillColor: Colors.transparent,
          enabledBorder: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField(String label, Function(String?) onSaved) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        validator: (text) {
          if (text!.isEmpty) {
            return "$label can't be empty";
          }
          return null;
        },
        onSaved: onSaved,
        obscureText: _passtoggle,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "Enter $label",
          hintStyle: const TextStyle(color: Colors.white),
          filled: true,
          fillColor: Colors.transparent,
          enabledBorder: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _passtoggle ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _passtoggle = !_passtoggle;
              });
            },
          ),
        ),
      ),
    );
  }
}
