import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shrine_clone/main.dart';
import 'package:shrine_clone/utils/shared_preferences.dart';
import 'package:shrine_clone/utils/theme.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _editingControllerUserName =
      TextEditingController();
  final TextEditingController _editingControllerPassword =
      TextEditingController();

  bool _isEnableNext = false;

  @override
  void dispose() {
    _editingControllerPassword.dispose();
    _editingControllerUserName.dispose();
    super.dispose();
  }

  void _checkEnableNextButton() {
    bool newStateEnable = false;
    if (_editingControllerUserName.text.trim().isEmpty) {
      newStateEnable = false;
    } else if (_editingControllerPassword.text.trim().isEmpty) {
      newStateEnable = false;
    } else {
      newStateEnable = true;
    }
    if (newStateEnable != _isEnableNext) {
      setState(() {
        _isEnableNext = newStateEnable;
      });
    }
  }

  void _actionLogin() async {
    LoginUtils.setLogin().then((_) {
      Navigator.of(context, rootNavigator: true)
          .pushReplacementNamed(routerHomeShop);
    });
  }

  @override
  void initState() {
    super.initState();

    _editingControllerPassword.addListener(() {
      _checkEnableNextButton();
    });
    _editingControllerUserName.addListener(() {
      _checkEnableNextButton();
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build: Login Page');

    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      children: [
        const SizedBox(
          height: 80,
        ),
        const Icon(
          Icons.shopping_basket_sharp,
          color: kPrimaryColor,
          size: 50,
        ),
        const Text(
          'SHRINE',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kPrimaryColor, fontSize: 18, fontWeight: FontWeight.w900),
        ),
        const SizedBox(
          height: 100,
        ),
        TextFormField(
          controller: _editingControllerUserName,
          decoration: const InputDecoration(
            labelText: 'Username',
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
            controller: _editingControllerPassword,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "Password",
            )),
        const SizedBox(
          height: 20,
        ),
        ButtonBar(
          children: [
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(kAccentColor),
              ),
              onPressed: () {
                SystemNavigator.pop(animated: false);
              },
              child: const Text(
                'CANCEL',
              ),
            ),
            TextButton(
              onPressed: _isEnableNext
                  ? () {
                      _actionLogin();
                    }
                  : null,
              child: const Text('NEXT'),
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(10),
                shadowColor:
                    MaterialStateProperty.all(kAccentColor.withAlpha(100)),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.grey;
                    }
                    return kAccentColor; // Use the component's default.
                  },
                ),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
            )
          ],
        )
      ],
    ));
  }
}
