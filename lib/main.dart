import 'package:blog_club/carousel/carousel_slider.dart';
import 'package:blog_club/data.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const defaultFont = 'Avenir';
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final primaryTextColor = Color(0xff0D253c);
    final secondTextColor = Color(0xff2d4379);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: TextTheme(
          titleMedium: TextStyle(
            fontFamily: defaultFont,
            color: secondTextColor,
          ),
          titleLarge: TextStyle(
            fontFamily: defaultFont,
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
            fontSize: 18,
          ),
          bodyMedium: TextStyle(
            fontFamily: defaultFont,
            color: secondTextColor,
            fontSize: 12,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stories = AppDatabase.stories;
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hi, Mahshid!',
                      style: themeData.textTheme.titleMedium,
                    ),
                    Image.asset(
                      'assets/img/icons/notification.png',
                      width: 32,
                      height: 32,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 0, 24),
                child: Text(
                  'Explore Today',
                  style: themeData.textTheme.titleLarge,
                ),
              ),
              _StoryList(stories: stories),
              const SizedBox(height: 16),
              const _CategoryList(),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final Categories = AppDatabase.categories;
    return CarouselSlider.builder(
      itemCount: Categories.length,
      itemBuilder: (context, index, realIndex) {
        return _CategoryItem(
          left: realIndex == 0 ? 32 : 8,
          right: realIndex == Categories.length - 1 ? 32 : 8,
          category: Categories[realIndex],
        );
      },
      options: CarouselOptions(
        viewportFraction: 0.8,
        aspectRatio: 1.2,
        initialPage: 0,
        scrollPhysics: const BouncingScrollPhysics(),
        disableCenter: true,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final Category category;
  final double left;
  final double right;
  const _CategoryItem({
    super.key,
    required this.category,
    required this.left,
    required this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(left, 0, right, 0),
      child: Stack(
        children: [
          Positioned.fill(
            top: 100,
            right: 65,
            left: 65,
            bottom: 20,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(blurRadius: 20, color: Color(0xff0D253c)),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [Color(0xff0D253C), Colors.transparent],
                ),
              ),
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Colors.yellow,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Image.asset(
                  'assets/img/posts/large/${category.imageFileName}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 48,
            left: 32,
            child: Text(
              category.title,
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.apply(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _StoryList extends StatelessWidget {
  const _StoryList({super.key, required this.stories});

  final List<Story> stories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 90,
      child: ListView.builder(
        itemCount: stories.length,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
        itemBuilder: (context, index) {
          final story = stories[index];

          return _Story(story: story);
        },
      ),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({super.key, required this.story});
  final Story story;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
      child: Column(
        children: [
          Stack(
            children: [
              story.isViewed ? _ProfileViewed() : _ProfileStandard(),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  'assets/img/icons/${story.iconFileName}',
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),
          Text(story.name),
        ],
      ),
    );
  }

  Container _ProfileStandard() {
    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          colors: [Color(0xff376AED), Color(0xff49B0E2), Color(0xff9CECFB)],
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(5),
        child: _ProfileCheck(),
      ),
    );
  }

  Widget _ProfileViewed() {
    return SizedBox(
      width: 68,
      height: 68,
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 2,
        radius: const Radius.circular(24),
        color: const Color(0xff7B8BB2),
        dashPattern: const [5, 3],
        padding: EdgeInsets.all(7),
        child: Container(
          width: 68,
          height: 68,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(22)),
          child: Container(child: _ProfileCheck()),
        ),
      ),
    );
  }

  Widget _ProfileCheck() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(17),
      child: Image.asset('assets/img/stories/${story.imageFileName}'),
    );
  }
}
