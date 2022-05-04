import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class SpringBoard extends StatelessWidget {
  const SpringBoard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Speed: 0 to 50',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              color: kColourSidebarTile,
              borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CupertinoButton(
                  borderRadius: const BorderRadius.all(Radius.circular(150)),
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.475),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFA4F485),
                            Color(0xFF64CD4C),
                          ],
                        ),
                        shape: BoxShape.rectangle),
                    child: const Center(
                      child: Icon(
                        Icons.directions_car,
                        size: 51.857,
                        color: Colors.white,
                      ),
                    ),
                  )),
              CupertinoButton(
                  borderRadius: const BorderRadius.all(Radius.circular(150)),
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.475),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFA4F485),
                            Color(0xFF64CD4C),
                          ],
                        ),
                        shape: BoxShape.rectangle),
                    child: const Center(
                      child: Icon(
                        Icons.directions_bus,
                        size: 51.857,
                        color: Colors.white,
                      ),
                    ),
                  )),
              CupertinoButton(
                  borderRadius: const BorderRadius.all(Radius.circular(150)),
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.475),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFA4F485),
                            Color(0xFF64CD4C),
                          ],
                        ),
                        shape: BoxShape.rectangle),
                    child: const Center(
                      child: Icon(
                        Icons.local_shipping,
                        size: 51.857,
                        color: Colors.white,
                      ),
                    ),
                  )),
              CupertinoButton(
                  borderRadius: const BorderRadius.all(Radius.circular(150)),
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.475),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFA4F485),
                            Color(0xFF64CD4C),
                          ],
                        ),
                        shape: BoxShape.rectangle),
                    child: const Center(
                      child: Icon(
                        Icons.motorcycle,
                        size: 51.857,
                        color: Colors.white,
                      ),
                    ),
                  )),
            ],
          ),
        ),
        Text(
          'Speed: 51 to 60',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              color: kColourSidebarTile,
              borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CupertinoButton(
                  borderRadius: const BorderRadius.all(Radius.circular(150)),
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.475),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFF9D96D),
                            Color(0xFFF7CD53),
                          ],
                        ),
                        shape: BoxShape.rectangle),
                    child: const Center(
                      child: Icon(
                        Icons.directions_car,
                        size: 51.857,
                        color: Colors.white,
                      ),
                    ),
                  )),
              CupertinoButton(
                  borderRadius: const BorderRadius.all(Radius.circular(150)),
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.475),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFF9D96D),
                            Color(0xFFF7CD53),
                          ],
                        ),
                        shape: BoxShape.rectangle),
                    child: const Center(
                      child: Icon(
                        Icons.directions_bus,
                        size: 51.857,
                        color: Colors.white,
                      ),
                    ),
                  )),
              CupertinoButton(
                  borderRadius: const BorderRadius.all(Radius.circular(150)),
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.475),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFF9D96D),
                            Color(0xFFF7CD53),
                          ],
                        ),
                        shape: BoxShape.rectangle),
                    child: const Center(
                      child: Icon(
                        Icons.local_shipping,
                        size: 51.857,
                        color: Colors.white,
                      ),
                    ),
                  )),
              CupertinoButton(
                  borderRadius: const BorderRadius.all(Radius.circular(150)),
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.475),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFF9D96D),
                            Color(0xFFF7CD53),
                          ],
                        ),
                        shape: BoxShape.rectangle),
                    child: const Center(
                      child: Icon(
                        Icons.motorcycle,
                        size: 51.857,
                        color: Colors.white,
                      ),
                    ),
                  )),
            ],
          ),
        ),
        Text(
          'Speed: 61 to 70',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              color: kColourSidebarTile,
              borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CupertinoButton(
                  borderRadius: const BorderRadius.all(Radius.circular(150)),
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.475),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFF19838),
                            Color(0xFFED6947),
                          ],
                        ),
                        shape: BoxShape.rectangle),
                    child: const Center(
                      child: Icon(
                        Icons.directions_car,
                        size: 51.857,
                        color: Colors.white,
                      ),
                    ),
                  )),
              CupertinoButton(
                  borderRadius: const BorderRadius.all(Radius.circular(150)),
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.475),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFF19838),
                            Color(0xFFED6947),
                          ],
                        ),
                        shape: BoxShape.rectangle),
                    child: const Center(
                      child: Icon(
                        Icons.directions_bus,
                        size: 51.857,
                        color: Colors.white,
                      ),
                    ),
                  )),
              CupertinoButton(
                  borderRadius: const BorderRadius.all(Radius.circular(150)),
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.475),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFF19838),
                            Color(0xFFED6947),
                          ],
                        ),
                        shape: BoxShape.rectangle),
                    child: const Center(
                      child: Icon(
                        Icons.local_shipping,
                        size: 51.857,
                        color: Colors.white,
                      ),
                    ),
                  )),
              CupertinoButton(
                  borderRadius: const BorderRadius.all(Radius.circular(150)),
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.475),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFF19838),
                            Color(0xFFED6947),
                          ],
                        ),
                        shape: BoxShape.rectangle),
                    child: const Center(
                      child: Icon(
                        Icons.motorcycle,
                        size: 51.857,
                        color: Colors.white,
                      ),
                    ),
                  )),
            ],
          ),
        ),
        Text(
          'Speed: Over 70',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              color: kColourSidebarTile,
              borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CupertinoButton(
                  borderRadius: const BorderRadius.all(Radius.circular(150)),
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.475),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFE5466B),
                            Color(0xFFE9664B),
                          ],
                        ),
                        shape: BoxShape.rectangle),
                    child: const Center(
                      child: Icon(
                        Icons.directions_car,
                        size: 51.857,
                        color: Colors.white,
                      ),
                    ),
                  )),
              CupertinoButton(
                  borderRadius: const BorderRadius.all(Radius.circular(150)),
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.475),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFE5466B),
                            Color(0xFFE9664B),
                          ],
                        ),
                        shape: BoxShape.rectangle),
                    child: const Center(
                      child: Icon(
                        Icons.directions_bus,
                        size: 51.857,
                        color: Colors.white,
                      ),
                    ),
                  )),
              CupertinoButton(
                  borderRadius: const BorderRadius.all(Radius.circular(150)),
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.475),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFE5466B),
                            Color(0xFFE9664B),
                          ],
                        ),
                        shape: BoxShape.rectangle),
                    child: const Center(
                      child: Icon(
                        Icons.local_shipping,
                        size: 51.857,
                        color: Colors.white,
                      ),
                    ),
                  )),
              CupertinoButton(
                  borderRadius: const BorderRadius.all(Radius.circular(150)),
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.475),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFE5466B),
                            Color(0xFFE9664B),
                          ],
                        ),
                        shape: BoxShape.rectangle),
                    child: const Center(
                      child: Icon(
                        Icons.motorcycle,
                        size: 51.857,
                        color: Colors.white,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
