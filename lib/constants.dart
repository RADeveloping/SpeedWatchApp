import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/material.dart';

const kColourSidebarBackground = Color(0xFF1C1C1E);
const kColourRightPaneBackground = Color(0xFF222224);

const kColourSidebarTile = Color(0xFF2C2C2E);
const kColourSidebarTileText = Colors.white;
const kColourTileDivider = Color(0xFF48484A);
const kColourSuffixIcon = Color(0xFF8E8E93);

const kTextStyleWelcomeMessage =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);

const kTextStylePlaceHelpPlaceholder = TextStyle(
  fontSize: 16,
  color: Color(0xFF8E8E93),
);

const kTextStyleTileText = TextStyle(
  color: Colors.white,
);

const kTextStyleTilePlaceholder = TextStyle(
  color: Color(0xFF8D8D92),
);

const kColourLight = Color(0xFFEA938A);

const kTextStyleLargeTitle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 32,
);

const kTextStyleLargeLight = TextStyle(
  color: kColourLight,
  fontWeight: FontWeight.bold,
  fontSize: 32,
);

const kTextStyleSidebarTile = TextStyle(
  fontSize: 16,
);

// SELECTED CHIP

const choiceActiveStyle = C2ChoiceStyle(
  backgroundColor: kColourLight,
  padding: EdgeInsets.all(10.0),
  color: Colors.white,
  borderColor: Colors.transparent,
  labelStyle: TextStyle(
    fontSize: 16,
  ),
  borderRadius: BorderRadius.all(Radius.circular(8)),
);

const choiceStyle = C2ChoiceStyle(
  color: Colors.white,
  labelStyle: TextStyle(
    fontSize: 16,
  ),
  padding: EdgeInsets.all(10.0),
  backgroundColor: kColourSidebarTile,
  borderColor: kColourLight,
  borderRadius: BorderRadius.all(Radius.circular(5)),
);
