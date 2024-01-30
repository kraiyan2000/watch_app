import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class carasoul extends StatefulWidget {
  const carasoul({super.key});

  @override
  State<carasoul> createState() => _carasoulState();
}

class _carasoulState extends State<carasoul> {
//Carasoul functionalities start//
  final List<String> imageUrls = [
    'https://www.titan.co.in/on/demandware.static/-/Sites/default/dwcadef6b7/images/slot/landing/nocostemi.jpg',
    'https://www.titan.co.in/on/demandware.static/-/Sites/default/dw351f9cc6/images/slot/landing/Deskstop-680x323-Brown.jpg',
    'https://cdna.artstation.com/p/assets/images/images/031/586/906/large/murugendra-hiremath-00001212.jpg?1604034460',
  ];
  //Carasoul functionalities end//

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        enlargeCenterPage: true,
        viewportFraction: 1.0,
      ),
      items: imageUrls.map((imageUrl) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain, //contain
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
