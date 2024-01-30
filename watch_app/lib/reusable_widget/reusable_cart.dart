import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:watch_app/api/firebaseapis.dart';
import 'package:watch_app/screens/detail.dart';

class reusablecart extends StatefulWidget {
  final String Collection;
  final String docs;
  final String subcollection;

  const reusablecart(
      {Key? key,
      required this.Collection,
      required this.docs,
      required this.subcollection})
      : super(key: key);

  @override
  State<reusablecart> createState() => _reusablecartState();
}

class _reusablecartState extends State<reusablecart> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Apis()
          .initialfetch(widget.Collection, widget.docs, widget.subcollection),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        if (streamSnapshot.hasData) {
          // Filter out items with 'cart' as false
          final List<DocumentSnapshot> cartItems = streamSnapshot.data!.docs
              .where((doc) => doc['cart'] == true)
              .toList();

          return Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.6,
              ),
              shrinkWrap: true,
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot = cartItems[index];

                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => detail(
                          documentSnapshot: documentSnapshot,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 200.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(documentSnapshot['image']),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              documentSnapshot['name'],
                              maxLines: 2,
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
