# Github Viewer

株式会社ゆめみ Flutter エンジニアコードチェック課題
元のREADME.mdファイルは[README_original.md](README_original.md)を参照してください。

## 構成

Flutter: 3.22.0-0.1.pre
ルーター: [go_router](https://pub.dev/packages/go_router)
API: [retrofit](https://pub.dev/packages/retrofit), [dio](https://pub.dev/packages/dio), [freezed](https://pub.dev/packages/freezed), [json_serializable](https://pub.dev/packages/json_serializable))
DI, 状態管理: [riverpod](https://pub.dev/packages/riverpod)
国際化: flutter_localizations
テスト: [mockito](https://pub.dev/packages/mockito)
リント: [very_good_analysis](https://pub.dev/packages/very_good_analysis)

## こだわった点

### Git

普段から使っているGit-flowを採用して、開発を行いました。
また、IssueやPull Requestなどの機能も用いて開発を行いました。

### アーキテクチャ

下記のリンクを参考にクリーンアーキテクチャで開発を行いました。（以前このアーキテクチャの採用経験あり）
https://otakoyi.software/blog/flutter-clean-architecture-with-riverpod-and-supabase#heading-4

### テスト

テストについては、MockitoやRobotパターンを用いて記述しました。
Robotパターンを採用したことで、共通部分の記述を少なくすることができているかと思います。
また、Codecovを導入してカバレッジを確認できるようにしました。
一部テストできない部分は`// coverage:ignore`を使用していますが、カバレッジが高くなるように多くテストコードを記述しました。

[![codecov](https://codecov.io/gh/tuxsnct/flutter-engineer-codecheck/graph/badge.svg?token=69187G1FQX)](https://codecov.io/gh/tuxsnct/flutter-engineer-codecheck)

### UI/UX

Googleアプリを[pubspec.yaml](pubspec.yaml)イメージして開発を行いました。
リポジトリの検索には、既存に存在しているSearchBarやSearchAnchorを用いたことでリッチなアニメーションになっているかと思います。
また、ダイナミックカラーやダークモードなどの対応も行いました。

### CI/CD

テスト・リント: [.github/workflows/analyze-and-test.yml](.github/workflows/analyze-and-test.yml)
ビルド・デプロイ: [.github/workflows/deploy.yml]([.github/workflows/deploy.yml])

GitHub Actionsを使用して、テスト・リント・ビルド・デプロイを行えるようにしました。
また、ジョブやワークフローの分割を適切に行なって並列処理・キャッシュの導入などをすることで素早く完了するようにしました。
GitHub Actionsの時間制限を考慮して、時間のかかるデプロイは条件を使用して無駄なビルドが行われないようにしました。
特にiOSのビルドについてはLinux Runnerよりもかなり高いため、mainブランチでのみ実行するようにしています。
自動でのフォーマットは導入せず、手動でのフォーマットを行うようにしています。

### リント

[very_good_analysis](https://pub.dev/packages/very_good_analysis)を使用しました。
個人的にリンターの設定はコードの統一性を高めるために可能な限り厳しくした方が良いと考えているため、この設定を使用しました。

## 開発環境

FlutterについてはFlutter Webにおいてホットリロードが機能しなかったため、正しく動作するBeta版に変更しました。
なお、バージョン間での差異があるため、リリースビルド時はStable版・開発時はBeta版のような構成にはしておりません。
詳しくは下記のIssueをご参照ください。
https://github.com/tuxsnct/flutter-engineer-codecheck/issues/9

```
MacBook Air M2 24GB/512GB
Android Studio Iguana | 2023.2.1 Patch 1
Flutter 3.22.0-0.1.pre • channel beta • https://github.com/flutter/flutter.git
Framework • revision 29babcb32a (7 days ago) • 2024-04-03 17:17:04 -0500
Engine • revision 97550907b7
Tools • Dart 3.4.0 (build 3.4.0-282.1.beta) • DevTools 2.34.2
```
