import 'package:flutter/material.dart';

class Handbags {
  final String id;
  final String image;
  final Color color;
  final String size;
  final String price;
  final String description =
      'Lorem Upsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s strandard dummy text ever since. When an unkown printer took a galley.';

  Handbags({
    required this.image,
    required this.color,
    required this.size,
    required this.price,
    required this.id,
  });
}
