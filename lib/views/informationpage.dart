import 'package:flutter/material.dart';
import 'package:project_flutter/routes/app_routes.dart';
import 'package:project_flutter/views/byepage.dart';

class Informations extends StatefulWidget {
  const Informations({Key? key}) : super(key: key);

  @override
  _InformationsState createState() => _InformationsState();
}

class _InformationsState extends State<Informations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informations"),
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Cappuccino",
              style: TextStyle(
                fontSize: 40,
                color: Colors.brown,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Italian_breakfast_cappucino%2C_Esino_Lario.jpg/800px-Italian_breakfast_cappucino%2C_Esino_Lario.jpg'),
            SizedBox(
              height: 10,
            ),
            Text(
              "A cappuccino is an espresso-based coffee drink that originated in Italy, and is simply prepared with steamed milk foam (microfoam). @from wikipedia \n Ingredients: milk, sugar, coffee, chocolate, cinnammon",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
