# ✨ Flutter Floating Bottom Navigation Bar


Fully customizable floating bottom navigation package for flutter.

## 🎖 Installing

```yaml
dependencies:
  floating_bottom_navigation_bar: ^1.0.2
```

### ⚡️ Import

```dart
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
```

## 🎮 How To Use

```dart
    Scaffold(
          appBar: AppBar(
            title: Text('Example'),
          ),
          //If you want to show body behind the navbar, it should be true
          extendBody: true,
          bottomNavigationBar: FloatingNavbar(
            onTap: (int val) {
              //returns tab id which is user tapped
            },
            currentIndex: 0,
            items: [
              FloatingNavbarItem(icon: Icons.home, title: 'Home'),
              FloatingNavbarItem(icon: Icons.explore, title: 'Explore'),
              FloatingNavbarItem(icon: Icons.chat_bubble_outline, title: 'Chats'),
              FloatingNavbarItem(icon: Icons.settings, title: 'Settings'),
            ],
          ),
          
        );

```


<img width="450" height="900" src="https://github.com/godlessturtle/flutter_floating_bottom_navigation_bar/blob/master/image.png?raw=true">

### ❗️ Note

- Pull requests are welcomed, especially the animations :)

## ⭐️ License

MIT License
