import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:meta/meta.dart';

class Content {
  final String name;
  final String imageUrl;
  final String titleImageUrl;
  final String videoUrl;
  final String description;
  final Color color;

  const Content({
    required this.name,
    required this.imageUrl,
    required this.videoUrl,
    required this.titleImageUrl,
    required this.description,
    required this.color,
  });
}
