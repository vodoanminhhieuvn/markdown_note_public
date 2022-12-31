import 'package:auto_route/auto_route.dart';

import '../../shared/base/base_page.dart';
import 'view/markdown_editor_page.dart';

const editorRoute =
    AutoRoute<EditorPopValue>(path: '/editor', page: MarkdownEditorPage);
