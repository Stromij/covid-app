import 'package:covid_hub/cognito/cognito.dart';
import 'package:covid_hub/cognito/user_model.dart';
import 'package:covid_hub/registration/preexisting_condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LocationChooser extends StatefulWidget {
  LocationChooser({Key key}) : super(key: key);

  @override
  _LocationChooserState createState() => _LocationChooserState();
}

class _LocationChooserState extends State<LocationChooser> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid Hub'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                'Wähle deinen Standort',
                style: TextStyle(fontSize: 32),
              ),
              FormBuilder(
                key: _fbKey,
                autovalidate: true,
                child: Column(
                  children: <Widget>[
                    FormBuilderTextField(
                      attribute: 'location',
                      maxLines: 1,
                      decoration: InputDecoration(labelText: 'Ortsname'),
                      validators: [
                        FormBuilderValidators.required(),
                      ],
                    )
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
                            location: _fbKey.currentState.value['location']);
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => PreexistingCondition(),
                          ),
                        );
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
