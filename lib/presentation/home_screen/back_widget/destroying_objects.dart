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
  double _sizeTreshLeft = 100;
  double _sizeTreshRight = 90;

  @override
  Widget build(BuildContext context) {
    //double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    Map position = {
      'top': widget.top,
      'left': widget.left,
    };

    if (widget.valueVisibility == lvlWhichNotVisibleTreshLeft) {
      return Xp.xpFractional < widget.valueVisibility
          ? BackWidgetTemplate(
              poosition: position,
              width: _sizeTreshLeft,
              height: _sizeTreshLeft,
              name: 'Мусор',
            )
          : BackWidgetTemplate(
              poosition: position,
              width: _sizeTreshLeft,
              height: _sizeTreshLeft,
              name: 'квіточка',
            );
    } else if (widget.valueVisibility == lvlWhichNotVisibleTreshRight) {
      return Xp.xpFractional < widget.valueVisibility
          ? BackWidgetTemplate(
              poosition: position,
              width: _sizeTreshRight,
              height: _sizeTreshRight,
              name: 'Мусор',
            )
          : Container(
              width: _sizeTreshRight,
            );
    } else if (widget.valueVisibility == lvlWhichNotVisibleFactory) {
      //print('${widthScreen - position['left']}');
      return Xp.xpFractional < widget.valueVisibility
          ? BackWidgetTemplate(
              poosition: {
                'top': position['top'],
                'left': widthScreen - position['left']
              },
              width: 70.0,
              height: 60.0,
              name: 'Завод',
            )
          : Container(
              child: Stack(
                children: [
                  Windmill(
                    top: position['top'] - 30.0,
                    left: widthScreen - position['left'] + 40.0,
                  ),
                  Windmill(
                    top: position['top'] - 20.0,
                    left: widthScreen - position['left'] + 10.0,
                  ),
                  Windmill(
                    top: position['top'] - 10.0,
                    left: widthScreen - position['left'] - 20.0,
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
        poosition: position, width: 50.0, height: 100.0, name: 'вітряк');
  }
}
