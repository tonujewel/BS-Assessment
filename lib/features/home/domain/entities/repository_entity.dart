import 'package:equatable/equatable.dart';

class OwnerEntity extends Equatable {
  final String login;
  final String avatarUrl;
  final String htmlUrl;

  const OwnerEntity({required this.login, required this.avatarUrl, required this.htmlUrl});

  @override
  List<Object?> get props => [
        login,
        avatarUrl,
        htmlUrl,
      ];
}

class RepositoryEntity extends Equatable {
  final int stargazersCount;
  final int watchersCount;
  final String description;
  final String updatedAt;

  const RepositoryEntity({
    required this.stargazersCount,
    required this.watchersCount,
    required this.description,
    required this.updatedAt,
  });
  @override
  List<Object?> get props => [
        stargazersCount,
        watchersCount,
        description,
        updatedAt,
      ];
}
