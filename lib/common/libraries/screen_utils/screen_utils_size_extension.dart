part of screen_utils;

extension SizeExtension on num {
  double get w => ScreenUtils().setWidth(this);

  double get h => ScreenUtils().setHeight(this);

  double get r => ScreenUtils().radius(this);

  double get sp => ScreenUtils().setSp(this);

  double get sw => ScreenUtils().screenWidth * this;

  double get sh => ScreenUtils().screenHeight * this;
}
