import 'package:flutter/material.dart';
import 'package:project_flutter/models/user.dart';
import 'package:project_flutter/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};
  /*
  void _loadFormData(User user) {
   
      _formData['id'] = user.id;
      _formData['namecoffe'] = user.namecoffe;
      _formData['ingredients'] = user.ingredients;
      _formData['image'] = user.image;
    
  }*/

  @override
  Widget build(BuildContext context) {
    //final user = ModalRoute.of(context)!.settings.arguments as User;
    //_loadFormData(user);

    return Scaffold(
      appBar: AppBar(
          title: Text('ListCoffee + your favorite coffee!'),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  _form.currentState!.save();
                  var formData = _formData;
                  Provider.of<Users>(context, listen: false).put(
                    User(
                      id: _formData['id'],
                      namecoffe: formData['namecoffe'],
                      ingredients: _formData['ingredients'],
                      image: _formData['image'],
                    ),
                  );
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.coffee)),
          ]),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['id'],
                decoration: InputDecoration(labelText: 'Id'),
                onSaved: (value) => _formData['id'] = value!,
              ),
              TextFormField(
                initialValue: _formData['namecoffe'],
                decoration: InputDecoration(labelText: 'Coffe Name'),
                onSaved: (value) => _formData['namecoffe'] = value!,
              ),
              TextFormField(
                initialValue: _formData['ingredients'],
                decoration: InputDecoration(labelText: 'Ingredients'),
                onSaved: (value) => _formData['ingredients'] = value!,
              ),
              TextFormField(
                initialValue: _formData['image'],
                decoration: InputDecoration(labelText: 'URL Picture to save'),
                onSaved: (value) => _formData['image'] = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
