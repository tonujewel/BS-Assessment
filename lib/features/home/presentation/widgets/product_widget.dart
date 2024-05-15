import 'package:bs_assessment/core/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/primary_container.dart';
import '../../domain/entities/product_entity.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      onTap: () {
        context.push(AppConstant.details, extra: product);
      },
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Hero(
              tag: product.id,
              child: CustomNetworkImage(
                path: product.thumbImage,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.enTitle,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      "BDT ",
                    ),
                    Text(
                      "${product.price}",
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
