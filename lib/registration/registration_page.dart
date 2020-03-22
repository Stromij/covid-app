import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          FormBuilder(
            key: _fbKey,
            initialValue: {
              'date': DateTime.now(),
              'accept_terms': false,
            },
            autovalidate: true,
            child: Column(
              children: <Widget>[
                FormBuilderTextField(
                  attribute: 'email',
                  decoration: InputDecoration(labelText: 'E-Mail'),
                  validators: [
                    FormBuilderValidators.email(),
                    FormBuilderValidators.maxLength(50),
                  ],
                ),
                FormBuilderTextField(
                  attribute: 'password',
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Passwort'),
                  validators: [
                    FormBuilderValidators.maxLength(50),
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
                child: Text("Submit"),
                onPressed: () {
                  if (_fbKey.currentState.saveAndValidate()) {
                    print(_fbKey.currentState.value);
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
      );
}
