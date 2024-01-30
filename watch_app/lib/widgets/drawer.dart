import 'package:flutter/material.dart';
import 'package:watch_app/screens/automatic.dart';
import 'package:watch_app/screens/chronograph.dart';
import 'package:watch_app/screens/quartz.dart';
import 'package:watch_app/screens/smart_coll.dart';

class drawer extends StatefulWidget {
  const drawer({super.key});

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 130,
              child: const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                        radius: 15.0,
                        backgroundImage: AssetImage(
                          'assets/images/user.png',
                        ),
                        backgroundColor: Colors.white),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Hello User',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Column(
                      children: [],
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              title: const Text('Smart watch'),
              trailing: Icon(Icons.chevron_right_outlined),
              onTap: () {
                Navigator.pop(context); // Close the drawer

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const smartcoll()));
              },
            ),
            ListTile(
              title: const Text('Chronograph watch'),
              trailing: Icon(Icons.chevron_right_outlined),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const chronographcoll()));
              },
            ),
            ListTile(
              title: const Text('Quartz Watch'),
              trailing: Icon(Icons.chevron_right_outlined),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const quartzcoll()));
              },
            ),
            ListTile(
              title: const Text('Automatic watch'),
              trailing: Icon(Icons.chevron_right_outlined),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const automaticcoll()));
              },
            ),
            ListTile(
              title: const Text('Clocks'),
              trailing: Icon(Icons.chevron_right_outlined),
              onTap: () {
                // Handle item 2 tap
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: const Text('New arrivals'),
              trailing: Icon(Icons.chevron_right_outlined),
              onTap: () {
                // Handle item 2 tap
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
    );
  }
}
