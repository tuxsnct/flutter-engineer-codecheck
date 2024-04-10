import 'package:flutter/material.dart';
import 'package:github_viewer/features/common/infrastructure/models/repository_model.dart';

class RepositoryDetailScreen extends StatefulWidget {
  const RepositoryDetailScreen({required this.repository, super.key});

  final RepositoryModel repository;

  @override
  State<RepositoryDetailScreen> createState() => RepositoryDetailScreenState();
}

@visibleForTesting
class RepositoryDetailScreenState extends State<RepositoryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.repository.fullName),
      ),
    );
  }
}
