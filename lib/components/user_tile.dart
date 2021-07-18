import 'package:flutter/material.dart';
import 'package:project_flutter/models/user.dart';
import 'package:project_flutter/provider/users.dart';
import 'package:project_flutter/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User user;
  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final CircleAvatar image;
    if (user.image.isEmpty) {
      image = CircleAvatar(child: Icon(Icons.coffee));
    } else {
      image = CircleAvatar(backgroundImage: NetworkImage(user.image));
    }
    return ListTile(
      leading: image,
      title: Text(user.namecoffe),
      subtitle: Text(user.ingredients),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.brown,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: user,
                );
              },
            ),
            IconButton(
              color: Colors.grey,
              icon: Icon(Icons.delete),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Delete from list'),
                    content: Text('Are you sure?'),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('No')),
                      TextButton(
                          onPressed: () {
                            Provider.of<Users>(context, listen: false)
                                .remove(user);
                            Navigator.of(context).pop();
                          },
                          child: Text('Yes')),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
