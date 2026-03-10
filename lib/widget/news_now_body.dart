import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_now/widget/categorys_list_view.dart';
import 'package:news_now/widget/news_list_view.dart';

class NewsNowBody extends StatelessWidget {
  const NewsNowBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: CategorysListView()),
          NewsListView(),
        ],
      ),

      // child: Column(
      //   children: [CategorysListView(), SizedBox(height: 8), NewsListView()],
      // ),
    );
  }
}
