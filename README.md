# contextmenu_plus

 [![Pub Version](https://img.shields.io/pub/v/contextmenu_plus?label=Published&logo=flutter&style=flat-square)](https://pub.dev/packages/contextmenu_plus)

Fork with [contextmenu](https://gitlab.com/TheOneWithTheBraid/contextmenu) with some improvements, thanks to the original project.

Display a beautiful material context menu using pure Flutter. It works both on touch devices and on desktop devices.

## Screenshots

[![Demo Screen Recording](https://raw.githubusercontent.com/monkeyWie/flutter_contextmenu_plus/main/example/demo.webp?inline=false)](https://raw.githubusercontent.com/monkeyWie/flutter_contextmenu_plus/main/example/demo.webp)

## Features

* modern, emphasizing animation according to material design guidelines
* handles screen edges and oversize
* very efficient code (< 250 lines)

## Getting Started

You can easily display a context menu using the following code:

```dart
Widget build() {
  return ContextMenuArea(
    items: [
      ListTile(
        title: Text('Option 1'),
        onTap: () {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Whatever')));
        },
      )
    ],
    child: Card(
      color: Theme
          .of(context)
          .primaryColor,
      child: Center(
        child: Text('Press somewhere for context menu.'),
      ),
    ),
  );
}
```

A more complicated way manually triggering a context menu using `showContextMenu()` is:

```dart
Widget build() {
  return GestureDetector(
      onSecondaryTapDown: (details) =>
          showContextMenu(
              details.globalPosition, context, items, verticalPadding, width),
      child: Text('Tap!'));
}
```

## Setup web

For the web, you need disable the context menu of the browser, for example:

```dart
@override
  void initState() {
    super.initState();
    // On web, disable the browser's context menu since this example uses a custom
    // Flutter-rendered context menu.
    if (kIsWeb) {
      BrowserContextMenu.disableContextMenu();
    }
  }

  @override
  void dispose() {
    if (kIsWeb) {
      BrowserContextMenu.enableContextMenu();
    }
    super.dispose();
  }
```

## License

This project is EUPL licensed. For further details, consult [LICENSE](LICENSE).
