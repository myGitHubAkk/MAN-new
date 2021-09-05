import 'package:flutter/widgets.dart';
import 'package:man_project/const/value_widget_visibility.dart';
import 'package:man_project/data/xp.dart';
import 'package:man_project/presentation/home_screen/back_widget/template/back_widget_template.dart';
import 'package:man_project/presentation/widget_template.dart';

class DestroyingObjects extends StatefulWidget {
  final top;
  final left;
  final valueVisibility;

  DestroyingObjects({
    @required this.top,
    @required this.left,
    @required this.valueVisibility,
  });

  @override
  _DestroyingObjectsState createState() => _DestroyingObjectsState();
}

class _DestroyingObjectsState extends State<DestroyingObjects> {
  @override
  Widget build(BuildContext context) {
    //double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    print(widget.valueVisibility);

    Map position = {
      'top': widget.top,
      'left': widget.left,
    };

    if (widget.valueVisibility == lvlWhichNotVisibleTreshLeft) {
      return Xp.xpFractional < widget.valueVisibility
          ? BackWidgetTemplate(
              poosition: position, width: 85.0, height: 85.0, name: 'Мусор')
          : Container();
    } else if (widget.valueVisibility == lvlWhichNotVisibleTreshRight) {
      return Xp.xpFractional < widget.valueVisibility
          ? BackWidgetTemplate(
              poosition: position, width: 70.0, height: 70.0, name: 'Мусор')
          : Container();
    } else if (widget.valueVisibility == lvlWhichNotVisibleFactory) {
      return Xp.xpFractional < widget.valueVisibility
          ? BackWidgetTemplate(
              poosition: {
                'top': position['top'],
                'left': widthScreen - position['left']
              },
              width: 70.0,
              height: 70.0,
              name: 'Завод',
            )
          : Container(
              child: Stack(
                children: [
                  Windmill(
                    top: position['top'] - 10.0,
                    left: position['left'],
                  ),
                  Windmill(
                    top: position['top'] - 30.0,
                    left: position['left'] - 30.0,
                  ),
                  Windmill(
                    top: position['top'] - 30.0,
                    left: position['left'] - 50.0,
                  ),
                ],
              ),
            );
    }

    return Container();
  }
}

class Windmill extends StatelessWidget {
  final top;
  final left;
  Windmill({@required this.top, @required this.left});

  @override
  Widget build(BuildContext context) {
    Map position = {
      'top': top,
      'left': left,
    };

    return BackWidgetTemplate(
        poosition: position, width: 50.0, height: 100.0, name: 'Вітряк');
  }
}
