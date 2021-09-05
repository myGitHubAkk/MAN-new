import 'package:flutter/widgets.dart';
import 'package:man_project/const/value_widget_visibility.dart';
import 'package:man_project/data/xp.dart';
import 'package:man_project/presentation/widget_template.dart';

class DestroyingObjects extends StatefulWidget {
  final bottom;
  final right;
  final valueVisibility;

  DestroyingObjects({
    @required this.bottom,
    @required this.right,
    @required this.valueVisibility,
  });

  @override
  _DestroyingObjectsState createState() => _DestroyingObjectsState();
}

class _DestroyingObjectsState extends State<DestroyingObjects> {
  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    print(widget.valueVisibility);

    Map position = {
      'bottom': widget.bottom,
      'right': widget.right,
    };

    if (widget.valueVisibility == lvlWhichNotVisibleTreshLeft) {
      return Xp.xpFractional < widget.valueVisibility
          ? DestroyingObjectTemplate(
              poosition: position, width: 85.0, height: 85.0, name: 'Мусор')
          : Container();
    } else if (widget.valueVisibility == lvlWhichNotVisibleTreshRight) {
      return Xp.xpFractional < widget.valueVisibility
          ? DestroyingObjectTemplate(
              poosition: position, width: 70.0, height: 70.0, name: 'Мусор')
          : Container();
    } else if (widget.valueVisibility == lvlWhichNotVisibleFactory) {
      return Xp.xpFractional < widget.valueVisibility
          ? DestroyingObjectTemplate(
              poosition: position, width: 70.0, height: 70.0, name: 'Завод')
          : Positioned(
              bottom: heightScreen - position['bottom'] - 10.0,
              right: widthScreen - position['right'] - 20.0,
              child: Stack(
                children: [
                  Windmill(
                    bottom: heightScreen - position['bottom'] - 10.0,
                    right: widthScreen - position['right'],
                  ),
                  Windmill(
                    bottom: heightScreen - position['bottom'] - 30.0,
                    right: widthScreen - position['right'] - 50.0,
                  ),
                  Windmill(
                    bottom: heightScreen - position['bottom'] - 30.0,
                    right: widthScreen - position['right'] - 100.0,
                  ),
                ],
              ),
            );
    }

    return Container();
  }
}

class Windmill extends StatelessWidget {
  final bottom;
  final right;
  Windmill({@required this.bottom, @required this.right});

  @override
  Widget build(BuildContext context) {
    Map position = {
      'bottom': bottom,
      'right': right,
    };

    return DestroyingObjectTemplate(
        poosition: position, width: 50.0, height: 100.0, name: 'Вітряк');
  }
}

class DestroyingObjectTemplate extends StatelessWidget {
  final width;
  final height;
  final poosition;
  final name;

  DestroyingObjectTemplate(
      {@required this.poosition,
      @required this.width,
      @required this.height,
      @required this.name});

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    print(heightScreen - poosition['bottom']);

    return Positioned(
      top: heightScreen - poosition['bottom'],
      left: widthScreen - poosition['right'],
      child: backgroundImage(
        name: name,
        width: width,
        height: height,
      ),
    );
  }
}
