import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_colour/github_colour.dart';
import 'package:github_viewer/features/common/infrastructure/models/repository_model.dart';

class RepositoryDetailScreen extends ConsumerWidget {
  const RepositoryDetailScreen({required this.repository, super.key});

  final RepositoryModel repository;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(repository.name),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (repository.owner != null) ...[
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(repository.owner!.avatarUrl),
                  ),
                  const SizedBox(width: 8),
                  Text(repository.owner!.login),
                ],
              ),
              const SizedBox(height: 8),
            ],
            if (repository.description != null) ...[
              Text(
                repository.description!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
            ],
            if (repository.language != null) ...[
              Row(
                children: [
                  const SizedBox(width: 2),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: GitHubColour.getExistedInstance()[
                          repository.language!],
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(repository.language!),
                ],
              ),
              const SizedBox(height: 8),
            ],
            Row(
              children: [
                const Icon(Icons.star),
                const SizedBox(width: 8),
                Text('${repository.stargazersCount} stars'),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/eye.svg',
                  width: 24,
                  height: 24,
                  colorFilter: Theme.of(context).iconTheme.color != null
                      ? ColorFilter.mode(
                          Theme.of(context).iconTheme.color!,
                          BlendMode.srcIn,
                        )
                      : null,
                ),
                const SizedBox(width: 8),
                Text('${repository.watchersCount} watching'),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/fork.svg',
                  width: 24,
                  height: 24,
                  colorFilter: Theme.of(context).iconTheme.color != null
                      ? ColorFilter.mode(
                          Theme.of(context).iconTheme.color!,
                          BlendMode.srcIn,
                        )
                      : null,
                ),
                const SizedBox(width: 8),
                Text('${repository.watchersCount} forks'),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/issue.svg',
                  width: 24,
                  height: 24,
                  colorFilter: Theme.of(context).iconTheme.color != null
                      ? ColorFilter.mode(
                          Theme.of(context).iconTheme.color!,
                          BlendMode.srcIn,
                        )
                      : null,
                ),
                const SizedBox(width: 8),
                Text('${repository.openIssuesCount} opened issues'),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
