import 'package:blog_club/article.dart';
import 'package:blog_club/carousel/carousel_slider.dart';
import 'package:blog_club/data.dart';
import 'package:blog_club/gen/assets.gen.dart';
import 'package:blog_club/gen/fonts.gen.dart';
import 'package:blog_club/home.dart';
import 'package:blog_club/profile.dart';
import 'package:blog_club/splash.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final primaryTextColor = Color(0xff0D253c);
    final secondTextColor = Color(0xff2d4379);
    final primaryColor = Color(0xff376AED);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStatePropertyAll(
              const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: FontFamily.avenir,
              ),
            ),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          primary: primaryColor,
          onPrimary: Colors.white,
          onSurface: primaryTextColor,
          surface: Colors.white,
        ),
        appBarTheme: AppBarTheme(
          titleSpacing: 32,
          backgroundColor: Colors.white,
          foregroundColor: primaryTextColor,
        ),
        snackBarTheme: SnackBarThemeData(backgroundColor: primaryColor),
        textTheme: TextTheme(
          titleMedium: TextStyle(
            fontFamily: FontFamily.avenir,
            color: secondTextColor,
          ),
          titleLarge: TextStyle(
            fontFamily: FontFamily.avenir,
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
            fontSize: 18,
          ),
          bodyMedium: TextStyle(
            fontFamily: FontFamily.avenir,
            color: secondTextColor,
            fontSize: 12,
          ),
          headlineSmall: TextStyle(
            fontFamily: FontFamily.avenir,
            fontWeight: FontWeight.w700,
            color: primaryTextColor,
            fontSize: 20,
          ),
          bodySmall: TextStyle(
            fontFamily: FontFamily.avenir,
            fontWeight: FontWeight.w400,
            color: primaryTextColor,
            fontSize: 14,
          ),
        ),
      ),
      // home: Stack(
      //   children: [
      //     Positioned.fill(child: const HomeScreen()),
      //     Positioned(bottom: 0, left: 0, right: 0, child: _BottomNavigation()),
      //   ],
      // ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

const int homeIndex = 0;
const int articleIndex = 1;
const int searchIndex = 2;
const int profileIndex = 3;
const double bottomNavigationHeight = 65;

class _MainScreenState extends State<MainScreen> {
  int selectedCreenIndex = homeIndex;

  GlobalKey<NavigatorState> _homeKey = GlobalKey();
  GlobalKey<NavigatorState> _articleKey = GlobalKey();
  GlobalKey<NavigatorState> _searchKey = GlobalKey();
  GlobalKey<NavigatorState> _profileKey = GlobalKey();

  late final map = {
    homeIndex: _homeKey,
    articleIndex: _articleKey,
    searchIndex: _searchKey,
    profileIndex: _profileKey,
  };

  Future<bool> _onWillPop() async {
    final NavigatorState currentSelectedNavigator =
        map[selectedCreenIndex]!.currentState!;
    if (currentSelectedNavigator.canPop()) {
      currentSelectedNavigator.pop();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (bool didPop, result) async {
        if (didPop) {
          return; // اگر صفحه pop شده، خروج انجام شود
        }

        final bool canExit = await _onWillPop();
        if (!canExit) {
          return; // اگر canPop داشت، خروج را متوقف کند
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              bottom: bottomNavigationHeight,
              child: IndexedStack(
                index: selectedCreenIndex, // مقدار متغیر را به index بدهید
                children: [
                  Navigator(
                    key: _homeKey,
                    onGenerateRoute:
                        (settings) => MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                  ),
                  Navigator(
                    key: _articleKey,
                    onGenerateRoute:
                        (settings) => MaterialPageRoute(
                          builder: (context) => ArticleScreen(),
                        ),
                  ),
                  Navigator(
                    key: _searchKey,
                    onGenerateRoute:
                        (settings) => MaterialPageRoute(
                          builder: (context) => SearchScreen(),
                        ),
                  ),
                  Navigator(
                    key: _profileKey,
                    onGenerateRoute:
                        (settings) => MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _BottomNavigation(
                selectedIndex: selectedCreenIndex,
                onTap: (int index) {
                  setState(() {
                    selectedCreenIndex = index; // تغییر صفحه بر اساس انتخاب
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'What Are You Looking For?',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  final Function(int index) onTap;
  final int selectedIndex;

  const _BottomNavigation({
    super.key,
    required this.onTap,
    required this.selectedIndex,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(blurRadius: 20, color: Color(0xaa9B8487)),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottomNavigationItem(
                    iconFileName: 'Home.png',
                    activeIconFileName: 'Home.png',
                    onTap: () {
                      onTap(homeIndex);
                    },
                    isActive: selectedIndex == homeIndex,
                    title: 'Home',
                  ),
                  BottomNavigationItem(
                    iconFileName: 'Articles.png',
                    activeIconFileName: 'Articles.png',
                    onTap: () {
                      onTap(articleIndex);
                    },
                    isActive: selectedIndex == articleIndex,
                    title: 'Article',
                  ),
                  Expanded(child: Container()),
                  BottomNavigationItem(
                    iconFileName: 'Search.png',
                    activeIconFileName: 'Search.png',
                    onTap: () {
                      onTap(searchIndex);
                    },
                    isActive: selectedIndex == searchIndex,
                    title: 'Search',
                  ),
                  BottomNavigationItem(
                    iconFileName: 'Menu.png',
                    activeIconFileName: 'Menu.png',
                    onTap: () {
                      onTap(profileIndex);
                    },
                    isActive: selectedIndex == profileIndex,
                    title: 'Menu',
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              width: 65,
              height: 85,
              alignment: Alignment.topCenter,
              child: Container(
                height: bottomNavigationHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.5),
                  color: Color(0xff376AED),
                  border: Border.all(color: Colors.white, width: 4),
                ),
                child: Image.asset('assets/img/icons/plus.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String activeIconFileName;
  final String title;
  final bool isActive;
  final Function() onTap;

  const BottomNavigationItem({
    super.key,
    required this.iconFileName,
    required this.activeIconFileName,
    required this.title,
    required this.onTap,
    required this.isActive,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/img/icons/$iconFileName'),
            SizedBox(height: 4),

            Text(
              title,
              style: TextStyle(
                color:
                    isActive
                        ? const Color(0xff376AED) // رنگ فعال
                        : Colors.grey, // رنگ غیرفعال
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
