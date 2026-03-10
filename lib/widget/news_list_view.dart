import 'package:flutter/material.dart';
import 'package:news_now/widget/news_card.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return NewsCard();
      },
    );
  }
}
