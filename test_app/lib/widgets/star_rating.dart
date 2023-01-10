import 'package:flutter/material.dart';

class TStarRating extends StatefulWidget {
  final double rating;
  final double maxRating;
  final int count;
  final double size;
  final Color unselectedColor;
  final Color selectedColor;
  final Widget unselectedImg;
  final Widget selectedImg;
  TStarRating({
    required this.rating,
    this.maxRating = 10.0,
    this.count = 5,
    this.size = 50,
    this.unselectedColor = const Color(0xffbbbbbb),
    this.selectedColor = const Color(0xffff0000),
    Widget? unselectedImg,
    Widget? selectedImg,
  })  : unselectedImg = unselectedImg ??
            Icon(
              Icons.star_border,
              color: unselectedColor,
              size: size,
            ),
        selectedImg =
            selectedImg ?? Icon(Icons.star, color: selectedColor, size: size);

  @override
  State<StatefulWidget> createState() {
    return _TStarRatingState();
  }
}

class _TStarRatingState extends State<TStarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: buildUnselectedStar(),
        ),
        Row(mainAxisSize: MainAxisSize.min, children: buildSelectedStar())
      ],
    );
  }

  List<Widget> buildUnselectedStar() {
    return List.generate(widget.count, (index) {
      return widget.unselectedImg;
    });
  }

  List<Widget> buildSelectedStar() {
    //创建sttar
    List<Widget> stars = [];
    final star = widget.selectedImg;

    //构建填充满的star
    double oneVulue = widget.maxRating / widget.count;
    int entriCount = (widget.rating / oneVulue).floor(); // 向下取整
    for (var i = 0; i < entriCount; i++) {
      stars.add(star);
    }

    //构建填充部分star
    double halfWidth = ((widget.rating / oneVulue) - entriCount) * widget.size;

    final halfStar = ClipRect(
      clipper: TStartClip(halfWidth),
      child: star,
    );
    stars.add(halfStar);
    if (stars.length > widget.count) {
      return stars.sublist(0, widget.count);
    }
    return stars;
  }
}

class TStartClip extends CustomClipper<Rect> {
  double width;
  TStartClip(this.width);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(covariant TStartClip oldClipper) {
    return oldClipper.width != width;
  }
}
