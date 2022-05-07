import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:speedwatch/controllers/sidebar_controller.dart';

import '../constants.dart';
import '../enums/speed_range.dart';
import '../enums/vehicle_type.dart';

class SpringBoard extends StatelessWidget {
  final Function(SpeedRange, VehicleType) onPressed;

  const SpringBoard({
    Key? key,
    required Function(SpeedRange, VehicleType) this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SidebarController s = Get.find();
    return Column(
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
        ),
      ],
    );
  }
}

class SpeedButtonGroup extends StatelessWidget {
  final int minSpeed;
  final int? maxSpeed;
  final Gradient gradient;
  final Function(VehicleType) onPressed;

  const SpeedButtonGroup({
    Key? key,
    required int this.minSpeed,
    int? this.maxSpeed,
    required Gradient this.gradient,
    required Function(VehicleType) this.onPressed,
  }) : super(key: key);

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SpeedButton(
                  onPressed: () {
                    onPressed(VehicleType.passenger);
                  },
                  gradient: gradient,
                  icon: Icon(
                    Icons.directions_car,
                    size: 51.857,
                    color: Colors.white,
                  )),
              SpeedButton(
                  onPressed: () {
                    onPressed(VehicleType.transit);
                  },
                  gradient: gradient,
                  icon: Icon(
                    Icons.directions_bus,
                    size: 51.857,
                    color: Colors.white,
                  )),
              SpeedButton(
                  onPressed: () {
                    onPressed(VehicleType.largeTruck);
                  },
                  gradient: gradient,
                  icon: Icon(
                    Icons.local_shipping,
                    size: 51.857,
                    color: Colors.white,
                  )),
              SpeedButton(
                  onPressed: () {
                    onPressed(VehicleType.motorBike);
                  },
                  gradient: gradient,
                  icon: Icon(
                    Icons.motorcycle,
                    size: 51.857,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

class SpeedButton extends StatelessWidget {
  final Icon icon;
  final Gradient gradient;
  final Function() onPressed;

  const SpeedButton({
    Key? key,
    required Icon this.icon,
    required Gradient this.gradient,
    required Function() this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Container(
          width: 96,
          height: 96,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21.475),
              gradient: gradient,
              shape: BoxShape.rectangle),
          child: Center(
            child: icon,
          ),
        ));
  }
}
