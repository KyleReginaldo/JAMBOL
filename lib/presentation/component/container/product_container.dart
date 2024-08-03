// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:jumbled/data/model/product_model.dart';

import '../../../common/theme.dart';
import '../typography/j_text.dart';

class ProductContainer extends StatelessWidget {
  final VoidCallback? ontap;
  final ProductModel product;
  const ProductContainer({
    super.key,
    this.ontap,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: 300,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: JTheme.tertiaryColor,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.imageLink,
              height: 200,
              width: 300,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8),
              child: JText(
                '₱ ${product.price}',
                size: 20,
                weight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8),
              child: JText(
                product.productName,
                size: 20,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0, bottom: 8, right: 0),
              child: JText(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
