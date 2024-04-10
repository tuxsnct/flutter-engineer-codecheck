import 'package:flutter/material.dart';
import 'package:github_viewer/features/common/infrastructure/models/repository_model.dart';

class RepositoryCard extends StatelessWidget {
  const RepositoryCard({required this.repository, this.onTap, super.key});

  final RepositoryModel repository;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: SizedBox(
          height: double.infinity,
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(repository.owner?.avatarUrl ?? ''),
          ),
        ),
        trailing: const SizedBox(
          height: double.infinity,
          child: Icon(Icons.arrow_forward),
        ),
        title: Text(repository.fullName),
        subtitle: Text(repository.description ?? ''),
        isThreeLine: true,
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        subtitleTextStyle: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
