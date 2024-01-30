import 'package:flutter/material.dart';
import 'package:watch_app/reusable_widget/reuasble_%20widget.dart';
import 'package:watch_app/widgets/search.dart';

class quartzcoll extends StatefulWidget {
  const quartzcoll({super.key});

  @override
  State<quartzcoll> createState() => _quartzcollState();
}

class _quartzcollState extends State<quartzcoll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF04364A),
          title: const Text("Quartz watches"),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              searchbar(),
              SizedBox(
                height: 13,
              ),
              ReusableStreamBuilder(
                Collection: 'products',
                docs: '2',
                subcollection: 'quartz',
              ),
            ],
          ),
        ));
  }
}
