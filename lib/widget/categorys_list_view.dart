import 'package:flutter/material.dart';
import 'package:news_now/models/category_model.dart';
import 'package:news_now/widget/news_card_category.dart';

class CategorysListView extends StatelessWidget {
  CategorysListView({super.key});

  final List<CategoryModel> categories = [
    const CategoryModel(
      imageAssetUrl: 'assets/images/business.avif',
      categoryName: 'Business',
    ),
    const CategoryModel(
      imageAssetUrl: 'assets/images/entertaiment.avif',
      categoryName: 'Entertaiment',
    ),
    const CategoryModel(
      imageAssetUrl: 'assets/images/general.avif',
      categoryName: 'General',
    ),
    const CategoryModel(
      imageAssetUrl: 'assets/images/health.avif',
      categoryName: 'Health',
    ),
    const CategoryModel(
      imageAssetUrl: 'assets/images/science.avif',
      categoryName: 'Science',
    ),
    const CategoryModel(
      imageAssetUrl: 'assets/images/sports.avif',
      categoryName: 'Sports',
    ),
    const CategoryModel(
      imageAssetUrl: 'assets/images/technology.jpeg',
      categoryName: 'Technology',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return NewsCardCategory(category: categories[index]);
        },
      ),
    );
  }
}
