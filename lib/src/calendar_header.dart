import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/src/default_styles.dart'
    show defaultHeaderTextStyle;

class CalendarHeader extends StatelessWidget {
  /// Passing in values for [leftButtonIcon] or [rightButtonIcon] will override [headerIconColor]
  const CalendarHeader({
    super.key,
    required this.headerTitle,
    this.headerMargin,
    required this.showHeader,
    this.headerTextStyle,
    this.showLeftHeaderButtons = true,
    this.showRightHeaderButtons = true,
    this.headerIconColor,
    this.leftButtonIcon,
    this.rightButtonIcon,
    required this.onLeftButtonPressed,
    required this.onRightButtonPressed,
    this.onHeaderTitlePressed,
  })  : isTitleTouchable = onHeaderTitlePressed != null;

  final String headerTitle;
  final EdgeInsetsGeometry? headerMargin;
  final bool showHeader;
  final TextStyle? headerTextStyle;
  final bool showLeftHeaderButtons;
  final bool showRightHeaderButtons;
  final Color? headerIconColor;
  final Widget? leftButtonIcon;
  final Widget? rightButtonIcon;
  final VoidCallback onLeftButtonPressed;
  final VoidCallback onRightButtonPressed;
  final bool isTitleTouchable;
  final VoidCallback? onHeaderTitlePressed;

  TextStyle get getTextStyle => headerTextStyle ?? defaultHeaderTextStyle;

  Widget _leftButton() => IconButton(
        onPressed: onLeftButtonPressed,
        icon:
            leftButtonIcon ?? Icon(Icons.chevron_left, color: headerIconColor),
      );

  Widget _rightButton() => IconButton(
        onPressed: onRightButtonPressed,
        icon: rightButtonIcon ??
            Icon(Icons.chevron_right, color: headerIconColor),
      );

  Widget _headerTouchable() => TextButton(
        onPressed: onHeaderTitlePressed,
        child: Text(
          headerTitle,
          semanticsLabel: headerTitle,
          style: getTextStyle,
        ),
      );

  @override
  Widget build(BuildContext context) => showHeader
      ? Container(
          margin: headerMargin,
          child: DefaultTextStyle(
              style: getTextStyle,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    if (showLeftHeaderButtons)
                      _leftButton()
                    else
                      Container(width: 48),
                    if (isTitleTouchable)
                      _headerTouchable()
                    else
                      Text(
                          headerTitle.isNotEmpty
                              ? headerTitle[0].toUpperCase() +
                                  headerTitle.substring(1)
                              : headerTitle,
                          style: getTextStyle),
                    if (showRightHeaderButtons)
                      _rightButton()
                    else
                      Container(width: 48),
                  ])),
        )
      : Container();
}
