import 'package:covid_hub/cognito/cognito.dart';
import 'package:covid_hub/cognito/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AgeChooser extends StatefulWidget {
  AgeChooser({Key key}) : super(key: key);

  @override
  _AgeChooserState createState() => _AgeChooserState();
}

class _AgeChooserState extends State<AgeChooser> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID Hub'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                'Wähle dein Alter',
                style: TextStyle(fontSize: 32),
              ),
              FormBuilder(
                key: _fbKey,
                autovalidate: true,
                child: Column(
                  children: <Widget>[
                    FormBuilderTextField(
                      attribute: 'year',
                      maxLines: 1,
                      decoration: const InputDecoration(labelText: 'Jahrgang'),
                      keyboardType: TextInputType.number,
                      validators: [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(4,
                            errorText: 'Bitte im Format "JJJJ" angeben'),
                        FormBuilderValidators.maxLength(4,
                            errorText: 'Bitte im Format "JJJJ" angeben'),
                        FormBuilderValidators.numeric(
                            errorText: 'Bitte im Format "JJJJ" angeben'),
                        FormBuilderValidators.min(1900,
                            errorText: 'Sie sind ein medizinisches Wunder'),
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
                        user = user.copyWith(
                          birthYear:
                              int.parse(_fbKey.currentState.value['year']),
                        );
                        Navigator.of(context).pop();
                      }
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
}
