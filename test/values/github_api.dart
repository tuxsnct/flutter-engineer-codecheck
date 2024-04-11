import 'package:github_viewer/features/search/infrastructure/models/search_repositories_model.dart';

final searchRepositoriesResponse = {
  'total_count': 40,
  'incomplete_results': false,
  'items': [
    {
      'name': 'Tetris',
      'full_name': 'dtrupenn/Tetris',
      'owner': {
        'login': 'dtrupenn',
        'avatar_url':
            'https://secure.gravatar.com/avatar/e7956084e75f239de85d3a31bc172ace?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png',
      },
      'description': 'Tetris',
      'stargazers_count': 1,
      'watchers_count': 1,
      'language': 'Assembly',
      'forks_count': 0,
      'open_issues_count': 0,
    }
  ],
};

final searchRepositoriesModel =
    SearchRepositoriesResponseModel.fromJson(searchRepositoriesResponse);
