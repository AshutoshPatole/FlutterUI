import 'package:flutter/material.dart';

import 'sections.dart';

const double kSectionIndicatorWidth = 30.0;

// The card for a single section. Displays the section's gradient and background image.
class SectionCard extends StatelessWidget {
  const SectionCard({Key key, @required this.section})
      : assert(section != null),
        super(key: key);

  final Section section;

  @override
  Widget build(BuildContext context) {
    return new Semantics(
      label: section.title,
      button: true,
      child: new DecoratedBox(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              section.leftColor,
              section.rightColor,
            ],
          ),
        ),
        child: new Image.asset(
          section.backgroundAsset,
          color: const Color.fromRGBO(255, 255, 255, 0.2),
          colorBlendMode: BlendMode.modulate,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// The title is rendered with two overlapping text widgets that are vertically
// offset a little. It's supposed to look sort-of 3D.
class SectionTitle extends StatelessWidget {
  static const TextStyle sectionTitleStyle = const TextStyle(
    inherit: false,
    fontSize: 24.0,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    textBaseline: TextBaseline.alphabetic,
  );

  static final TextStyle sectionTitleShadowStyle = sectionTitleStyle.copyWith(
    color: const Color(0x19000000),
  );

  const SectionTitle({
    Key key,
    @required this.section,
    @required this.scale,
    @required this.opacity,
  })  : assert(section != null),
        assert(scale != null),
        assert(opacity != null && opacity >= 0.0 && opacity <= 1.0),
        super(key: key);

  final Section section;
  final double scale;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return new IgnorePointer(
      child: new Opacity(
        opacity: opacity,
        child: new Transform(
          transform: new Matrix4.identity()..scale(scale),
          alignment: Alignment.center,
          child: new Stack(
            children: <Widget>[
              new Positioned(
                top: 4.0,
                child: new Text(section.title, style: sectionTitleShadowStyle),
              ),
              new Text(section.title, style: sectionTitleStyle),
            ],
          ),
        ),
      ),
    );
  }
}

// Small horizontal bar that indicates the selected section.
class SectionIndicator extends StatelessWidget {
  const SectionIndicator({Key key, this.opacity = 1.0}) : super(key: key);

  final double opacity;

  @override
  Widget build(BuildContext context) {
    return new IgnorePointer(
      child: new Container(
        width: kSectionIndicatorWidth,
        height: 3.0,
        color: Colors.white.withOpacity(opacity),
      ),
    );
  }
}

// Display a single SectionDetail.
