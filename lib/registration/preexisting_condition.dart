import 'package:covid_hub/registration/age_chooser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PreexistingCondition extends StatefulWidget {


  PreexistingCondition({Key key}) : super(key: key);

  @override
  _PreexistingConditionState createState() => _PreexistingConditionState();
}

class _PreexistingConditionState extends State<PreexistingCondition> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  ValueChanged _onChanged = (val) => print(val);

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
                'Hast du Vorerkrankungen',
                style: TextStyle(fontSize: 32),
              ),
              FormBuilder(
                key: _fbKey,
                autovalidate: true,
                child: Column(
                  children: <Widget>[
                    FormBuilderChipsInput(
                      attribute: 'preexisting',
                      decoration: InputDecoration(labelText: 'Vorerkrangung'),
                      onChanged: _onChanged,
                      initialValue: [],
                      validators: [
                        FormBuilderValidators.required(),
                      ],
                      suggestionBuilder: (context, state, condition) {
                        return ListTile(
                          key: ObjectKey(condition),
                          title: Text(condition),
                          onTap: () => state.selectSuggestion(condition),
                        );
                      },
                      findSuggestions: (String query) => [query],
                      chipBuilder: (context, state, condition) => InputChip(
                        key: ObjectKey(condition),
                        label: Text(condition),
                        onDeleted: () => state.deleteChip(condition),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
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
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => AgeChooser(),
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
