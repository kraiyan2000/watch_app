import 'package:flutter/material.dart';
import 'package:watch_app/reusable_widget/reuasble_%20widget.dart';
import 'package:watch_app/widgets/search.dart';

class chronographcoll extends StatefulWidget {
  const chronographcoll({super.key});

  @override
  State<chronographcoll> createState() => _chronographcollState();
}

class _chronographcollState extends State<chronographcoll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF04364A),
          title: const Text("Chronograph watches"),
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
                docs: '3',
                subcollection: 'chronograph',
              ),
            ],
          ),
        ));
  }
}
