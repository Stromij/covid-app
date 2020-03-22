import 'package:covid_hub/cognito/cognito.dart';
import 'package:covid_hub/cognito/user_model.dart';
import 'package:covid_hub/registration/name_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('COVID Hub'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  'Erstelle dein Profil',
                  style: TextStyle(fontSize: 32),
                ),
                FormBuilder(
                  key: _fbKey,
                  initialValue: {
                    'accept_terms': false,
                  },
                  autovalidate: true,
                  child: Column(
                    children: <Widget>[
                      FormBuilderTextField(
                        attribute: 'email',
                        maxLines: 1,
                        decoration: InputDecoration(labelText: 'E-Mail'),
                        validators: [
                          FormBuilderValidators.email(),
                          FormBuilderValidators.maxLength(50),
                          FormBuilderValidators.required(),
                        ],
                      ),
                      FormBuilderTextField(
                        attribute: 'password',
                        obscureText: true,
                        maxLines: 1,
                        decoration: InputDecoration(labelText: 'Passwort'),
                        validators: [
                          FormBuilderValidators.maxLength(50),
                          FormBuilderValidators.required(),
                        ],
                      ),
                      FormBuilderCheckbox(
                        attribute: 'accept_terms',
                        label: Text(
                          'Ich akzeptiere, dass ich freiwillig meine Daten zur '
                          'Verfügung stelle und verstehe, dass die Daten für '
                          'Analysezwecke verwendet werden.',
                        ),
                        validators: [
                          FormBuilderValidators.requiredTrue(
                              errorText:
                                  'You must accept terms and conditions to continue'),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    MaterialButton(
                      color: Colors.teal,
                      textColor: Colors.white,
                      child: Text("Submit"),
                      onPressed: () {
                        if (_fbKey.currentState.saveAndValidate()) {
                          print(_fbKey.currentState.value);
                          user = User(
                            email: _fbKey.currentState.value['email'],
                            passwd: _fbKey.currentState.value['password'],
                          );
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => NamePage(),
                            ),
                          );
                        }
                      },
                    ),
                    MaterialButton(
                      child: Text("Reset"),
                      onPressed: () {
                        _fbKey.currentState.reset();
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
