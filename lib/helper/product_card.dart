// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lomark/main.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
          horizontal: mq.width * .05, vertical: mq.height * .02),
      color: Colors.grey,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: mq.height * .01, horizontal: mq.width * .01),
        child: Column(
          children: [
            Icon(
              Icons.image,
              size: mq.height * .10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "New Product",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  width: mq.width * .05,
                ),
                Icon(
                  Icons.star_border_outlined,
                  size: 30,
                ),
                Text(
                  "4.9",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
