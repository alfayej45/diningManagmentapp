



import 'package:diningmanagement/view/user_profile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              color: Colors.green,
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                          Container(
              alignment: Alignment.bottomCenter,
              color: Colors.green,
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Text("Dining", style: TextStyle(color: Colors.red, fontSize: 50)),

            ),
                    Container(
              alignment: Alignment.topCenter,
              color: Colors.green,
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Text("Management", style: TextStyle(color: Colors.red, fontSize: 50)),

            ),
         
                ],
              ),

            ),

               ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
               InkWell(
                 onTap: (){
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MyAccount()));
                 },
                 child: ListTile(
                             leading: Icon(Icons.people),
                             title: Text("My Account"),
                             trailing: Icon(Icons.arrow_forward_ios),
                           ),
               ),
               ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
               ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
               ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              trailing: Icon(Icons.arrow_forward_ios),
            )
          ],
        ),
      ),
      ),
      // appBar: AppBar(
      //   title: Text("Dining"),
      //   centerTitle: true,
      // ),
      body:CustomScrollView(
        slivers:[
          SliverAppBar(
            expandedHeight: 180,
            backgroundColor: Colors.deepOrange,
            title: Text("Today's Menu"),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage("https://im.rediff.com/money/2014/sep/19sundar4.jpg"),
                ),
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: const EdgeInsets.only(right: 10, top: 6),
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.center,
                  crossAxisAlignment:CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 100),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Text("Confirmed Meal:200", style: TextStyle(fontSize: 15),),
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        SizedBox(
                          height: 30,
                          width: 120,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Search",
                              filled : true,
                              fillColor: Colors.white,
                              hintText: "Search user"

                            ),
                          ),
                        ),
                        Container(
                          height: 30 ,
                          width: 30,
                          color: Colors.blueGrey,
                          child: Icon(Icons.search, color: Colors.white),

                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            
          

          ),
          SliverList(
            delegate:SliverChildBuilderDelegate(
              (context, index) =>
              //  ListTile(
              //   tileColor: (index % 2 == 0)? Colors.white : Colors.grey,
              //   leading: Row(
              //     children: [
              //       //SizedBox(width: 40,),
              //       CircleAvatar(
              //         radius: 20,
              //         backgroundImage: NetworkImage("https://im.rediff.com/money/2014/sep/19sundar4.jpg"),
                      
              //       ),
              //       //SizedBox(width: 10,),
              //       VerticalDivider(
              //         width: 20,
              //         thickness : 3,
              //         color: Colors.orange,
              //         endIndent: 10,
              //         indent: 10,

              //       ),
              //      // SizedBox(width: 25,),

              //       // Column(
              //       //   mainAxisAlignment: MainAxisAlignment.center,
              //       //   crossAxisAlignment: CrossAxisAlignment.center,
              //       //   children: [
              //       //     Text("SHAHINUR"),
              //       //     Text("01796033771")
              //       //   ],
              //       // ),

                    
                  
              //     ],
              //   ),
              //   // title:   Column(
              //   //       mainAxisAlignment: MainAxisAlignment.center,
              //   //       crossAxisAlignment: CrossAxisAlignment.center,
              //   //       children: [
              //   //         Text("SHAHINUR"),
              //   //         Text("01796033771")
              //   //       ],
              //   //     ),

              // ),
              Container(
                color: (index % 2 == 0)? Colors.white : Colors.grey,
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    SizedBox(width: 50,),
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage("https://im.rediff.com/money/2014/sep/19sundar4.jpg"),
                      
                    ),
                    SizedBox(width: 10,),
                    VerticalDivider(
                      width: 20,
                      thickness : 3,
                      color: Colors.orange,
                      endIndent: 10,
                      indent: 10,

                    ),
                    SizedBox(width: 25,),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("SHAHINUR"),
                        Text("01796033771")
                      ],
                    ),

                    
                  
                  ],
                ),
              ),
              childCount: 51

            )
             )

        ]
      )
    );
  }
}