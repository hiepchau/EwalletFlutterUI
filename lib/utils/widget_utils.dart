import 'package:ewallet/utils/list_utils.dart';
import 'package:flutter/material.dart';

class WidgetUtils {
  static List<Widget> stackEvenlyWidthDivide(
      double maxWidth, double perWidgetWidth, List<Widget> list) {
    final widgets = <Widget>[];
    double divideWidth =
        (maxWidth - perWidgetWidth * list.length) / (list.length + 1);

    widgets.add(SizedBox(width: divideWidth));
    var left = divideWidth;

    for (var i = 0; i < list.length; i++) {
      widgets.add(Positioned(left: left, child: list[i]));
      left += perWidgetWidth;
      widgets.add(Positioned(left: left, child: SizedBox(width: divideWidth)));
      left += divideWidth;
    }

    return widgets;
  }

  static List<List<Widget>> stackEvenlyWidthDivideWrap(double maxWidth, double perWidgetWidth, int itemPerRow, List<Widget> list) {
    List<List<Widget>> rows = ListUtils.splitList(list, itemPerRow);
    List<List<Widget>> result = [];
    for (var i = 0; i < rows.length; i++) {
      result.add(stackEvenlyWidthDivide(maxWidth, perWidgetWidth, rows[i]));
    }
    return result;
  }
}