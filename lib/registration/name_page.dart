import 'package:covid_hub/cognito/user_model.dart';
import 'package:covid_hub/registration/location_chooser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class NamePage extends StatefulWidget {
  final User user;

  NamePage(this.user, {Key key}) : super(key: key);

  @override
  _NamePageState createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
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
                'Dein Name',
                style: TextStyle(fontSize: 32),
              ),
              FormBuilder(
                key: _fbKey,
                autovalidate: true,
                child: Column(
                  children: <Widget>[
                    FormBuilderTextField(
                      attribute: 'name',
                      maxLines: 1,
                      decoration: const InputDecoration(labelText: 'Name'),
                      validators: [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.maxLength(50),
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
                        User user = widget.user.copyWith(
                          name: _fbKey.currentState.value['name'],
                        );
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => LocationChooser(user),
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
