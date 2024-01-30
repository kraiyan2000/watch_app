import 'package:flutter/material.dart';
import 'package:watch_app/reusable_widget/reuasble_%20widget.dart';
import 'package:watch_app/widgets/search.dart';

class automaticcoll extends StatefulWidget {
  const automaticcoll({super.key});

  @override
  State<automaticcoll> createState() => _automaticcollState();
}

class _automaticcollState extends State<automaticcoll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF04364A),
          title: const Text("Automatic watches"),
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
                docs: '4',
                subcollection: 'automatic',
              ),
            ],
          ),
        ));
  }
}
