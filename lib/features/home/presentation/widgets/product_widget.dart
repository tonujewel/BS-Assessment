import 'package:bs_assessment/core/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/primary_container.dart';
import '../../domain/entities/repository_entity.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.data,
  });

  final RepositoryEntity data;

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      onTap: () {
        context.push(AppConstant.details, extra: data);
      },
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Hero(
              tag: data.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CustomNetworkImage(
                  path: data.owner.avatarUrl,
                  fit: BoxFit.cover,
                ),
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
                  data.fullName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  data.owner.login,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.star_outline),
                    const SizedBox(width: 10),
                    Text(
                      "${data.stargazersCount}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.remove_red_eye_outlined),
                    const SizedBox(width: 10),
                    Text(
                      "${data.watchersCount}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios_rounded)
        ],
      ),
    );
  }
}
