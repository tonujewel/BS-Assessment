import 'package:bs_assessment/core/utils/app_extension.dart';
import 'package:bs_assessment/core/widgets/primary_container.dart';
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
        padding: const EdgeInsets.all(20),
        children: [
          PrimaryContainer(
            child: Hero(
              tag: data.id,
              child: CustomNetworkImage(
                path: data.thumbImage,
                height: 300,
              ),
            ),
          ),
          PrimaryContainer(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  data.enTitle,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  data.description.stripHtml(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
