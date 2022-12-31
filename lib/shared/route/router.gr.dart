// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/foundation.dart' as _i6;
import 'package:flutter/material.dart' as _i4;
import 'package:markdown_note_mobile/app/widget/app_start_page.dart' as _i1;
import 'package:markdown_note_mobile/feature/markdown_editor/view/markdown_editor_page.dart'
    as _i2;
import 'package:markdown_note_mobile/shared/base/base_page.dart' as _i5;
import 'package:markdown_note_mobile/shared/model/model.dart' as _i7;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    AppStartRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.AppStartPage(),
      );
    },
    MarkdownEditorRoute.name: (routeData) {
      final args = routeData.argsAs<MarkdownEditorRouteArgs>();
      return _i3.AdaptivePage<_i5.EditorPopValue>(
        routeData: routeData,
        child: _i2.MarkdownEditorPage(
          key: args.key,
          note: args.note,
          notebookID: args.notebookID,
        ),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          AppStartRoute.name,
          path: '/',
        ),
        _i3.RouteConfig(
          MarkdownEditorRoute.name,
          path: '/editor',
        ),
      ];
}

/// generated route for
/// [_i1.AppStartPage]
class AppStartRoute extends _i3.PageRouteInfo<void> {
  const AppStartRoute()
      : super(
          AppStartRoute.name,
          path: '/',
        );

  static const String name = 'AppStartRoute';
}

/// generated route for
/// [_i2.MarkdownEditorPage]
class MarkdownEditorRoute extends _i3.PageRouteInfo<MarkdownEditorRouteArgs> {
  MarkdownEditorRoute({
    _i6.Key? key,
    required _i7.NoteModel note,
    String? notebookID,
  }) : super(
          MarkdownEditorRoute.name,
          path: '/editor',
          args: MarkdownEditorRouteArgs(
            key: key,
            note: note,
            notebookID: notebookID,
          ),
        );

  static const String name = 'MarkdownEditorRoute';
}

class MarkdownEditorRouteArgs {
  const MarkdownEditorRouteArgs({
    this.key,
    required this.note,
    this.notebookID,
  });

  final _i6.Key? key;

  final _i7.NoteModel note;

  final String? notebookID;

  @override
  String toString() {
    return 'MarkdownEditorRouteArgs{key: $key, note: $note, notebookID: $notebookID}';
  }
}
