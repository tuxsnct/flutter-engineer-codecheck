import 'package:flutter/material.dart';

final _lightColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.blue,
);

ThemeData lightTheme(ColorScheme? lightColorScheme) => ThemeData(
      colorScheme: lightColorScheme ?? _lightColorScheme,
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: _lightColorScheme.primaryContainer,
      appBarTheme: ThemeData.light()
          .appBarTheme
          .copyWith(backgroundColor: _lightColorScheme.primaryContainer),
      listTileTheme: ThemeData.dark()
          .listTileTheme
          .copyWith(tileColor: _lightColorScheme.inversePrimary),
      searchBarTheme: ThemeData.light().searchBarTheme.copyWith(
            backgroundColor:
                WidgetStatePropertyAll(_lightColorScheme.secondaryContainer),
          ),
      searchViewTheme: ThemeData.light()
          .searchViewTheme
          .copyWith(backgroundColor: _lightColorScheme.secondaryContainer),
    );

final _darkColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.blue,
  brightness: Brightness.dark,
);

ThemeData darkTheme(ColorScheme? darkColorScheme) => ThemeData(
      colorScheme: darkColorScheme ?? _darkColorScheme,
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: _darkColorScheme.primaryContainer,
      appBarTheme: ThemeData.dark()
          .appBarTheme
          .copyWith(backgroundColor: _darkColorScheme.primaryContainer),
      listTileTheme: ThemeData.dark()
          .listTileTheme
          .copyWith(tileColor: _darkColorScheme.inversePrimary),
      searchBarTheme: ThemeData.dark().searchBarTheme.copyWith(
            backgroundColor:
                WidgetStatePropertyAll(_darkColorScheme.secondaryContainer),
          ),
      searchViewTheme: ThemeData.dark()
          .searchViewTheme
          .copyWith(backgroundColor: _darkColorScheme.secondaryContainer),
    );
