import 'package:bs_assessment/features/home/domain/entities/repository_entity.dart';

class RepositoryResponse {
  final List<RepositoryModel>? results;
  final bool? success;

  RepositoryResponse({this.results, this.success});

  factory RepositoryResponse.fromJson(Map<String, dynamic> json) => RepositoryResponse(
        results: json["items"] == null
            ? []
            : List<RepositoryModel>.from(json["items"]!.map((x) => RepositoryModel.fromJson(x))),
        success: json["incomplete_results"],
      );
}

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
  const RepositoryModel(
      {required super.id,
      required super.stargazersCount,
      required super.watchersCount,
      required super.description,
      required super.updatedAt,
      required super.owner,
      required super.fullName});

  factory RepositoryModel.fromJson(Map<String, dynamic> json) => RepositoryModel(
        id: json["id"] ?? "",
        stargazersCount: json["stargazers_count"] ?? "",
        watchersCount: json["watchers_count"] ?? "",
        description: json["description"] ?? "",
        updatedAt: json["updated_at"] ?? "",
        owner: OwenerModel.fromJson(json["owner"]),
        fullName: json["full_name"] ?? "",
      );
}
