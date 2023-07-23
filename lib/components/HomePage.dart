import "package:carousel_slider/carousel_slider.dart";
import "package:flutter/material.dart";
import "package:smooth_page_indicator/smooth_page_indicator.dart";
import "package:updated_health_app/components/yoga.dart";


class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _current=0;
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 100,),
              Container(
                  child: CarouselSlider.builder(
                itemCount: img.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        Container(
                          height: 150,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              img[itemIndex],
                            )),
                options: CarouselOptions(
                    onPageChanged:(int index, CarouselPageChangedReason reason){
                      setState(() {
                        _current=index;
                      });
                    } ,
                    autoPlay: true,
                    scrollDirection: Axis.horizontal,
                    enableInfiniteScroll: true),
              )),
              SizedBox(
                height: MediaQuery.of(context).size.height/40,
              ),
              buildindicator(),
              SizedBox(
                height: MediaQuery.of(context).size.height/40,
              ),
              Container(
                height: MediaQuery.of(context).size.height/6,
                child: Column(
                  children: [
                    Text(
                      "Start your yoga journey now",
                      style: TextStyle(
                        fontSize:27,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    Spacer(),
                    Text(
                        "Our expert will help you and they will guide\n"
                        "you how you can improve your health"
                            ,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,

                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height/10 ,
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
                  }, label: Row(
                    children: [
                      const Text("GET STARTED",style: TextStyle(color: Colors.white),),
                      Icon(Icons.arrow_forward,color: Colors.white,)
                    ],
                  ),

                ),

            ],
          ),
        ),
      ),
    );
  }
  Widget buildindicator()=>AnimatedSmoothIndicator(
    activeIndex: _current,
    count: img.length,
    effect: JumpingDotEffect(
      verticalOffset: 4,
      dotWidth: 9,
      dotHeight: 9,
      dotColor: Colors.lightBlue
    ),

  );
}

final List<String> img = [
  'assets/images/homepage_image.png',
  'assets/test/img.jpg',
  'assets/images/back_bending_pose.jpg'
];




