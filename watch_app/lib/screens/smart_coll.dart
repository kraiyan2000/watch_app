import 'package:flutter/material.dart';
import 'package:watch_app/reusable_widget/reuasble_%20widget.dart';
import 'package:watch_app/widgets/search.dart';

class smartcoll extends StatefulWidget {
  const smartcoll({super.key});

  @override
  State<smartcoll> createState() => _smartcollState();
}

class _smartcollState extends State<smartcoll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF04364A),
          title: const Text("Smart watches"),
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
                docs: '1',
                subcollection: 'smart',
              ),
            ],
          ),
        ));
  }
}
