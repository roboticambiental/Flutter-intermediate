import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/slideshow.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: MySlideshow()),
          Expanded(child: MySlideshow()),
        ],
      ),
    );
  }
}

class MySlideshow extends StatelessWidget {
  const MySlideshow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      slides: [
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
      ],
      pointsUp: true,
      primaryColor: Colors.green,
      secondaryColor: Colors.black,
      primaryBullet: 20.0,
      secondaryBullet: 12.0,
    );
  }
}
