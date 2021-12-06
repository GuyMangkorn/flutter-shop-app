import 'package:flutter/material.dart';
import 'package:shop_app/models/product_model.dart';

import '../../../constants.dart';

class ColorAndSize extends StatefulWidget {
  const ColorAndSize({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<ColorAndSize> createState() => _ColorAndSizeState();
}

class _ColorAndSizeState extends State<ColorAndSize> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Color'),
              Row(
                children: [
                  ColorDot(
                      color: widget.product.color,
                      isSelected: selectedIndex == 0 ? true : false,
                      press: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      }),
                  ColorDot(
                      color: Color(0xFFF8C078),
                      isSelected: selectedIndex == 1 ? true : false,
                      press: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      }),
                  ColorDot(
                      color: Color(0xFFA29B9B),
                      isSelected: selectedIndex == 2 ? true : false,
                      press: () {
                        setState(() {
                          selectedIndex = 2;
                        });
                      }),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: kTextColor),
              children: [
                const TextSpan(text: "Size\n"),
                TextSpan(
                  text: '${widget.product.size} cm',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final Function press;
  const ColorDot({
    Key? key,
    required this.color,
    required this.isSelected,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => press(),
      child: Container(
        margin: const EdgeInsets.only(
          top: kDefaultPaddin / 4,
          right: kDefaultPaddin / 2,
        ),
        padding: const EdgeInsets.all(2.5),
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? color : Colors.transparent,
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
