import 'package:flutter/material.dart';
import 'boss.dart';

class BossDetailsPage extends StatefulWidget {
  final Boss boss;

  BossDetailsPage({required this.boss});

  @override
  _BossDetailsPageState createState() => _BossDetailsPageState();
}

class _BossDetailsPageState extends State<BossDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    Widget buildDetails() {
      return  Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Détails du boss :",
              style: TextStyle(
                color: Colors.amber,
                fontSize: 20
              ),
            ),
            Text(
              "Localisation : ${widget.boss.location}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
              ),
            ),
            Text(
                "Runes gagnés : ${widget.boss.numberOfRune}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                )
            ),
            Text(
                widget.boss.descripiton,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17
                )
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.boss.name,
          style: TextStyle(
              color: Colors.amber,
              fontSize: 20,
              fontWeight: FontWeight.bold
          )
        ),
        leading: BackButton(
            color: Colors.amber
        ),
      ),
      body: Container(
        color: Colors.black87,
        child: orientation == Orientation.portrait
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: CircleAvatar(
                radius: 130,
                foregroundImage: AssetImage(
                  widget.boss.getImage(),
                ),
              ),
            ),
            Expanded(
                child: buildDetails()
            ),
          ],
        )
            : Row(
          children: [
            Expanded(
              child: CircleAvatar(
                radius: 140,
                foregroundImage: AssetImage(
                  widget.boss.getImage(),
                ),
              ),
            ),
            Expanded(
              child: buildDetails(),
            ),
          ],
        ),
      ),
    );
  }
}

