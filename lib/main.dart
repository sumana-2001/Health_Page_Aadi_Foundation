import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:updated_health_app/components/YogaPage.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health APP',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home Page'),

    );
  }
}
class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(

        title: Text('YOGA TYPES'),
    backgroundColor: Colors.blue,
    elevation: 50.0,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            tooltip: "Menu Icon",
            onPressed: () {},
          ),
        ),

        body: Center(
        child: ListView(
    children: [
           CarouselSlider(
        items:
               [
                 Container(
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                  image: NetworkImage("https://img.freepik.com/premium-vector/young-happy-girl-practices-yoga-meditates-pigeon-pose-physical-spiritual-practice-vector-illustration-flat-cartoon-style_173706-45.jpg"),

              ),
               ),
                   child: Text("Start your yoga journey now"),
                 ),

                 Container(
                   margin: EdgeInsets.all(8.0),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(20.0),
                     image: DecorationImage(
                       image: NetworkImage("https://img.freepik.com/premium-vector/workout-cardio-weightlifting-with-personal-gym-coach-woman-training-with-dumbbells-fitness-exercises-active-lifestyle-health-care-wellness-vector-sport-illustration_176516-2459.jpg?w=740"),

                     ),
                   ),
                   child: Text("Start your Exercise journey now"),
                 ),

                 Container(
                   margin: EdgeInsets.all(10.0),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(20.0),
                     image: DecorationImage(
                       image: NetworkImage("https://previews.123rf.com/images/jemastock/jemastock1707/jemastock170708641/81882932-rythmic-gymnast-with-ribbon-athlete-sport-avatar-icon-image-vector-illustration-design.jpg"),

                     ),
                   ),
                   child: Text("Start your Gymnastics journey now"),
                 ),

            ]
               ,
               options:CarouselOptions(
                 height: 600.0,
                 enlargeCenterPage: true,
                 autoPlay: true,
                 aspectRatio: 16 / 9,
                 autoPlayCurve: Curves.fastOutSlowIn,
                 enableInfiniteScroll: true,
                 autoPlayAnimationDuration: Duration(milliseconds: 800),
                 viewportFraction: 0.8,
               ),
        ),
      FloatingActionButton.extended(
        heroTag: null,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.blue,

        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ExerciseDetails()),
          );
        }, label: const Text("GET STARTED",style: TextStyle(color: Colors.white),),

      ),
        ]

      )
    )
    );
  }

}

















