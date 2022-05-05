import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../constants.dart';
import '../controllers/session_controller.dart';

class SessionTextFieldEntry extends GetView<SessionController> {
  final placeholder;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final TextEditingController textEditingController;
  final bool onlyTopRadius = false;
  final bool onlyBottomRadius = false;
  final TextInputType keyboardType;

  SessionTextFieldEntry({
    Key? key,
    required this.placeholder,
    required this.keyboardType,
    required this.textEditingController,
    this.onSubmitted,
    this.onChanged,
    this.onEditingComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: textEditingController,
      keyboardType: keyboardType,
      cursorColor: kColourLight,
      decoration: BoxDecoration(
          color: kColourSidebarTile,
          borderRadius: BorderRadius.all(Radius.circular(9.0))),
      keyboardAppearance: Brightness.dark,
      placeholder: placeholder,
      placeholderStyle: kTextStyleTilePlaceholder,
      textCapitalization: TextCapitalization.sentences,
      style: kTextStyleTileText,
      suffix: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: FaIcon(
          CupertinoIcons.clear_circled_solid,
          color: kColourSuffixIcon,
        ),
      ),
      suffixMode: OverlayVisibilityMode.editing,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onSubmitted: onSubmitted,
      onTap: () {
        textEditingController.clear();
      },
    );
  }
}
