# ✨ Flutter Floating Bottom Navigation Bar WITH SOME UI UPDATES ✨


Fully customizable floating bottom navigation package for flutter.

USAGE

There is two type of bottom nav bar widget.
You can either use 'title' and title displayes at the bottom of the icons
OR
You dont use 'title' attribute and the half-circle appears at the bottom of the selected icon.
To try this, uncomment the title attribute in FloatingNavbarItem

## 🎮 How To Use

```dart
    Scaffold(
          appBar: AppBar(
            title: Text('Example'),
          ),
          //If you want to show body behind the navbar, it should be true
          extendBody: true,
          bottomNavigationBar: FloatingNavbar(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            selectedBackgroundColor: Colors.transparent,
            backgroundColor: Palette.bottomNavBarColor,
            selectedItemColor: Palette.darkGrey,
            unselectedItemColor: Palette.lightGrey,
            borderRadius: 10,
            onTap: (int val) => setState(() => selectedIndex = val),
            currentIndex: selectedIndex,
            items: [
              FloatingNavbarItem(
                selectedIcon: Icons.home,
                unselectedIcon: Icons.home_outlined,
                //title: "Home",
              ),
              FloatingNavbarItem(
                selectedIcon: Icons.chat_bubble,
                unselectedIcon: Icons.chat_bubble_outline,
                //title: "Chat",
              ),
              FloatingNavbarItem(
                selectedIcon: Icons.person,
                unselectedIcon: Icons.person_outline,
                //title: "User",
              ),
              FloatingNavbarItem(
                selectedIcon: Icons.notifications,
                unselectedIcon: Icons.notifications_none,
                //title: "Alert",
              ),
              FloatingNavbarItem(
                selectedIcon: Icons.ac_unit,
                unselectedIcon: Icons.ac_unit,
                //title: "Other",
              ),
            ],
          ),
          
        );

```

![alt text](https://github.com/montaag/flutter_floating_bottom_navigation_bar/blob/master/with_title.png)
![alt text](https://github.com/montaag/flutter_floating_bottom_navigation_bar/blob/master/without_title.png)



### ❗️ Note

- Pull requests are welcomed, especially the animations :)

## ⭐️ License

MIT License
