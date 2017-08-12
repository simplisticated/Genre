<p align="center" >
<img src="https://github.com/igormatyushkin014/Genre/blob/master/Images/logo_1024_300.png" alt="Genre" title="Genre">
</p>

<p align="center">
<a href="https://swift.org"><img src="https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat"></a>
<a href="https://cocoapods.org"><img src="https://img.shields.io/cocoapods/v/Genre.svg"></a>
<a href="https://cocoapods.org"><img src="https://img.shields.io/cocoapods/dt/Genre.svg"></a>
<a href="https://tldrlegal.com/license/mit-license"><img src="https://img.shields.io/badge/License-MIT-blue.svg?style=flat"></a>
</p>

# Text game engine

`Genre` is an engine for text games. It simplifies the logic part of text quest, allows developer to focus his attention on UI and don't spend additional time for creating logic from scratch.

## At a Glance

`Genre` for iOS is written in clean Swift of version 3.0. It supports CocoaPods so can be easily integrated in any project.

This library doesn't draw UI for your text game, but manages the logic of the game. Library will tell you when to draw and what to draw by special delegate protocol.

## How To Get Started

- Copy content of `iOS/Source` folder to your project.

or

- Use `Genre` cocoapod

## Requirements

* iOS 8.0 and later
* Xcode 8 and later

## Explanation

Let's start with library's terminology. Usually, text game is divided into many screens, where you can read instruction and select one of available options. Regular screen can look like this:

<p align="center">
<img src="https://github.com/igormatyushkin014/Genre/blob/master/Images/scene_example.png" alt="Scene example" title="Scene example" width="30%" height="30%">
</p>

Scene has its own text located on the top of the screen in the example above. Also, you can see three buttons with blue title: they are so-called `options`. Now let's mark all details from example screen:

<p align="center">
<img src="https://github.com/igormatyushkin014/Genre/blob/master/Images/scene_example_with_explanation.png" alt="Scene example" title="Scene example" width="30%" height="30%">
</p>

When user clicks any option, game should initiate transition to another scene depending on selected option. That's all that you need to know for the start.

## Usage

Each scene is defined by `Scene` struct with fields:
- `sceneID` (simple string that must be unique),
- `content` (the black text displayed in example above, optional),
- `options` (collection of available options).

Text and image in scene are optional, so they could be used together or not used at all (depends on your game's UI).

Next thing that you should learn is the option. It's presented by `Option` struct with fields:
- `optionID` (unique string),
- `text` (title of the button in example above),
- `transitionTo` (ID of scene that should appear when user selected the option).

Usual scenario may look like this:

```swift
let scenes = [
    Scene(
        sceneID: "initial",
        content: TextContent(
            text: "Hello, man!\nI came in peace."
        ),
        options: [
            Option(
                optionID: "say-hello-stranger",
                text: "Hello, stranger.",
                transitionTo: "final"
            ),
            Option(
                optionID: "say-do-not-disturb-me",
                text: "Hey, don't disturb me!",
                transitionTo: "final"
            ),
            Option(
                optionID: "say-hey",
                text: "Hey!",
                transitionTo: "final"
            ),
        ]
    ),
    Scene(
        sceneID: "final",
        content: TextContent(
            text: "Bye!"
        ),
        options: [
            Option(
                optionID: "say-well-bye",
                text: "Well, bye.",
                transitionTo: "initial"
            ),
            Option(
                optionID: "say-bye",
                text: "Bye.",
                transitionTo: "initial"
            ),
            Option(
                optionID: "say-good-bye",
                text: "Good bye.",
                transitionTo: "initial"
            ),
        ]
    ),
]
```

More detailed example you can see in [demo project](https://github.com/igormatyushkin014/Genre/blob/master/iOS/Genre/GenreDemo/GenreDemo/ViewControllers/Main/MainViewController.swift).

In the example above, content is presented by `TextContent` class with `text` argument:

```swift
TextContent(
    text: "Example text"
)
```

Actually, it's not limited with text content only. You can use `ImageContent`:

```swift
ImageContent(
    image: UIImage(named: "dark_sky")
)
```

Also, you can create your own custom content class, which should be a subclass of `Content`:

```swift
class CustomContent: Content {
    var text: String!
    var color: UIColor!
    var font: UIFont!
    
    init(text: String, color: UIColor, font: UIFont) {
        super.init()
        self.text = text
        self.color = color
        self.font = font
    }
}
```

Then use your custom content class in scene's description:

```swift
Scene(
    sceneID: "final",
    content: CustomContent(
        text: "What's your age?",
        color: .orange,
        font: UIFont(name: "HelveticaNeue", size: 20.0)
    ),
    options: [
        Option(
            optionID: "say-well-bye",
            text: "Well, bye.",
            transitionTo: "initial"
        ),
        Option(
            optionID: "say-bye",
            text: "Bye.",
            transitionTo: "initial"
        ),
        Option(
            optionID: "say-good-bye",
            text: "Good bye.",
            transitionTo: "initial"
        ),
    ]
)
```

## License

`Genre` is available under the MIT license. See the [LICENSE](./LICENSE) file for more info.
