import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final IconData icon;
  final int maxRating;
  final double currentRating;
  final Color activeColor;
  final Color inactiveColor;

  Rating(this.icon, this.maxRating, this.currentRating, this.activeColor,
      this.inactiveColor);

  Row _buildRating() {
    List<Widget> rateIconList = List<Widget>();

    for (var i = 0; i < maxRating; i++) {
      var iconColor =
          currentRating.floor() <= i ? this.inactiveColor : this.activeColor;

      rateIconList.add(Padding(
        padding: const EdgeInsets.all(1.0),
        child: Icon(
          icon,
          size: 15.0,
          color: iconColor,
        ),
      ));
    }

//    var textRating = Container(
//      padding: const EdgeInsets.only(left: 12.0),
//      child: RichText(
//        text: TextSpan(
//          children: <TextSpan>[
//            TextSpan(text: "$currentRating/", style: TextStyle(fontWeight: FontWeight.w900, color: this.activeColor)),
//            TextSpan(text: "$maxRating", style: TextStyle(fontWeight: FontWeight.w900, color: this.inactiveColor)),
//          ],
//
//        ),
//      ),
//    );
//
//    rateIconList.add(textRating);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: rateIconList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildRating();
  }
}
