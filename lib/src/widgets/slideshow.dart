import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  const Slideshow({
    Key? key,
    required this.slides,
    this.pointsUp = false,
    this.primaryColor = Colors.purple,
    this.secondaryColor = Colors.grey,
    this.primaryBullet = 12,
    this.secondaryBullet = 12,
  }) : super(key: key);

  final List<Widget> slides;
  final bool pointsUp;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryBullet;
  final double secondaryBullet;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideshowModel(),
      child: SafeArea(
        child: Center(
          child: Builder( // Se ejecuta luego de que todo lo anterior se ha creado
            builder: (BuildContext context) {
              Provider.of<_SlideshowModel>(context).primaryColor = primaryColor;
              Provider.of<_SlideshowModel>(context).secondaryColor =
                  secondaryColor;
              Provider.of<_SlideshowModel>(context).primaryBullet = primaryBullet;
              Provider.of<_SlideshowModel>(context).secondaryBullet = secondaryBullet;

              return _CrearEstructuraSlideshow(
                  pointsUp: pointsUp, slides: slides);
            },
          ),
        ),
      ),
    );
  }
}

class _CrearEstructuraSlideshow extends StatelessWidget {
  const _CrearEstructuraSlideshow({
    Key? key,
    required this.pointsUp,
    required this.slides,
  }) : super(key: key);

  final bool pointsUp;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (pointsUp) _Dots(slides.length),
        Expanded(child: _Slides(slides)),
        if (!pointsUp) _Dots(slides.length),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots(this.totalSlides);

  final int totalSlides;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            this.totalSlides,
            (index) => _Dot(
                  index: index,
                )),
        // children: [
        //   _Dot(index: 0),
        //   _Dot(index: 1),
        //   _Dot(index: 2),
        // ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final slideshowModel = Provider.of<_SlideshowModel>(context);

    double value;
    Color color;
    if ((index <= (slideshowModel.currentPage + 0.5)) &&
        (index > (slideshowModel.currentPage - 0.5))){
      value = slideshowModel.primaryBullet;
      color = slideshowModel.primaryColor;
    }
    else{
      value = slideshowModel.secondaryBullet;
      color = slideshowModel.secondaryColor;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: value,
      height: value,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  const _Slides(this.slides);

  final List<Widget> slides;

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      //print('Current page: ${pageViewController.page}');

      // Actualizar el provider, sliderModel:
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        // children: [
        //   _Slide(path: 'assets/svgs/slide-1.svg'),
        //   _Slide(path: 'assets/svgs/slide-2.svg'),
        //   _Slide(path: 'assets/svgs/slide-1.svg'),
        // ],
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide(this.slide);

  final Widget slide;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(32),
      child: slide,
    );
  }
}

class _SlideshowModel with ChangeNotifier {

  double _currentPage = 0;
  Color _primaryColor = Colors.purple;
  Color _secondaryColor = Colors.grey;
  double _primaryBullet = 12.0;
  double _secondaryBullet = 12.0;

  double get currentPage => this._currentPage;

  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    //print('Page changed to: $_currentPage');
    notifyListeners();
  }

  Color get primaryColor => this._primaryColor;

  set primaryColor(Color primaryColor) {
    this._primaryColor = primaryColor;
  }

  Color get secondaryColor => this._secondaryColor;

  set secondaryColor(Color secondaryColor) {
    this._secondaryColor = secondaryColor;
  }

  double get primaryBullet => this._primaryBullet;

  set primaryBullet(double primaryBullet) {
    this._primaryBullet = primaryBullet;
  }

  double get secondaryBullet => this._secondaryBullet;

  set secondaryBullet(double secondaryBullet){
    this._secondaryBullet = secondaryBullet;
  }

}
