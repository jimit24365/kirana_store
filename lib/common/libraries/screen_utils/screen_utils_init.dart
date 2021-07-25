part of screen_utils;

class ScreenUtilsInit extends StatelessWidget {
  const ScreenUtilsInit({
    this.builder,
    this.designSize = ScreenUtils.defaultSize,
    Key key,
  }) : super(key: key);

  final Widget Function() builder;

  final Size designSize;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (_, constraints) => OrientationBuilder(
          builder: (_, orientation) {
            if (constraints.maxWidth != 0) {
              ScreenUtils.init(
                constraints,
                orientation: orientation,
                designSize: designSize,
              );

              return builder();
            }

            return Container();
          },
        ),
      );
}
