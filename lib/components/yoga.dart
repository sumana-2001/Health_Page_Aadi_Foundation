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

List<String> continue_flows = ["assets/images/back_bending_pose.jpg","assets/images/cardio_yoga1.jpg","assets/images/lower_body_streches.png","assets/images/pigeon_pose.jpg","assets/images/streching_exercise.png","assets/images/yoga.png","assets/images/bridge_pose.jpg"];
List<String> weekdays = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"];
Map<String,List<String>> Tasks = {"Yoga":["assets/images/yoga_3d.png"],"Meditation":["assets/images/meditation_3d.png"],"Stretches":["assets/images/streching_3d.png"],"Cables":["assets/images/cables_3d.jpeg"],"Bodyweight":["assets/images/body_lifting_3d.jpeg"],"Kettlebells":["assets/images/kettlebells_3d.jpeg"],"Male Anatomy":["assets/icons/man_front.png"],"Female Anatomy":["assets/icons/women_front.png"]};
class _yogaState extends State<yoga> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        //bottomNavigationBar: gbar(),
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
                                        child: Text("Band Workouts"),
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
                                                MaterialPageRoute(builder: (context) => Fetch(name: "Band", choice: 2, gender: "Male")),
                                              );
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
                                    30.0), // Adjust the padding value as per your requirement
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
                            height: MediaQuery.of(context).size.height - 480,

                            child:ListView.builder(
                                itemCount: Tasks.length,
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder:(context,index){
                                  return Column(
                                      children : [Card(
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
                                              //fit: BoxFit.cover,
                                               fit: BoxFit.fill,
                                            height: 200,
                                            width: 200,
                                          ),
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
                                                     if(Tasks.keys.elementAt(index) == "Male Anatomy"){
                                                       Navigator.push(
                                                         context,
                                                         MaterialPageRoute(builder: (context) => musclewiki( gender: "Male")),
                                                       );
                                                     }
                                                     else if(Tasks.keys.elementAt(index) == "Female Anatomy"){
                                                       Navigator.push(
                                                         context,
                                                         MaterialPageRoute(builder: (context) => musclewiki(gender: "Female")),
                                                       );
                                                     }
                                                     else if(Tasks.keys.elementAt(index) == "Meditation"){
                                                       Navigator.push(
                                                         context,
                                                         MaterialPageRoute(builder: (context) => Fetch(name: "TRX", choice: 2, gender: "Male")),
                                                       );
                                                     }
                                                     else{
                                                       print(Tasks.keys.elementAt(index));
                                                       Navigator.push(
                                                         context,
                                                         MaterialPageRoute(builder: (context) => Fetch(name: Tasks.keys.elementAt(index), choice: 2, gender: "Male")),
                                                       );
                                                     }
                                                  },
                                                child: Icon(Icons.play_arrow,size: 20,),
                                                backgroundColor: Colors.lightBlueAccent,
                                                  
                                              
                                              )
                                            )),
                                      ],
                                    ),


                                  ),
                                  Text(Tasks.keys.elementAt(index),style: TextStyle(fontWeight: FontWeight.bold,color:Colors.cyan,fontSize: 15),),
                                  ]);
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
                              itemCount: continue_flows.length,
                              itemBuilder: (context, index) {
                                // Generate a random image for demonstration purposes
                                final randomImage = continue_flows[index];

                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => player()),
                                    );
                                  },
                                  child: ListTile(
                                    leading: Image.asset(randomImage), // Random image
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


// class gbar extends StatefulWidget {
//   const gbar({super.key});
//
//   @override
//   State<gbar> createState() => _gbarState();
// }
//
// class _gbarState extends State<gbar> {
//   @override
//   Widget build(BuildContext context) {
//     int _select=0;
//     double screenWidth = MediaQuery.of(context).size.width;
//     return Material(
//       color: Colors.transparent,
//       child:
//       ClipPath(
//         clipper: ProsteBezierCurve(
//           position: ClipPosition.top,
//           list: [
//             BezierCurveSection(
//               start: Offset(screenWidth, 20),
//               top: Offset(screenWidth / 2, 0),
//               end: Offset(0, 20),
//             ),
//           ],
//         ),
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 10),
//           color: Colors.white,
//           height: 110,
//           child: GNav(
//             gap: 8,
//             haptic: true,
//             color: Colors.grey,
//             activeColor: Colors.black,
//             tabBackgroundColor: Colors.lightBlueAccent.shade100,
//             padding: EdgeInsets.all(15),
//             tabs: [
//               GButton(
//                 icon: Icons.home_outlined,
//                 text: "Home",
//               ),
//               GButton(
//                 icon: Icons.stacked_bar_chart_outlined,
//                 text: "Stats",
//               ),
//               GButton(
//                 icon: Icons.shopping_bag_outlined,
//                 text: "Shop",
//               ),
//               GButton(
//                 icon: Icons.person,
//                 text: "Profile",
//               ),
//             ],
//             onTabChange: (index){
//               _select=index;
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
