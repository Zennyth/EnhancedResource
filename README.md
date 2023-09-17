# ✨ Enhanced Resource Addon for Godot 4.1

[![Godot Version](https://img.shields.io/badge/Godot-4.1-brightgreen.svg)](https://godotengine.org)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

Enhanced Resource allows you to view resource with a name and an icon per instance directly inside you editor.
It is part of the "Enhanced" addon suite, a collection of tools designed to extend the power of the Godot Engine. From inventory systems to state charts, the Enhanced suite offers a plethora of tools for game development.

Without             |  With
:-------------------------:|:-------------------------:
![](https://raw.githubusercontent.com/Zennyth/EnhancedResource/main/examples/without.png)  |  ![](https://raw.githubusercontent.com/Zennyth/EnhancedResource/main/examples/with.png)

## Table of Contents

- [✨ Enhanced Resource Addon for Godot 4.1](#-enhanced-resource-addon-for-godot-41)
  - [Table of Contents](#table-of-contents)
  - [Installation ⚙️](#installation-️)
  - [Usage 🕹️](#usage-️)
  - [Documentation 📚](#documentation-)
  - [Contribute 🤝](#contribute-)
  - [License 📄](#license-)

## Installation ⚙️

1. Clone or download this repository.
2. Move the `enhanced_resource` folder into your project's `addons/` directory.
3. Activate the addon by going to `Project > Project Settings > Plugins` and enabling `Enhanced Resource`.

## Usage 🕹️

Once the addon is enabled, you will have access to a host of nodes, tools, and utilities that you can use directly in your game scenes. Navigate to the `addons/enhanced_resource/` directory to explore and use the available scripts.

## Documentation 📚

Under `Project > Project Settings > Editor > Resource`, you will find the properties for the name and the icon of the resources you want to display in the editor. You can change it to your liking.

There is also the class `EnhancedResource` that directly implement the default settings however, you do not need to inherit from it if you don't want to, just add the property into your resource and it will change automatically.

## Contribute 🤝

Want to help improve Enhanced Resource or suggest new features for the Enhanced suite? Here's how:

1. Fork this repository.
2. Make your changes or additions.
3. Create a pull request.

All contributions, feedback, and suggestions are welcome!

## License 📄

Enhanced Resource is open-source under the MIT license. Please refer to the [LICENSE](LICENSE.md) file for more details.

---

<p align="center">
    Made with ❤️ by Zennyth for the Godot Community.
</p>