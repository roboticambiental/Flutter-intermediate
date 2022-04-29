import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PinterestGrid(),
      ),
    );
  }
}

class PinterestGrid extends StatelessWidget {
  const PinterestGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 4,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemBuilder: (context, index) {
        return Container(
          child: Center(child: Text('hello'),),
        );
        // return Tile(
        //   index: index,
        //   extent: (index % 5 + 1) * 100,
        // );
      },
    );
  }
}

