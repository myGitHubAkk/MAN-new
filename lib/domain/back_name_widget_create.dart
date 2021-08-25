import 'package:man_project/data/xp.dart';

class BackNameWidgetCreate {
  String _nameWidget = '';

  set create(Map widget) {
    _create(widget);
  }

  String get name => _nameWidget;

  void _create(Map widget) {
    for (var i = 0; i < widget.keys.length; i++) {
      if (i == widget.keys.length) {
        if (Xp.xpFractional > widget['ValuesVisibility']![i]) {
          _nameWidget = widget['WidgetName']![i];
        }
      } else {
        if (Xp.xpFractional > widget['ValuesVisibility']![i]! &&
            Xp.xpFractional < widget['ValuesVisibility']![i + 1]!) {
          _nameWidget = widget['WidgetName']![i];
        }
      }
    }
  }
}
