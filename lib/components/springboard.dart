import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedwatch/controllers/sidebar_controller.dart';

import '../constants.dart';
import '../enums/speed_range.dart';
import '../enums/vehicle_type.dart';

class SpringBoard extends StatelessWidget {
  final Function(SpeedRange, VehicleType) onPressed;
  final double? iconSize;

  const SpringBoard({
    Key? key,
    required Function(SpeedRange, VehicleType) this.onPressed,
    double? this.iconSize = 82,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SidebarController s = Get.find();
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SpeedButtonGroup(
            minSpeed: 0,
            maxSpeed: s.currentSession.value.speedLimit,
            onPressed: (vehicleType) {
              onPressed(SpeedRange.green, vehicleType);
            },
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFA4F485),
                Color(0xFF64CD4C),
              ],
            ),
            iconSize: iconSize,
          ),
          SpeedButtonGroup(
            minSpeed: s.currentSession.value.speedLimit + 1,
            maxSpeed: s.currentSession.value.speedLimit + 10,
            onPressed: (vehicleType) {
              onPressed(SpeedRange.yellow, vehicleType);
            },
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFF9D96D),
                Color(0xFFF7CD53),
              ],
            ),
            iconSize: iconSize,
          ),
          SpeedButtonGroup(
            minSpeed: s.currentSession.value.speedLimit + 11,
            maxSpeed: s.currentSession.value.speedLimit + 20,
            onPressed: (vehicleType) {
              onPressed(SpeedRange.orange, vehicleType);
            },
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFF19838),
                Color(0xFFED6947),
              ],
            ),
            iconSize: iconSize,
          ),
          SpeedButtonGroup(
            minSpeed: s.currentSession.value.speedLimit + 20,
            onPressed: (vehicleType) {
              onPressed(SpeedRange.red, vehicleType);
            },
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFE5466B),
                Color(0xFFE9664B),
              ],
            ),
            iconSize: iconSize,
          ),
        ],
      ),
    );
  }
}

class SpeedButtonGroup extends StatelessWidget {
  static const double GOLDEN_RATIO = 1.61803398875;

  final int minSpeed;
  final int? maxSpeed;
  final Gradient gradient;
  final Function(VehicleType) onPressed;
  final double? iconSize;

  const SpeedButtonGroup({
    Key? key,
    required int this.minSpeed,
    int? this.maxSpeed,
    required Gradient this.gradient,
    required Function(VehicleType) this.onPressed,
    double? this.iconSize = 1024.0,
  }) : super(key: key);

  double getInnerCircleRadius(double h) {
    return h / (2 * pow(GOLDEN_RATIO, 2));
  }

  double getCentreCircleRadius(double h) {
    return sqrt(2) * getInnerCircleRadius(h);
  }

  double getOuterCircleRadius(double h) {
    return GOLDEN_RATIO * getCentreCircleRadius(h);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            maxSpeed != null
                ? 'Speed: ${minSpeed} to ${maxSpeed}'
                : 'Speed: Over ${minSpeed}',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
        Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              color: kColourSidebarTile,
              borderRadius: BorderRadius.circular(30)),
          child: Wrap(
            spacing: context.isPortrait ? 16 : 64,
            children: [
              SpeedButton(
                  onPressed: () {
                    onPressed(VehicleType.passenger);
                  },
                  gradient: gradient,
                  icon: Icon(
                    Icons.directions_car,
                    size: 2 * getCentreCircleRadius(iconSize!),
                    color: Colors.white,
                  ),
                  size: iconSize),
              SpeedButton(
                  onPressed: () {
                    onPressed(VehicleType.transit);
                  },
                  gradient: gradient,
                  icon: Icon(
                    Icons.directions_bus,
                    size: 2 * getCentreCircleRadius(iconSize!),
                    color: Colors.white,
                  ),
                  size: iconSize),
              SpeedButton(
                  onPressed: () {
                    onPressed(VehicleType.largeTruck);
                  },
                  gradient: gradient,
                  icon: Icon(
                    Icons.local_shipping,
                    size: 2 * getCentreCircleRadius(iconSize!),
                    color: Colors.white,
                  ),
                  size: iconSize),
              SpeedButton(
                  onPressed: () {
                    onPressed(VehicleType.motorBike);
                  },
                  gradient: gradient,
                  icon: Icon(
                    Icons.motorcycle,
                    size: 2 * getCentreCircleRadius(iconSize!),
                    color: Colors.white,
                  ),
                  size: iconSize),
            ],
          ),
        ),
      ],
    );
  }
}

class SpeedButton extends StatelessWidget {
  static const double IOS_8_CORNER_RADIUS = 0.2237;

  final Icon icon;
  final Gradient gradient;
  final Function() onPressed;
  final double? size;

  const SpeedButton({
    Key? key,
    required Icon this.icon,
    required Gradient this.gradient,
    required Function() this.onPressed,
    double? this.size = 1024.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size! * IOS_8_CORNER_RADIUS),
              gradient: gradient,
              shape: BoxShape.rectangle),
          child: Center(
            child: icon,
          ),
        ));
  }
}
