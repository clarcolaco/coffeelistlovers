import 'package:flutter/material.dart';
import 'package:project_flutter/components/user_tile.dart';
import 'package:project_flutter/data/dummy_users.dart';
import 'package:project_flutter/models/user.dart';
import 'package:project_flutter/provider/users.dart';
import 'package:project_flutter/routes/app_routes.dart';
import 'package:project_flutter/views/byepage.dart';
import 'package:project_flutter/views/informationpage.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('CoffeList'),
        actions: <Widget>[
          IconButton(
            tooltip: 'I love coffe, i wanna read about it!',
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Informations()),
              );
            },
          ),
          IconButton(
            tooltip: 'Wanna go out',
            icon: const Icon(
              Icons.exit_to_app,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ByePage()),
              );
            },
          ),
          IconButton(
            tooltip: 'Add a new coffe',
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
      ),
    );
  }
}
