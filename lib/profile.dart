import 'package:blog_club/data.dart';
import 'package:blog_club/gen/assets.gen.dart';
import 'package:blog_club/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themData = Theme.of(context);
    final posts = AppDatabase.posts;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffFBFCFF).withValues(alpha: 0.0),
        title: const Text('Profile'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz_rounded)),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(32, 0, 32, 32),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(16),
                    color: themData.colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        color: Color(0xff0D253c).withValues(alpha: 0.1),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Assets.img.stories.story9.image(
                                width: 84,
                                height: 84,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('@mebrahim'),
                                  SizedBox(height: 2),
                                  Text(
                                    'Mahshid Shirazi',
                                    style: themData.textTheme.bodyMedium!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    'Mobile Application Developer',
                                    style: themData.textTheme.bodyMedium!.apply(
                                      color: themData.colorScheme.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
                        child: Text(
                          'About me',
                          style: themData.textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 4, 32, 0),
                        child: Text(
                          'Mobile App Developer experienced in building IOS and Android applications using Flutter.',
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),

                Positioned(
                  bottom: 7,
                  left: 64,
                  right: 64,
                  child: Container(
                    height: 68,
                    decoration: BoxDecoration(
                      color: themData.colorScheme.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xff2151CD),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Text(
                                  '52',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: themData.colorScheme.onPrimary,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Post',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w200,
                                    color: themData.colorScheme.onPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '250',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: themData.colorScheme.onPrimary,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Following',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w200,
                                  color: themData.colorScheme.onPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '4.5K',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: themData.colorScheme.onPrimary,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Followers',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w200,
                                  color: themData.colorScheme.onPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: themData.colorScheme.surface,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'My Posts',
                            style: themData.textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Assets.img.icons.grid.svg(),
                          color: themData.colorScheme.primary,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Assets.img.icons.table.svg(),
                          color: themData.colorScheme.primary,
                        ),
                      ],
                    ),
                  ),
                  for (var i = 0; i < posts.length; i++) Posts(post: posts[i]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
