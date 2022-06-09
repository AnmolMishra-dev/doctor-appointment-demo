import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_appointment/const.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'Appointment_Page.dart';
import 'Schedule_Page.dart';



import 'package:url_launcher/url_launcher.dart';
class ComeBack extends StatefulWidget {
  const ComeBack({Key? key}) : super(key: key);

  @override
  _ComeBackState createState() => _ComeBackState();
}

class _ComeBackState extends State<ComeBack> {
  bool show =false;
  double _animatedHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    String? _message;
    DateTime now = DateTime.now();
    String _currentHour = DateTime.now().hour.toString();
    int hour = int.parse(_currentHour);
    setState(
          () {
        if (hour >= 5 && hour < 12) {
          _message = 'Good Morning';
        } else if (hour >= 12 && hour <= 17) {
          _message = 'Good Afternoon';
        } else {
          _message = 'Good Evening';
        }
      },
    );
    _callNumber() async{
      const number = '08592119000';
      FlutterPhoneDirectCaller.callNumber(number);//set the number here
    }
    openwhatsapp() async{
      var whatsapp ="+919144040888";
      var whatsappURl_android = "whatsapp://send?phone="+whatsapp+"&text=hello";
      var whatappURL_ios ="https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
      if(Platform.isIOS){
        // for iOS phone only
        if( await canLaunch(whatappURL_ios)){
          await launch(whatappURL_ios, forceSafariVC: false);
        }else{
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: new Text("whatsapp no installed")));

        }

      }else{
        // android , web
        if( await canLaunch(whatsappURl_android)){
          await launch(whatsappURl_android);
        }else{
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: new Text("whatsapp no installed")));

        }


      }

    }


    return  Scaffold(
      drawer: Drawer(

        child: ListView(
            padding: EdgeInsets.all(0.0),
            children: <Widget>[
              show? UserAccountsDrawerHeader(
       accountName: Text('Roberto Aleydon'),
                accountEmail: Text('aleydon@gmail.com'),

                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSV6ZcXzZnYmm1Ll0gz0d79A6G3mgCequ1rD32FzYGr0AiW1WIELpJQk3v3UVLc7sthSVM&usqp=CAU"),
                ),

                otherAccountsPictures: <Widget>[
                  CircleAvatar(
                    child: Text('A'),
                    backgroundColor: Colors.white60,
                  ),
                  CircleAvatar(
                    child: Text('R'),
                  ),
                ],

                onDetailsPressed: (){
         setState(() {
           show=false;
         });
                  },


                decoration: BoxDecoration(
                    gradient: new LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.Home_Color1_Gra,
                        AppColors.Home_Color2_Gra
                      ],
                    )
                ),):Container(),

              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: ListTile(
                  title: Text('Profile'),
                  leading: Icon(Icons.person),
                  onTap: (){
                    setState(() {
                      show=true;

                    });
                                    },
                ),
              ),


              Divider(),


              ListTile(
                title: Text('New Group'),
                leading: Icon(Icons.group_add),
              ),

              ListTile(
                title: Text('New Chat'),
                leading: Icon(Icons.chat),
               onTap: openwhatsapp,
              ),


              ListTile(
                title: Text('Calls'),
                leading: Icon(Icons.call),
                onTap:  _callNumber,
              ),


              Divider(),


              ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings),
               onTap: (){
                  setState(() {
                    _animatedHeight!=0.0?_animatedHeight=0.0:_animatedHeight=100.0;

                  });
               },
              ),
              new AnimatedContainer(duration: const Duration(milliseconds: 120),
                child: Card(
                  elevation: 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width*.6,

                      child: Center(child: new Text("Settings"))),
                ),
                height: _animatedHeight,

                width: 100.0,
              ),

              Divider(),

              ListTile(
                title: Text('Support'),
                leading: Icon(Icons.report_problem),
                onLongPress: (){},
              ),


              ListTile(
                  title: Text('Close'),
                  leading: Icon(Icons.close),
                onTap: (){
                  if (Platform.isAndroid) {
                    SystemNavigator.pop();
                  } else if (Platform.isIOS) {
                    exit(0);
                  }
                },
              ),
            ]
        ),
      ),

      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0), // here the desired height
          child: AppBar(
            iconTheme: IconThemeData(
                color: Colors.black
            ),

            elevation: 0,
            // leading: InkWell(onTap: (){
            //   Navigator.pop(context);
            // },
            //   child: Icon(
            //     Icons.arrow_back,
            //     color: AppColors.Text_Black,
            //     size: 25,
            //   ),
            // ),
            backgroundColor: AppColors.Text_white,
           centerTitle: true,
           title: Column(children: [
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text( _message.toString(),style: TextStyle(color: AppColors.Text_Black,fontSize: 20,fontWeight: FontWeight.w500),),
             ),

           ],),
            actions: [
              Align(
                alignment: Alignment.bottomRight,
                child: Stack(
                  children: [
                    Icon(Icons.notifications_none_outlined,color: AppColors.Text_Black,),
                  Positioned(left: 10,child: Container(
                      height: 10,width: 10,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),

                    ),
                  )
                  ],
                ),
              )
            ],
          )
      ),
      body: SingleChildScrollView(
scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(

                      // padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                         color: AppColors.Text_Filed_Cream_Color,

                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      width: MediaQuery.of(context).size.width*.7,
                      height: 60,
                      child: TextFormField(
                        maxLines: null,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(15),
                            suffixIcon: Icon(Icons.search,color:AppColors.Text_grey_Color,),
                            hintStyle: TextStyle(color:AppColors.Text_grey_Color ),
                            border:InputBorder.none,
                            hintText: "Search a doctor or...."

                        ),
                      ),
                    ),
                    Container(height: 60,width: 60,  decoration: BoxDecoration(
                      color:AppColors.Home_Color1_Gra,
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Center(child: Icon(Icons.notes_sharp,color: AppColors.Text_white,)),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15,left: 10,right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Upcoming Schedule ",style: TextStyle(color: AppColors.Text_Black,fontSize: 18,fontWeight: FontWeight.w500),),
                    Text("See all ",style: TextStyle(color: AppColors.Home_Color1_Gra,fontSize: 18,fontWeight: FontWeight.w500),),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(15)
                ),
                height: 250,
                width: MediaQuery.of(context).size.width*.95,
              padding: EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 20),
                child: Card(


                  shadowColor: Colors.black.withOpacity(1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: AppColors.Text_white,
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage("https://st3.depositphotos.com/10654668/13844/i/1600/depositphotos_138445604-stock-photo-male-doctor-in-hospital.jpg"),
                            ),
                              Column(children: [
                                Text("dr.Nick Sanders",style: TextStyle(color: AppColors.Text_Black,fontSize: 15,fontWeight: FontWeight.w500),),
                                Text("Dermatologist London",style: TextStyle(color: AppColors.Text_Black,fontSize: 15),),
                              ],),
                              Icon(Icons.more_vert,color: AppColors.Home_Color1_Gra,size: 20,)

                          ],),
                        ),
                     Stack(children: [
                       InkWell(onTap: (){
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => Appointment()),
                         );
                       },
                         child: Container(
                         padding: EdgeInsets.only(left: 35)
                         ,height: 50,width: MediaQuery.of(context).size.width*.7,decoration: BoxDecoration(
                             gradient: new LinearGradient(
                               begin: Alignment.topCenter,
                               end: Alignment.bottomCenter,
                               colors: [
                                 AppColors.Home_Color1_Gra,
                                 AppColors.Home_Color2_Gra
                               ],
                             ),
                             borderRadius: BorderRadius.circular(10)
                         ),
                         child: Center(child: Text("11 Feb 08.00 am-09.00 am",style: TextStyle(color: AppColors.Text_white,fontWeight: FontWeight.w400,fontSize: 12),)),
                         ),
                       ),
                       Container(
                       padding: EdgeInsets.all(15),
                       height: 50,width:60,
                         decoration: BoxDecoration(
                        color: AppColors.Home_Color1_Gra,
                             borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10))
                         ),
                         child:Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjOnxAZhIQxmQVmvifS3o2DMfSWp8r2QqckRANz1cQVGon-FhAhDgtRNjHR92P0o284Bg&usqp=CAU"),)


                     ],)
                      ],
                    ),
                  )
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15,left: 10,right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Nearby Doctor",style: TextStyle(color: AppColors.Text_Black,fontSize: 18,fontWeight: FontWeight.w500),),
                    Text("See all ",style: TextStyle(color: AppColors.Home_Color1_Gra,fontSize: 18,fontWeight: FontWeight.w500),),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width*.95,
                  height: 120,
                  child: Card(
                    elevation: 5,
                    child: Row(children: [
                    Container(height: MediaQuery.of(context).size.height,width: 10,
                    color: Color(0XFF7836ff),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Row(


                      children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage("https://st3.depositphotos.com/10654668/13844/i/1600/depositphotos_138445604-stock-photo-male-doctor-in-hospital.jpg"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Text("Dr. Jone Andreas",style: TextStyle(color: AppColors.Text_Black,fontSize: 15,fontWeight: FontWeight.w500),),
                          Text("Heart Surgeon,London",style: TextStyle(color: AppColors.Text_Black,fontSize: 15),)
                        ],),
                      )
                    ],),)

                  ],),),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*.95,
                height: 120,
                child: Row(children: [
                Container(height: MediaQuery.of(context).size.height,width: 10,

                ),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Row(


                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage("https://st3.depositphotos.com/10654668/13844/i/1600/depositphotos_138445604-stock-photo-male-doctor-in-hospital.jpg"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Dr.Alex Adibaran",style: TextStyle(color: AppColors.Text_Black,fontSize: 15,fontWeight: FontWeight.w500),),
                            Text("Dermatologist,London",style: TextStyle(color: AppColors.Text_Black,fontSize: 15),)
                          ],),
                      )
                    ],),)

                ],),
              )


            ],
          ),
        ),
      ),
    );
  }
}
