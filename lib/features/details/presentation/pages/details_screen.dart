import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_network_image.dart';
import '../../../home/domain/entities/product_entity.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.data});

  final ProductEntity data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: ListView(
        children: [
          Hero(
            tag: data.id,
            child: CustomNetworkImage(
              path: data.thumbImage,
            ),
          ),
          Text(data.enTitle),
        ],
      ),
    );
  }
}
