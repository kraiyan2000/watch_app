import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:watch_app/api/firebaseapis.dart';
import 'package:watch_app/screens/detail.dart';

class ReusableStreamBuilder extends StatefulWidget {
  final String Collection;
  final String docs;
  final String subcollection;
  const ReusableStreamBuilder(
      {super.key,
      required this.Collection,
      required this.docs,
      required this.subcollection});

  @override
  State<ReusableStreamBuilder> createState() => _ReusableStreamBuilderState();
}

class _ReusableStreamBuilderState extends State<ReusableStreamBuilder> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Apis()
          .initialfetch(widget.Collection, widget.docs, widget.subcollection),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        if (streamSnapshot.hasData) {
          return Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      2, // You can adjust the cross-axis count as needed
                  crossAxisSpacing: 8.0, // Optional spacing between grid items
                  mainAxisSpacing: 8.0, // Optional spacing between rows
                  childAspectRatio: 0.59),
              shrinkWrap: true,
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];

                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => detail(
                                  documentSnapshot: documentSnapshot,
                                )));
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 200.0, // Set a fixed height for each grid item
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(documentSnapshot['image']),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              documentSnapshot['name'],
                              maxLines: 2, // Set the maximum number of lines
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '₹${documentSnapshot['price']}',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            const Text(
                              '₹18,995',
                              style: TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            const Text(
                              '31.59% OFF',
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
