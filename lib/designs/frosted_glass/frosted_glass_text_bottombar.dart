// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:pro_image_editor/designs/frosted_glass/frosted_glass.dart';
import 'package:pro_image_editor/designs/whatsapp/whatsapp_color_picker.dart';
import 'package:pro_image_editor/pro_image_editor.dart';
import '../../modules/text_editor/widgets/text_editor_bottom_bar.dart';

class FrostedGlassTextBottomBar extends StatefulWidget {
  /// The configuration for the image editor.
  final ProImageEditorConfigs configs;

  final Color initColor;
  final ValueChanged<Color> onColorChanged;

  /// The currently selected text style.
  final TextStyle selectedStyle;

  /// Callback function for changing the text font style.
  final Function(TextStyle style) onFontChange;

  const FrostedGlassTextBottomBar({
    super.key,
    required this.configs,
    required this.initColor,
    required this.onColorChanged,
    required this.selectedStyle,
    required this.onFontChange,
  });

  @override
  State<FrostedGlassTextBottomBar> createState() =>
      _FrostedGlassTextBottomBarState();
}

class _FrostedGlassTextBottomBarState extends State<FrostedGlassTextBottomBar> {
  bool _showColorPicker = true;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      height: 46,
      child: FrostedGlassEffect(
        color: Colors.white12,
        padding: const EdgeInsets.all(3),
        radius: BorderRadius.zero,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  _showColorPicker = !_showColorPicker;
                });
              },
              icon: !_showColorPicker
                  ? const Icon(Icons.color_lens)
                  : Text(
                      'Aa',
                      style: widget
                          .configs.textEditorConfigs.customTextStyles?.first
                          .copyWith(
                        color: Colors.white,
                      ),
                    ),
              style: IconButton.styleFrom(backgroundColor: Colors.black38),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(14.0, 4, 1, 4),
              width: 1.5,
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            _showColorPicker
                ? Expanded(
                    child: WhatsAppColorPicker(
                      onColorChanged: widget.onColorChanged,
                      initColor: widget.initColor,
                    ),
                  )
                : Expanded(
                    child: TextEditorBottomBar(
                      configs: widget.configs,
                      selectedStyle: widget.selectedStyle,
                      onFontChange: widget.onFontChange,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}