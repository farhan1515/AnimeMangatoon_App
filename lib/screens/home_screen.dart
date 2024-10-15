import 'package:animemangatoon_app/screens/detail_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> categories = const [
    {
      'title': 'Hello Baby',
      'genre': 'Romance',
      'image': 'assets/images/a1.png',
      'creator': 'Enjelicious',
      'description':
          'Gwen is a kind and passionate young woman with a tragic backstory. Her mother died when she was young, and her stepmother and stepsister treated her even worse with the demise of her father. Before dying, her father suggests she go on a cruise vacation with her best friend when her partner broke up with her to focus on his career instead. On the vacation, she meets Arthur, a handsome but lonely young man. Things escalate between them when they share their unfortunate fates. They end up hooking up, but Gwen runs away, afraid of the outcome. Fate brings them 2 years later, and they end up in a legal fight when Arthur finds out about his and Gwen’s child. Read Hello Baby to learn whether they can solve their differences.'
    },
    {
      'title': 'The Alpha King’s Claim',
      'genre': 'Romance',
      'image': 'assets/images/a2.png',
      'creator': 'JMFelic',
      'description':
          'Do you believe in supernatural creatures like werewolves, vampires, and witches? How would you feel if one day you were transported to a different realm when you touched a painting? The same thing happened with Serena in The Alpha King’s Claim. One rainy day, she buys an interesting painting while taking shelter in a painting shop. When she touched the painting at her home, she got transported to the realm where werewolves lived. Moreover, she ends up on the bed of the Alpha King Aero, who hates all women.'
    },
    {
      'title': 'Bitten Contract',
      'genre': 'Romance',
      'image': 'assets/images/a3.png',
      'creator': 'Sungeun',
      'description':
          'Do you believe vampires exist? What would your first reaction be if you crossed paths with a vampire? Would you be delighted, terrified, or unsure of how to act? Well, Chae-i certainly had an unusual reaction than the others. Chae-i is an actress who has been in the entertainment industry ever since she can remember. However, she is been having a hard time fitting in with other actors due to the extremely painful headaches she started having a little while ago. As a consequence of this, her professional life started deteriorating.'
    },
    {
      'title': 'Tricked into Becoming the Heroine’s Stepmother',
      'genre': 'Fantasy',
      'image': 'assets/images/a4.png',
      'creator': 'Hariheen',
      'description':
          'Everyone started thinking of her as some stuck-up actress. However, one time, she gets bitten by Ijun, a top actor who is a vampire. Surprisingly, her headache vanishes for a week. Hence, she asks him to continue biting her to keep everything going smoothly. To her surprise, Ijun asks for a contractual relationship in return. Read the popular webtoon, Bitten Contract, to find out his motive behind asking Chae-i for a relationship.'
    },
    {
      'title': 'The Guy Upstairs',
      'genre': 'Thriller',
      'image': 'assets/images/a5.png',
      'creator': 'Hanza Art',
      'description':
          'How would you feel if one day you woke up in the novel you wrote just after dying in the real world? Would you feel ecstatic to have a chance to live again? Or would you feel scared because of the uncertain possibilities and the danger lurking? Daisy is a woman with a kind yet strong personality. Following her death in the real world, she wakes up in the novel she wrote with her nine other friends just for fun. Unfortunately, her living conditions do not change much. However, one random day, she is arrested by the duke’s soldier for helping her friend out.'
    },
    {
      'title': 'The Runaway',
      'genre': 'Romance',
      'image': 'assets/images/a6.png',
      'creator': 'Domi, Nokdu',
      'description':
          'The Guy Upstairs follows Rosy, a college undergraduate who is an orphan and barely makes ends meet by working odd jobs. However, her life is not too tough, especially because of her best friend Hawa. She supported and trusted her when nobody else did. However, strangely enough, she hears weird sounds coming from the floor above. One random day she decides to check just for her peace of mind, but wait, why is there a dead body of a woman? Moreover, why is she being dragged by her neighbor upstairs?'
    },
    {
      'title': 'Your Smile Is A Trap',
      'genre': 'Romance',
      'image': 'assets/images/a7.png',
      'creator': 'Aengo',
      'description':
          'Paris is known as the city of love by the whole world. Would you consider going there freshly after a breakup? Jian is a beautiful young woman who works in the fashion industry. One day, she discovers that her new handsome boss is the person she had been hooked up with in France. She dismisses it, thinking that he probably does not remember her since it has been so long. However, she is proved wrong. On top of it all, he is extremely rude to her in the office but too nice when alone. Also, the new gay couple that shifted next door is quite interesting. Scroll the popular webtoon The Runaway to know what happens when Jian’s ex tries patching up things with her and why the handsome neighbor is too kind to her.'
    },
    {
      'title': 'There Must Be Happy Endings',
      'genre': 'Romance',
      'image': 'assets/images/a8.png',
      'creator': 'Jaerim',
      'description':
          'Do you believe that people judge others based on their outer appearance? Have you ever been judged based on your looks? Kiyo is an ex-idol trainee who wants to live like a normal teenager. In this attempt, he starts living with his grandmother and enrolls in a new school. He even starts wearing ugly-looking glasses to hide his exceptional looks. There, he meets Lily, another victim of the same thing. People fear her and her father just because of their scary features, even though they are nice. However, Kiyu makes the same mistakes as others and judges Lily just like everyone else. Gradually, Kiyu realizes his mistake and the fact that Lily is really nice and kind. Read Your Smile Is A Trap to learn about their blossoming love and the obstacles they face.'
    },
    {
      'title': 'Seasons of Blossom',
      'genre': 'Romance',
      'image': 'assets/images/a9.png',
      'creator': 'HONGDUCK',
      'description':
          'If you ever get a chance to go back and change things you regret now, would you do it? Yeonu is a young and beautiful woman married to Seonjae, a cold and handsome businessman. Her marriage was of convenience and hence there is no love between her and her husband. They tried running the marriage, but ultimately, Yeonu gave up, and they divorced. Due to a series of unfortunate events, Seonjae dies in front of her. However, fate gives her a second chance, and she vows to save Seonjae this time. Read There Must Be Happy Endings to find out whether or not Yeonu was able to save Seonjae and why Seonjae seems to be hiding several secrets.'
    },
    {
      'title': 'Romance 101',
      'genre': 'Romance',
      'image': 'assets/images/a10.png',
      'creator': 'Namsoo',
      'description':
          'The popular webtoon series Seasons of Blossom is a compilation of several individual stories that are all connected. It contains all four seasons: spring, summer, fall, and winter. Each season contains a different story and a different theme with different endings. It focuses majorly on school bullying and how much it can affect someone’s whole life. Despite it being based on high school students, the story has several serious events and a storyline with many variations. Check out this webtoon to learn about each story and their interlinked connections.'
    },
  ];
   Map<String, double> ratings = {
    'Hello Baby': 3.0,
    'The Alpha King’s Claim': 3.0,
    'Bitten Contract': 3.0,
    // Add other titles with default rating here...
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 5),
            child: Image.asset(
              'assets/images/webtoon.png',
              width: 70,
              height: 40,
            ),
          ),
          backgroundColor: const Color(0xFF3A1C71),
          title: const Center(
              child: Text(
            'Webtoon Explorer',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.white),
          )),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              onPressed: () {
                context.push('/favourites');
              },
            ),
          ]),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3A1C71), Color(0xFFD76D77), Color(0xFFFFAF7B)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
             final categoryTitle = category['title']!;
            final currentRating = ratings[categoryTitle] ?? 3.0;
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      title: category['title']!,
                      genre: category['genre']!,
                      creator: category['creator']!,
                      image: category['image']!,
                      description: category['description']!,
                       initialRating: currentRating, 
                      onRatingUpdate: (newRating) {
                        
                        setState(() {
                          ratings[categoryTitle] = newRating;
                        });
                      },
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        category['image']!,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              category['title']!,
                              style: const TextStyle(
                                color: Color(0xFF005377), // Text color
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Genre: ${category['genre']}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Creator: ${category['creator']}',
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                RatingBar.builder(
                                    initialRating: 2,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    itemCount: 5,
                                    itemPadding:
                                        const EdgeInsets.symmetric(horizontal: 1),
                                    itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                    onRatingUpdate: (rating) {
                                      setState(() {
                                      ratings[categoryTitle] = rating; 
                                    });
                                    })
                              ],
                            )

                            // SizedBox(height: 5),
                            // Text(
                            //   category['description']!,
                            //   style: TextStyle(fontSize: 12, color: Colors.black),
                            //   maxLines: 3,
                            //   overflow: TextOverflow.ellipsis,
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
