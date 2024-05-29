import 'package:bs_assessment/core/utils/app_utils.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/primary_container.dart';
import '../../../home/domain/entities/repository_entity.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.data});

  final RepositoryEntity data;

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
                path: data.owner.avatarUrl,
                height: 300,
              ),
            ),
          ),
          PrimaryContainer(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  data.owner.login,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  "Last Update : ${AppUtils.getDateTime(data.updatedAt)}",
                ),
                const SizedBox(height: 10),
                Text(
                  data.description,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
