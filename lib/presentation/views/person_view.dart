import 'package:flutter/material.dart';

class PersonView extends StatelessWidget {
  const PersonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu_rounded)),
        title: Text('Profile user'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag_outlined))
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(120),
                  border: Border.all(color: Colors.yellow.shade700, width: 15)),
              padding: EdgeInsets.all(10),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Image.asset(
                    'assets/images/profile-user.jpg',
                  )),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.person_pin),
                title: Text('Name'),
                subtitle: Text('Manuel Walter'),
              ),
              ListTile(
                leading: Icon(Icons.person_pin),
                title: Text('Last name'),
                subtitle: Text('Navarro Zeta'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Profile'),
                subtitle: Text('User'),
              ),
              ListTile(
                leading: Icon(Icons.flag),
                title: Text('Nationality'),
                subtitle: Text('Perú'),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
