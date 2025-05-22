import 'package:flutter/material.dart';
import 'flagCard_test.dart';

class Assignment extends StatelessWidget {
  const Assignment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            int crossAxisCount;

            if (screenWidth < 768) {
              crossAxisCount = 2;
            }
            else if (screenWidth <= 1024) {
              crossAxisCount = 3;
            }
            else {
              crossAxisCount = 4;
            }

            // Account for spacing * (number of gaps between items)
            double totalSpacing = 12.0 * (crossAxisCount - 1);
            double availableWidth = screenWidth - 24; // 12 padding left + right
            double itemWidth = (availableWidth - totalSpacing) / crossAxisCount;
            double itemHeight = itemWidth * 1.2; // Adjusted aspect ratio

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: GridView.builder(
                itemCount: 8,
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: itemWidth / itemHeight,
                ),
                itemBuilder: (context, index) {
                  final cards = [
                    {
                      'img': 'https://www.worldometers.info/img/flags/bg-flag.gif',
                      'seats': '৬',
                      'days': '৬',
                      'title': 'JavaScript(MERN)',
                    },
                    {
                      'img': 'https://www.worldometers.info/img/flags/as-flag.gif',
                      'seats': '৬',
                      'days': '৬',
                      'title': 'Python, Django & React',
                    },
                    {
                      'img': 'https://www.worldometers.info/img/flags/be-flag.gif',
                      'seats': '৬',
                      'days': '৬',
                      'title': 'App Development',
                    },
                    {
                      'img': 'https://www.worldometers.info/img/flags/eg-flag.gif',
                      'seats': '৬',
                      'days': '৬',
                      'title': 'ASP.Net Core',
                    },
                    {
                      'img': 'https://www.worldometers.info/img/flags/gm-flag.gif',
                      'seats': '৬',
                      'days': '৬',
                      'title': 'SQA',
                    },
                    {
                      'img': 'https://www.worldometers.info/img/flags/po-flag.gif',
                      'seats': '৬',
                      'days': '৬',
                      'title': 'Machine Learning',
                    },
                    {
                      'img': 'https://www.worldometers.info/img/flags/ca-flag.gif',
                      'seats': '৬',
                      'days': '৬',
                      'title': 'PHP, Laravel & Vue.js',
                    },
                    {
                      'img': 'https://www.worldometers.info/img/flags/sp-flag.gif',
                      'seats': '৬',
                      'days': '৬',
                      'title': 'Digital Marketing',
                    },
                  ];

                  final card = cards[index];

                  return FlagCard(
                    imageURL: card['img']!,
                    seatsLeft: card['seats']!,
                    daysLeft: card['days']!,
                    courseTitle: card['title']!,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}