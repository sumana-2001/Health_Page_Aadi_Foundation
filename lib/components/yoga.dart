import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:updated_health_app/components/MuscleWiki.dart';
import 'package:updated_health_app/components/player.dart';

class yoga extends StatefulWidget {
  const yoga({super.key});

  @override
  State<yoga> createState() => _yogaState();
}

List<String> weekdays = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"];
Map<String,List<String>> Tasks = {"Yoga":["assets/images/yoga.png"],"meditation":["assets/images/meditate.png"],"Stretches":["assets/images/streching.png"],"Cables":["assets/images/cables.jpeg"],"Band":["assets/images/bodyweight.png"],"Kettlebells":["assets/images/kettlebells.jpeg"],"BodyPartWise":["assets/images/man_front.png"]};
class _yogaState extends State<yoga> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: gbar(),
        backgroundColor: Colors.white,
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              floating: true,
              snap: true,
              iconTheme: IconThemeData(color: Colors.black),
              expandedHeight: 50,
              actions: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: IconButton(
                      color: Colors.black,

                      onPressed: (){},
                      icon: Icon(Icons.menu,)),
                )
              ],

            ),
            SliverPadding(
              padding: EdgeInsets.zero,
              sliver: SliverList(
                  delegate: SliverChildListDelegate(
                      [
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20,bottom: 10),
                                child: CircleAvatar(
                                  radius: 15,
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0,bottom: 10),
                                child: Text(
                                    "Hi, Name",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),

                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0,bottom: 20),
                                child: Text(
                                  "How are you feeling today?",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),

                            ],
                          ),
                          Center(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius:BorderRadius.circular(20)
                              ),
                              color: Color(0xFFCEF8FA),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width/1.2,
                                height: MediaQuery.of(context).size.height/5,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                        child: Text("TRX Workouts"),
                                      top: 30,
                                      left:30,
                                    ),
                                    Positioned(
                                      bottom: 10,
                                        left: 30,
                                        child:FloatingActionButton.small(
                                          backgroundColor: Colors.lightBlue,
                                            onPressed: (){
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        Fetch(
                                                            choice: 2,
                                                            name: "TRX"
                                                        )
                                                ),);
                                            },
                                          child: Icon(Icons.play_arrow),
                                        )
                                    ),
                                    Positioned(
                                      right: 10,
                                        child: Image.asset(
                                            "assets/images/poseeee.png",
                                          width: 200,
                                          height: 200,
                                        )),

                                  ],
                                ),
                              )

                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(
                                    20.0), // Adjust the padding value as per your requirement
                                child: Text(
                                  'Recommended Flows',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 200,
                            child:ListView.builder(
                                itemCount: Tasks.length,
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder:(context,index){
                                  return Card(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side:BorderSide(
                                        color: Color(0xFF2DCBD0),
                                        width: 2
                                      ),
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Stack(
                                      children: [
                                        ClipRect(

                                          child: Ink.image(
                                              image: AssetImage(Tasks.values.elementAt(index)[0]),
                                              fit: BoxFit.cover,
                                            height: 140,
                                            width: 150,
                                          ),
                                        ),
                                        Positioned(
                                           left : 3,
                                            bottom : 4,
                                            child: Text(Tasks.keys.elementAt(index))
                                        ),
                                        Positioned(
                                          right: 10,
                                          bottom: 10,
                                            child: SizedBox(
                                              height: 30,
                                              width: 30,
                                              child: FloatingActionButton.small(
                                                heroTag: index,
                                                  onPressed: (){
                                                    if(Tasks.keys.elementAt(index) == "BodyPartWise"){
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (context) => musclewiki()),
                                                      );
                                                    }
                                                    else {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (_) =>
                                                                Fetch(
                                                                    choice: 2,
                                                                    name: Tasks
                                                                        .keys
                                                                        .elementAt(
                                                                        index)
                                                                )
                                                        ),);
                                                    }
                                                  },
                                                child: Icon(Icons.play_arrow,size: 20,),
                                                backgroundColor: Colors.lightBlueAccent,
                                                  
                                              
                                              )
                                            ))
                                      ],
                                    ),


                                  );
                                } ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(
                                    20.0), // Adjust the padding value as per your requirement
                                child: Text(
                                  'Continue Flows',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 7,
                              itemBuilder: (context, index) {
                                // Generate a random image for demonstration purposes
                                final randomImageUrl = 'https://media.emailonacid.com/wp-content/uploads/2019/03/2019-GifsInEmail.gif';

                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => player()),
                                    );
                                  },
                                  child: ListTile(
                                    leading: Image.network(randomImageUrl), // Random image
                                    title: Text(
                                      weekdays[index],
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: LinearProgressIndicator(
                                      value: 0, // Progress value (between 0 and 1)
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),

                    )
                  ]
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}


class gbar extends StatefulWidget {
  const gbar({super.key});

  @override
  State<gbar> createState() => _gbarState();
}

class _gbarState extends State<gbar> {
  @override
  Widget build(BuildContext context) {
    int _select=0;
    double screenWidth = MediaQuery.of(context).size.width;
    return Material(
      color: Colors.transparent,
      child:
      ClipPath(
        clipper: ProsteBezierCurve(
          position: ClipPosition.top,
          list: [
            BezierCurveSection(
              start: Offset(screenWidth, 20),
              top: Offset(screenWidth / 2, 0),
              end: Offset(0, 20),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          color: Colors.white,
          height: 110,
          child: GNav(
            gap: 8,
            haptic: true,
            color: Colors.grey,
            activeColor: Colors.black,
            tabBackgroundColor: Colors.lightBlueAccent.shade100,
            padding: EdgeInsets.all(15),
            tabs: [
              GButton(
                icon: Icons.home_outlined,
                text: "Home",
              ),
              GButton(
                icon: Icons.stacked_bar_chart_outlined,
                text: "Classroom",
              ),
              GButton(
                icon: Icons.shopping_bag_outlined,
                text: "Meditate",
              ),
              GButton(
                icon: Icons.person,
                text: "Profile",
              ),
            ],
            onTabChange: (index){
              _select=index;
            },
          ),
        ),
      ),
    );
  }
}