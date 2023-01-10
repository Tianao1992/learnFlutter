// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:test_app/pages/model/home_model.dart';
import 'package:test_app/widgets/dashed_line.dart';
import 'package:test_app/widgets/star_rating.dart';

class HomeMovieItem extends StatelessWidget {
  final MovieItem item;
  HomeMovieItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 8, color: Color(0xffcccccc)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(),
          SizedBox(
            height: 7,
          ),
          buildContent(),
          SizedBox(
            height: 8,
          ),
          buildFooter()
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 238, 205, 144),
          borderRadius: BorderRadius.circular(3)),
      child: Text(
        "NO.${item.rank}",
        style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 131, 95, 36)),
      ),
    );
  }

  Widget buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildContentIMg(),
        SizedBox(
          width: 8,
        ),
        Expanded(
            child: IntrinsicHeight(
          child: Row(
            children: [
              buildContentInfo(),
              SizedBox(
                width: 8,
              ),
              buildContentLine(),
              SizedBox(
                width: 8,
              ),
              buildContentWish(),
            ],
          ),
        ))
      ],
    );
  }

  Widget buildContentIMg() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        item.imageURL,
        width: 100,
      ),
    );
  }

  Widget buildContentInfo() {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildContentInfoTitle(),
        SizedBox(
          height: 6,
        ),
        buildContentInfoRate(),
        SizedBox(
          height: 8,
        ),
        buildContentInfoDesc(),
      ],
    ));
  }

  Widget buildContentInfoTitle() {
    return Text.rich(TextSpan(children: [
      WidgetSpan(
          child: Icon(
            Icons.play_circle_outline,
            size: 20,
            color: Colors.pink,
          ),
          baseline: TextBaseline.ideographic,
          alignment: PlaceholderAlignment.middle),
      WidgetSpan(
          child: Text(
            item.title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          alignment: PlaceholderAlignment.middle),
      WidgetSpan(
          child: Text("(${item.playDate})"),
          style: TextStyle(fontSize: 18, color: Colors.grey))
    ]));
  }

  Widget buildContentInfoRate() {
    return Row(
      children: [
        TStarRating(
          rating: item.rating,
          size: 20,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          '${item.rating}',
          style: TextStyle(fontSize: 16),
        )
      ],
    );
  }

  Widget buildContentInfoDesc() {
    final genresString = item.genres.join(" ");
    List<Actor> casts = item.casts;
    final actorString = item.casts.map((item) => item.name).join(" ");
    return Text("$genresString/$actorString",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 16));
  }

  Widget buildContentLine() {
    return Container(
      child: TDashedLine(
        axis: Axis.vertical,
        count: 10,
        dashedHeight: 6,
        dashedWidth: .5,
        color: Colors.pink,
      ),
    );
  }

  Widget buildContentWish() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/home/wish.png"),
          Text(
            "想看",
            style: TextStyle(
                fontSize: 18, color: Color.fromARGB(255, 235, 170, 60)),
          )
        ],
      ),
    );
  }

  Widget buildFooter() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Color(0xfff2f2f2), borderRadius: BorderRadius.circular(8)),
      child: Text(item.originalTitle,
          style: TextStyle(fontSize: 18, color: Color(0xff666666))),
    );
  }
}
