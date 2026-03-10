import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(8),
            child: Image(
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              image: AssetImage('assets/images/general.avif'),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Apple Unveils "Vision Air": The Next Generation of Lightweight AR Glasses',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Starting at \$799, the new device aims to replace smartphones by integrating seamless augmented reality into daily routines.',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: const Color.fromARGB(255, 102, 101, 101),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
