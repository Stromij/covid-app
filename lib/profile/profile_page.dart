import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _textEditingController = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();

  String _userName = 'Max Muster';
  String _userMail = 'muster@covidhub.info';
  String _userLocation = 'Gießen';
  String _userBirth = '1990';
  List<String> _userConditions = ['Bluthochdruck', 'Diabetes'];

  double _titleSize = 16.0;
  double _valueSize = 18.0;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Profil'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  title: Text(
                    'Name',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: _titleSize,
                    ),
                  ),
                  subtitle: Text(
                    _userName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: _valueSize,
                    ),
                  ),
                  trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => _showEditDialog(context, 'Name')),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    'E-Mail',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: _titleSize,
                    ),
                  ),
                  subtitle: Text(
                    _userMail,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: _valueSize,
                    ),
                  ),
                  trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => _showEditDialog(context, 'E-Mail')),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    'Wohnort',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: _titleSize,
                    ),
                  ),
                  subtitle: Text(
                    _userLocation,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: _valueSize,
                    ),
                  ),
                  trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => _showEditDialog(context, 'Wohnort')),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    'Jahrgang',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: _titleSize,
                    ),
                  ),
                  subtitle: Text(
                    _userBirth,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: _valueSize,
                    ),
                  ),
                  trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => _showEditDialog(context, 'Jahrgang')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 4.0,),
                child: ListTile(
                  title: Text(
                    'Vorerkrankungen',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: _valueSize,
                    ),
                  ),
                  trailing: IconButton(
                      icon: Icon(Icons.add_circle),
                      onPressed: () => _showEditDialog(context, 'Vorerkrankungen')),
                ),
              ),
              //TODO: update SDK constraints (speak with team first)
              ..._userConditions.map(
                (condition) => Card(
                  child: ListTile(
                    title: Text(
                      condition,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: _valueSize,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle),
                      onPressed: () => setState(() {
                        _userConditions.remove(condition);
                      }),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  _showEditDialog(BuildContext context, String type) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('$type bearbeiten'),
          content: FormBuilder(
            key: _formKey,
            autovalidate: true,
            child: type == 'Jahrgang'
                ? _buildAgeTextField()
                : _buildStandardTextField(),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'BESTÄTIGEN',
                style: TextStyle(color: Colors.green),
              ),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  switch (type) {
                    case 'Name':
                      setState(() {
                        _userName = _textEditingController.text;
                      });
                      Navigator.of(context).pop();
                      break;
                    case 'E-Mail':
                      setState(() {
                        _userMail = _textEditingController.text;
                      });
                      Navigator.of(context).pop();
                      break;
                    case 'Wohnort':
                      setState(() {
                        _userLocation = _textEditingController.text;
                      });
                      Navigator.of(context).pop();
                      break;
                    case 'Jahrgang':
                      setState(() {
                        _userBirth = _textEditingController.text;
                      });
                      Navigator.of(context).pop();
                      break;
                    case 'Vorerkrankungen':
                      setState(() {
                        _userConditions.add(_textEditingController.text);
                      });
                      Navigator.of(context).pop();
                      break;
                    default:
                      Navigator.of(context).pop();
                      break;
                  }
                }
              },
            ),
            FlatButton(
              child: Text(
                'ABBRECHEN',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );

  FormBuilderTextField _buildStandardTextField() => FormBuilderTextField(
        controller: _textEditingController,
        validators: [
          FormBuilderValidators.minLength(
            1,
            errorText: 'Das Feld darf nicht leer sein',
          ),
          FormBuilderValidators.maxLength(
            50,
            errorText: 'Die Eingabe darf höchstens 50 Zeichen haben',
          ),
        ],
      );

  FormBuilderTextField _buildAgeTextField() => FormBuilderTextField(
        controller: _textEditingController,
        keyboardType: TextInputType.number,
        validators: [
          FormBuilderValidators.minLength(4,
              errorText: 'Bitte im Format "JJJJ" angeben'),
          FormBuilderValidators.maxLength(4,
              errorText: 'Bitte im Format "JJJJ" angeben'),
          FormBuilderValidators.numeric(
              errorText: 'Bitte im Format "JJJJ" angeben'),
          FormBuilderValidators.min(1900,
              errorText: 'Sie sind ein medizinisches Wunder'),
          FormBuilderValidators.max(DateTime.now().year,
              errorText: 'Sie sind ein medizinisches Wunder'),
        ],
      );
}
