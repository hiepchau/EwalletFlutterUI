/*
import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/widgets.dart';

class SizeUtil {
  static const Size defaultSize = Size(360, 690);
  static SizeUtil _instance = SizeUtil._();

  late Size _uiSize;

  late Orientation _orientation;

  late double _screenWidth;
  late double _screenHeight;
  late bool _minTextAdapt;
  BuildContext? _context;
  late bool _splitScreenMode;

  SizeUtil._();

  factory SizeUtil() {
    return _instance;
  }

  static Future<void> ensureScreenSize([
    FlutterView? window,
    Duration duration = const Duration(milliseconds: 10),
  ]) async {
    final binding = WidgetsFlutterBinding.ensureInitialized();
    window ??= binding.window;

    if (window.viewConfiguration.geometry.isEmpty) {
      return Future.delayed(duration, () async {
        binding.deferFirstFrame();
        await ensureScreenSize(window, duration);
        return binding.allowFirstFrame();
      });
    }
  }

  Set<Element>? _elementsToRebuild;

  static void registerToBuild(
      BuildContext context, [
        bool withDescendants = false,
      ]) {
    (_instance._elementsToRebuild ??= {}).add(context as Element);

    if (withDescendants) {
      context.visitChildren((element) {
        registerToBuild(element, true);
      });
    }
  }

  static Future<void> init(
      BuildContext context, {
        Size designSize = defaultSize,
        bool splitScreenMode = false,
        bool minTextAdapt = false,
        bool scaleByHeight = false,
        Size? ds,
      }) async {
    final navigatorContext = Navigator.maybeOf(context)?.context as Element?;
    final mediaQueryContext =
    navigatorContext?.getElementForInheritedWidgetOfExactType<MediaQuery>();

    final initCompleter = Completer<void>();

    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
      mediaQueryContext?.visitChildElements((el) => _instance._context = el);
      if (_instance._context != null) initCompleter.complete();
    });

    final deviceData = MediaQuery.maybeOf(context);

    final deviceSize = ds ?? deviceData?.size ?? designSize;
    final orientation = deviceData?.orientation ??
        (deviceSize.width > deviceSize.height
            ? Orientation.landscape
            : Orientation.portrait);

    _instance
      .._context = scaleByHeight ? null : context
      .._uiSize = designSize
      .._splitScreenMode = splitScreenMode
      .._minTextAdapt = minTextAdapt
      .._orientation = orientation
      .._screenWidth = scaleByHeight ? (deviceSize.height * designSize.width) /
          designSize.height : deviceSize.width
      .._screenHeight = deviceSize.height;

    _instance._elementsToRebuild?.forEach((el) => el.markNeedsBuild());

    return initCompleter.future;
  }

  Orientation get orientation => _orientation;

  double get textScaleFactor =>
      _context != null ? MediaQuery.of(_context!).textScaleFactor : 1;

  double? get pixelRatio =>
      _context != null ? MediaQuery.of(_context!).devicePixelRatio : 1;

  double get screenWidth =>
      _context != null ? MediaQuery.of(_context!).size.width : _screenWidth;

  double get screenHeight =>
      _context != null ? MediaQuery.of(_context!).size.height : _screenHeight;

  double get statusBarHeight =>
      _context == null ? 0 : MediaQuery.of(_context!).padding.top;

  double get bottomBarHeight =>
      _context == null ? 0 : MediaQuery.of(_context!).padding.bottom;

  double get scaleWidth => screenWidth / _uiSize.width;

  double get scaleHeight =>
      (_splitScreenMode ? max(screenHeight, 700) : screenHeight) /
          _uiSize.height;

  double get scaleText =>
      _minTextAdapt ? min(scaleWidth, scaleHeight) : scaleWidth;

  double setWidth(num width) => width * scaleWidth;

  double setHeight(num height) => height * scaleHeight;

  double radius(num r) => r * min(scaleWidth, scaleHeight);

  double setSp(num fontSize) => fontSize * scaleText;

  Widget setVerticalSpacing(num height) => SizedBox(height: setHeight(height));

  Widget setVerticalSpacingFromWidth(num height) =>
      SizedBox(height: setWidth(height));

  Widget setHorizontalSpacing(num width) => SizedBox(width: setWidth(width));

  Widget setHorizontalSpacingRadius(num width) =>
      SizedBox(width: radius(width));

  Widget setVerticalSpacingRadius(num height) =>
      SizedBox(height: radius(height));
}

extension SizeExtension on num {
  double get w => SizeUtil().setWidth(this);

  double get h => SizeUtil().setHeight(this);

  double get r => SizeUtil().radius(this);

  double get sp => SizeUtil().setSp(this);

  double get spMin => min(toDouble(), sp);

  @Deprecated('use spMin instead')
  double get sm => min(toDouble(), sp);

  double get spMax => max(toDouble(), sp);

  double get sw => SizeUtil().screenWidth * this;

  double get sh => SizeUtil().screenHeight * this;

  Widget get verticalSpace => SizeUtil().setVerticalSpacing(this);

  Widget get verticalSpaceFromWidth =>
      SizeUtil().setVerticalSpacingFromWidth(this);

  Widget get horizontalSpace => SizeUtil().setHorizontalSpacing(this);

  Widget get horizontalSpaceRadius =>
      SizeUtil().setHorizontalSpacingRadius(this);

  Widget get verticalSpacingRadius =>
      SizeUtil().setVerticalSpacingRadius(this);
}

extension EdgeInsetsExtension on EdgeInsets {
  EdgeInsets get r => copyWith(
    top: top.r,
    bottom: bottom.r,
    right: right.r,
    left: left.r,
  );

  EdgeInsets get w => copyWith(
    top: top.w,
    bottom: bottom.w,
    right: right.w,
    left: left.w,
  );

  EdgeInsets get h => copyWith(
    top: top.h,
    bottom: bottom.h,
    right: right.h,
    left: left.h,
  );
}

extension BorderRaduisExtension on BorderRadius {
  BorderRadius get r => copyWith(
    bottomLeft: bottomLeft.r,
    bottomRight: bottomRight.r,
    topLeft: topLeft.r,
    topRight: topRight.r,
  );

  BorderRadius get w => copyWith(
    bottomLeft: bottomLeft.w,
    bottomRight: bottomRight.w,
    topLeft: topLeft.w,
    topRight: topRight.w,
  );

  BorderRadius get h => copyWith(
    bottomLeft: bottomLeft.h,
    bottomRight: bottomRight.h,
    topLeft: topLeft.h,
    topRight: topRight.h,
  );
}

extension RaduisExtension on Radius {
  Radius get r => Radius.elliptical(x.r, y.r);

  Radius get w => Radius.elliptical(x.w, y.w);

  Radius get h => Radius.elliptical(x.h, y.h);
}

extension BoxConstraintsExtension on BoxConstraints {
  BoxConstraints get r => this.copyWith(
    maxHeight: maxHeight.r,
    maxWidth: maxWidth.r,
    minHeight: minHeight.r,
    minWidth: minWidth.r,
  );

  BoxConstraints get hw => this.copyWith(
    maxHeight: maxHeight.h,
    maxWidth: maxWidth.w,
    minHeight: minHeight.h,
    minWidth: minWidth.w,
  );

  BoxConstraints get w => this.copyWith(
    maxHeight: maxHeight.w,
    maxWidth: maxWidth.w,
    minHeight: minHeight.w,
    minWidth: minWidth.w,
  );

  BoxConstraints get h => this.copyWith(
    maxHeight: maxHeight.h,
    maxWidth: maxWidth.h,
    minHeight: minHeight.h,
    minWidth: minWidth.h,
  );
}*/
