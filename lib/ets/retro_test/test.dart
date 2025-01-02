import 'package:flutter/material.dart';

class MyDualDynamicListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Dual Dynamic ListViews'),
                background: Image.network(
                  'https://example.com/your_image_url.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: Column(
          children: [
            Flexible(
              child: Container(
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) => ListTile(
                    title: Text('List 1 Item $index'),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Container(
                child: ListView.builder(
                  itemCount: 30, // Different number of items for List 2
                  itemBuilder: (context, index) => ListTile(
                    title: Text('List 2 Item $index'),
                  ),
                ),
              ),
            ),
            // Add more widgets here as needed
          ],
        ),
      ),
    );
  }
}
