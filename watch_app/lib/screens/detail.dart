import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class detail extends StatefulWidget {
  final DocumentSnapshot documentSnapshot;
  const detail({super.key, required this.documentSnapshot});

  @override
  State<detail> createState() => _detailState();
}

class _detailState extends State<detail> {
  int _currentIndex = 0;
  late String cartstatus;
  cart() {
    if (widget.documentSnapshot['cart'] == true) {
      cartstatus = 'REMOVE CART';
    } else {
      cartstatus = 'ADD CART';
    }
  }

  @override
  void initState() {
    super.initState();
    cart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF04364A),
        title: const Text(''),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => cart()));

              print('Search Button Pressed');
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              // Handle search button press
              print('Search Button Pressed');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CarouselSlider(
              items: [
                's1image',
                's2image',
                's3image',
              ].map((imageKey) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Image.network(
                        '${widget.documentSnapshot[imageKey]}', // Use Image.network for network images
                        fit: BoxFit.contain,
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: 350.0, // Adjust the height as needed

                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            const SizedBox(height: 10.0),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 23, left: 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.documentSnapshot['name']}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Color(0xFF04364A),
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xFF04364A),
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xFF04364A),
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xFF04364A),
                      ),
                      Icon(
                        Icons.star_half,
                        color: Color(0xFF04364A),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                      

                        '₹${widget.documentSnapshot['price']}',
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "20.01% OFF",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 195, 24, 24)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  // const Text(
                  //   "₹16995",
                  //   style: TextStyle(
                  //       color: Colors.grey,
                  //       decoration: TextDecoration.lineThrough,
                  //       decorationColor: Colors.grey,
                  //       fontSize: 20,
                  //       fontWeight: FontWeight.bold),
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        children: [
          Container(
            width: 170, // Set the same width as the first button
            height: 70, // Set a fixed height
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              onPressed: () {
                print(widget.documentSnapshot['cart']);

                if (widget.documentSnapshot['cart'] == false) {
                  widget.documentSnapshot.reference.update({
                    'cart': true,
                  }).then((_) {
                    setState(() {
                      cartstatus = 'REMOVE CART';
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Item added to cart'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  });
                } else {
                  widget.documentSnapshot.reference
                      .update({'cart': false}).then((_) {
                    cartstatus = 'ADD CART';
                    // setState(() {

                    // });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Item removed from cart'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  });
                  print(widget.documentSnapshot['cart']);
                }
              },
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                    const BorderSide(color: Color(0xff04364A), width: 2.0)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
              child: Text(
                cartstatus,
                style: TextStyle(color: Color(0xff04364A), fontSize: 15),
              ),
            ),
          ),
          Container(
            width: 180, // Set the same width as the first button
            height: 70, // Set a fixed height
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              onPressed: () {
                // Handle button press
                print('BUY NOW Pressed');
              },
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                    const BorderSide(color: Color(0xff04364A), width: 2.0)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
              child: const Text(
                'BUY NOW',
                style: TextStyle(color: Color(0xff04364A), fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
