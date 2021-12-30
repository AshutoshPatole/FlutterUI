import 'package:flutter/material.dart';

const Color _brownColor = const Color(0xFFd2691e);
const Color _darkBrownColor = const Color(0xFF8b4513);
const Color blackColor = const Color(0xFF000000);
const Color _tomato = const Color(0xFFF95B10);
const Color silver = const Color(0xFFc0c0c0);
const Color _mySin = const Color(0xFFF3A646);

class Section {
  const Section({
    required this.title,
    required this.backgroundAsset,
    required this.leftColor,
    required this.rightColor,
  });

  final String title;
  final String backgroundAsset;
  final Color leftColor;
  final Color rightColor;

  @override
  bool operator ==(Object other) {
    if (other is! Section) return false;
    final Section otherSection = other;
    return title == otherSection.title;
  }

  @override
  int get hashCode => title.hashCode;
}

final List<Section> allSections = <Section>[
  Section(
    title: 'TABLES',
    leftColor: _brownColor,
    rightColor: _darkBrownColor,
    backgroundAsset: 'assets/image/table.png',
  ),
  Section(
    title: 'CHAIRS',
    leftColor: _darkBrownColor,
    rightColor: silver,
    backgroundAsset: 'assets/image/chair.jpg',
  ),
  const Section(
    title: 'LAMPS',
    leftColor: _mySin,
    rightColor: _tomato,
    backgroundAsset: 'assets/image/lamp.jpg',
  ),
  const Section(
    title: 'SOFA\'s',
    leftColor: silver,
    rightColor: _brownColor,
    backgroundAsset: 'assets/image/sofa.jpg',
  ),
];
