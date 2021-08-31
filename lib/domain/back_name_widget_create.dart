import 'package:man_project/data/xp.dart';

class BackNameWidgetCreate {
  String _nameWidget = '';

  set create(Map widget) {
    _create(widget);
  }

  String get name {
    return _nameWidget;
  }

  void _create(Map widget) {
    for (var i = 0; i < widget.keys.length; i++) {
      if (i == widget.keys.length) {
        if (Xp.xpFractional > widget['ValuesVisibility'].values.elementAt(i)) {
          _nameWidget = widget['WidgetName'][i];
        }
      } else {
        if (Xp.xpFractional >= widget['ValuesVisibility'].values.elementAt(i) &&
            Xp.xpFractional <
                widget['ValuesVisibility'].values.elementAt(i + 1)) {
          _nameWidget = widget['WidgetName'][i];
        }
      }
    }
  }
}
