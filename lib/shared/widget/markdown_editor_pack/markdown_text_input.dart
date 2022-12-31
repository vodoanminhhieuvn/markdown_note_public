import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import 'markdown_format.dart';

/// Widget with markdown buttons
class MarkdownTextInput extends StatefulWidget {
  /// Constructor for [MarkdownTextInput]
  const MarkdownTextInput(
    this.onTextChanged,
    this.initialValue, {
    super.key,
    this.label = '',
    this.focusNode,
    this.validators,
    this.textDirection = TextDirection.ltr,
    this.maxLines = 10,
    this.actions = const [
      MarkdownType.bold,
      MarkdownType.italic,
      MarkdownType.title,
      MarkdownType.link,
      MarkdownType.list
    ],
    this.controller,
  });

  /// Controller whether textfield is editing
  final FocusNode? focusNode;

  /// Callback called when text changed
  final Function onTextChanged;

  /// Initial value you want to display
  final String initialValue;

  /// Validator for the TextFormField
  final String? Function(String? value)? validators;

  /// String displayed at hintText in TextFormField
  final String? label;

  /// Change the text direction of the input (RTL / LTR)
  final TextDirection textDirection;

  /// The maximum of lines that can be display in the input
  final int? maxLines;

  /// List of action the component can handle
  final List<MarkdownType> actions;

  /// Optional controller to manage the input
  final TextEditingController? controller;

  @override
  MarkdownTextInputState createState() =>
      MarkdownTextInputState(controller ?? TextEditingController());
}

class MarkdownTextInputState extends State<MarkdownTextInput> {
  MarkdownTextInputState(this._controller);

  final TextEditingController _controller;
  TextSelection textSelection =
      const TextSelection(baseOffset: 0, extentOffset: 0);
  FocusNode get _focusNode => widget.focusNode ?? FocusNode();

  void onTap(MarkdownType type, {int titleSize = 1}) {
    final basePosition = textSelection.baseOffset;
    final noTextSelected =
        (textSelection.baseOffset - textSelection.extentOffset) == 0;

    final result = FormatMarkdown.convertToMarkdown(
      type,
      _controller.text,
      textSelection.baseOffset,
      textSelection.extentOffset,
      titleSize: titleSize,
    );

    _controller.value = _controller.value.copyWith(
      text: result.data,
      selection: TextSelection.collapsed(
        offset: basePosition + result.cursorIndex,
      ),
    );

    if (noTextSelected) {
      _controller.selection = TextSelection.collapsed(
        offset: _controller.selection.end - result.replaceCursorIndex,
      );
      _focusNode.requestFocus();
    }
  }

  @override
  void initState() {
    _controller
      ..text = widget.initialValue
      ..addListener(() {
        if (_controller.selection.baseOffset != -1) {
          textSelection = _controller.selection;
        }

        widget.onTextChanged(_controller.text);
      });
    super.initState();
  }

  @override
  void dispose() {
    if (widget.controller == null) _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: KeyboardActions(
            config: KeyboardActionsConfig(
              actions: <KeyboardActionsItem>[
                KeyboardActionsItem(
                  focusNode: _focusNode,
                  footerBuilder: (context) {
                    return PreferredSize(
                      preferredSize: const Size.fromHeight(48),
                      child: _buildEditorTool(),
                    );
                  },
                )
              ],
            ),
            child: TextFormField(
              focusNode: _focusNode,
              textInputAction: TextInputAction.newline,
              maxLines: widget.maxLines,
              controller: _controller,
              textCapitalization: TextCapitalization.sentences,
              validator: widget.validators != null
                  ? (value) => widget.validators!(value)
                  : null,
              style: Theme.of(context).textTheme.bodyText1,
              cursorColor: Theme.of(context).primaryColor,
              textDirection: widget.textDirection,
              decoration:
                  const InputDecoration.collapsed(hintText: 'Empty note'),
            ),
          ),
        ),
        //? ------
      ],
    );
  }

  // ignore: long-method
  Widget _buildEditorTool() {
    return SizedBox(
      height: 44,
      child: Material(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: widget.actions.map((type) {
            return type == MarkdownType.title
                ? ExpandableNotifier(
                    child: Expandable(
                      key: const Key('H#_button'),
                      collapsed: ExpandableButton(
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'H#',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      expanded: ColoredBox(
                        color: Colors.white10,
                        child: Row(
                          children: [
                            for (int i = 1; i <= 6; i++)
                              InkWell(
                                key: Key('H${i}_button'),
                                onTap: () => onTap(
                                  MarkdownType.title,
                                  titleSize: i,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'H$i',
                                    style: TextStyle(
                                      fontSize: (18 - i).toDouble(),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ExpandableButton(
                              child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: Icon(
                                  Icons.close,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : InkWell(
                    key: Key(type.key),
                    onTap: () => onTap(type),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(type.icon),
                    ),
                  );
          }).toList(),
        ),
      ),
    );
  }
}
