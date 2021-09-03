import 'package:flutter/widgets.dart';
import 'package:man_project/const/value_widget_visibility.dart';
import 'package:man_project/data/xp.dart';
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
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    Map position = {
      'top': widget.top,
      'left': widget.left,
    };

    if (widget.valueVisibility == lvlWhichNotVisibleTreshLeft) {
      return Xp.xpFractional < widget.valueVisibility
          ? DestroyingObjectTemplate(
              poosition: position, width: 70.0, height: 70.0, name: 'Мусор')
          : Container();
    } else if (widget.valueVisibility == lvlWhichNotVisibleFactory) {
      return Xp.xpFractional < widget.valueVisibility
          ? DestroyingObjectTemplate(
              poosition: position, width: 70.0, height: 70.0, name: 'Завод')
          : Positioned(
              top: heightScreen - position['top'] - 10.0,
              left: widthScreen - position['left'] - 20.0,
              child: Stack(
                children: [
                  Windmill(
                    top: heightScreen - position['top'] - 10.0,
                    left: widthScreen - position['left'],
                  ),
                  Windmill(
                    top: heightScreen - position['top'] - 30.0,
                    left: widthScreen - position['left'] - 50.0,
                  ),
                  Windmill(
                    top: heightScreen - position['top'] - 30.0,
                    left: widthScreen - position['left'] - 100.0,
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

    return Positioned(
      top: heightScreen - poosition['top'],
      left: widthScreen - poosition['left'],
      child: backgroundImage(
        name: name,
        width: width,
        height: height,
      ),
    );
  }
}
