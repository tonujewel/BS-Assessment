import 'package:bs_assessment/features/home/domain/entities/repository_entity.dart';

class OwenerModel extends OwnerEntity {
  const OwenerModel({
    required super.login,
    required super.avatarUrl,
    required super.htmlUrl,
  });

  factory OwenerModel.fromJson(Map<String, dynamic> json) => OwenerModel(
        login: json["login"] ?? "",
        avatarUrl: json["avatar_url"] ?? "",
        htmlUrl: json["html_url"] ?? "",
      );
}

class RepositoryModel extends RepositoryEntity {
  const RepositoryModel({
    required super.stargazersCount,
    required super.watchersCount,
    required super.description,
    required super.updatedAt,
  });

  factory RepositoryModel.fromJson(Map<String, dynamic> json) => RepositoryModel(
        stargazersCount: json["stargazers_count"] ?? "",
        watchersCount: json["watchers_count"] ?? "",
        description: json["description"] ?? "",
        updatedAt: json["updated_at"] ?? "",
      );
}

