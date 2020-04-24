import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

class SlideShow extends StatefulWidget {
  @override
  _SlideShowState createState() => _SlideShowState();
}

class _SlideShowState extends State<SlideShow> with SingleTickerProviderStateMixin {

  final PageController _controller = PageController();

  List<Widget> _list = [
    SliderBox(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.0),
              image: DecorationImage(
                image: AssetImage('assets/images/slide.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        )),
    SliderBox(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.0),
              image: DecorationImage(
                image: AssetImage('assets/images/sl.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        )),
    SliderBox(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.0),
              image: DecorationImage(
                image: AssetImage('assets/images/sr.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ))
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _animateSlider());
  }

  void _animateSlider() {
    Future.delayed(Duration(seconds: 2)).then((_) {
      int nextPage = _controller.page.round() + 1;

      if (nextPage == _list.length) {
        nextPage = 0;
      }

      _controller
          .animateToPage(nextPage, duration: Duration(seconds: 1), curve: Curves.linear)
          .then((_) => _animateSlider());
    });
  }
  @override
  Widget build(BuildContext context) {
    PageIndicatorContainer container = new PageIndicatorContainer(
      pageView: new PageView(
        children: _list,
        controller: _controller,
      ),
      length: _list.length,
      size: 8,
      padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
      indicatorSpace: 10,
      indicatorColor: Colors.grey[350],
      indicatorSelectorColor: Colors.grey,
    );
    return Stack(
      children: <Widget>[
        Container(
          child: container,
          height: 170,
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/sl_background.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
class SliderBox extends StatelessWidget {
  final Widget child;
  const SliderBox({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: child);
  }
}
