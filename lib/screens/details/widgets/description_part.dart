import 'package:flutter/material.dart';
import 'package:shop_app/models/product_model.dart';

import '../../../constants.dart';

class DescriptionPart extends StatelessWidget {
  const DescriptionPart({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Text(
        product.description,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
