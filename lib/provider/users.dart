import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter/data/dummy_users.dart';
import 'package:project_flutter/models/user.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    if (user.id.trim().isNotEmpty && _items.containsKey(user.id)) {
      _items.update(
        user.id,
        (_) => User(
          id: user.id,
          namecoffe: user.namecoffe,
          ingredients: user.ingredients,
          image: user.image,
        ),
      );
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => User(
          id: id,
          namecoffe: user.namecoffe,
          ingredients: user.ingredients,
          image: user.image,
        ),
      );
    }

    notifyListeners();
  }

  void remove(User user) {
    if (user.id.trim().isNotEmpty && _items.containsKey(user.id)) {
      _items.remove(user.id);
    }
    notifyListeners();
  }
}
