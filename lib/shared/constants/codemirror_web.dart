const codeMirrorWeb = '''
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, user-scalable=no" />
    <link
      rel="stylesheet"
      href="https://unpkg.com/codemirror@VERSION/lib/codemirror.css"
    />
    <link
      rel="stylesheet"
      href="https://unpkg.com/codemirror@VERSION/theme/EDITOR_THEME.css"
    />
    <title>Editor</title>
    <style>
      body {
        margin: 0px;
        padding: 0px;
        background: black;
      }
      #content {
        width: 100%;
        height: 100vh;
      }
    </style>
  </head>
  <body>
    <div id="content"></div>
    <script src="https://unpkg.com/codemirror@VERSION/lib/codemirror.js"></script>
    <script src="https://unpkg.com/codemirror@VERSION/mode/EDITOR_MODE/EDITOR_MODE.js"></script>
    <script type="text/javascript">
      const element = document.querySelector("#content");
      const editor = CodeMirror(element, {
        lineNumbers: true,
        theme: "EDITOR_THEME",
        mode: "EDITOR_MODE",
      });
      editor.setSize("100%", "100%");
      editor.on("change", (event) => {
        const value = event.getValue();
        MessageInvoker.postMessage(value);
      });
      editor.refresh();
    </script>
  </body>
</html>
''';
