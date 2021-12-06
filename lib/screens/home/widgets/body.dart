import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/screens/details/details_screen.dart';

import 'categories.dart';
import 'item_card.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            'Women',
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: kDefaultPaddin,
                mainAxisSpacing: kDefaultPaddin,
              ),
              itemBuilder: (ctx, index) => ItemCard(
                  product: products[index],
                  press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) =>
                              DetailScreen(product: products[index]),
                        ),
                      )),
            ),
          ),
        )
      ],
    );
  }
}
