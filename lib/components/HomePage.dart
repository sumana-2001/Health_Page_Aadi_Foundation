import "package:carousel_slider/carousel_slider.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:smooth_page_indicator/smooth_page_indicator.dart";
import "package:updated_health_app/components/yoga.dart";

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _current = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    child: CarouselSlider.builder(
                  itemCount: img.length,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) =>
                          Container(
                              child: Image.asset(
                                img[itemIndex],
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                              )),
                  options: CarouselOptions(
                      onPageChanged:
                          (int index, CarouselPageChangedReason reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                      autoPlay: true,
                      scrollDirection: Axis.horizontal,
                      enableInfiniteScroll: true),
                )),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
                buildindicator(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 6,
                  child: Column(
                    children: [
                      Text(
                        "Start your yoga journey now",
                        style:GoogleFonts.nunitoSans(
                          fontWeight: FontWeight.w800,
                          fontSize: 27,

                        ),
                        ),
                      Spacer(),
                      Text(
                        "Our expert will help you and they will guide\n"
                        "you how you can improve your health",
                        style: GoogleFonts.nunitoSans(
                          color:Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                FloatingActionButton.extended(
                  heroTag: null,
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.blue,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => yoga()),
                    );
                  },
                  label: Row(
                    children: [
                      Text(
                        "GET STARTED",
                        style: GoogleFonts.nunitoSans(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        )
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 25,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildindicator() => AnimatedSmoothIndicator(
        activeIndex: _current,
        count: img.length,
        effect: JumpingDotEffect(
            verticalOffset: 4,
            dotWidth: 9,
            dotHeight: 9,
            dotColor: Colors.lightBlue),
      );
}

final List<String> img = [
  'assets/images/homepage_image.png',
  'assets/test/img.jpg',
  'assets/images/back_bending_pose.jpg'
];
