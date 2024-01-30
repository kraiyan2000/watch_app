import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:watch_app/api/firebaseapis.dart';
import 'package:watch_app/reusable_widget/reuasble_%20widget.dart';
import 'package:watch_app/reusable_widget/reusable_cart.dart';
import 'package:watch_app/screens/copy_smart_coll.dart';
import 'package:watch_app/screens/detail.dart';
import 'package:watch_app/screens/smart_coll.dart';
import 'package:watch_app/widgets/search.dart';

class cart extends StatefulWidget {
  const cart({super.key});

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  // final CollectionReference productsCollection =
  //     FirebaseFirestore.instance.collection('products');
  List<dynamic> addTocart = [];

  Future<void> addToCartFetch() async {
    Map<String, dynamic> data;
    List<dynamic> returndata = [];
    List subCollectioName = ['smart', 'quartz', 'chronograph', 'automatic'];
    List docs = ['1', '2', '3', '4'];

    for (var i = 0; i < subCollectioName.length; i++) {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('products')
          .doc(docs[i])
          .collection(subCollectioName[i])
          .get();

      querySnapshot.docs.forEach((DocumentSnapshot documentSnapshot) {
        data = documentSnapshot.data() as Map<String, dynamic>;
        print('True ${data['cart']}');
        if (data['cart'] == true) {
          returndata.add(data);
          // print(returndata.length);
        }
      });
    }
    setState(() {
      addTocart = returndata;
    });
  }

  @override
  void initState() {
    addToCartFetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF04364A),
        title: const Text("Add to cart"),
      ),
      body: ListView.builder(
          itemCount: addTocart.length,
          itemBuilder: (context, index) {
            return Card(
              child: Container(
                // color: Colors.amber,
                height: 150,
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            height: 150,
                            width: 200,
                            child: Image.network(addTocart[index]['image'])),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 138,
                                child: Text(
                                  addTocart[index]['name'],
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                )),
                            Text('₹${addTocart[index]['price']}'),
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
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '31.59% OFF',
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 14,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 40),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
