import 'package:flutter/material.dart';
import 'package:sabka_kirana/common/utils/widget_utils.dart';

class ProductItem extends StatelessWidget {
  final double width;
  final dynamic productData;

  const ProductItem({Key key, @required this.width, @required this.productData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final height = width * 4 / 3;
    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: width,
      height: height + 10,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(flex: 2, child: Container()),
              Expanded(
                flex: 5,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0,30,10,10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: CircleAvatar(
                  radius: width * 0.30,
                  foregroundImage: AssetImage(
                    productData['image'],
                  ),
                )),
                Expanded(child: Center()),
                Text(
                  "${productData['name']}",
                  style: textTheme.headline6,
                ),
                addVerticalSpace(5),
                RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(children: [
                      WidgetSpan(
                          child: Icon(Icons.location_on,
                              color: Colors.red, size: 15)),
                      TextSpan(
                          text: "${productData['rest']}",
                          style: textTheme.caption)
                    ])),
                addVerticalSpace(15),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: RichText(
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(children: [
                            WidgetSpan(
                                child: Icon(Icons.star,
                                    color: Colors.orange, size: 15)),
                            TextSpan(
                                text: "${productData['rating']}",
                                style: textTheme.subtitle2
                                    ?.apply(fontWeightDelta: 4))
                          ])),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
