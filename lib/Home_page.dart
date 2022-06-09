import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/services.dart';
import 'const.dart';
import 'create_account_Page.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late StreamSubscription<DataConnectionStatus> listener;
  var InternetStatus = "Unknown";
  var contentmessage = "Unknown";
  void _showDialog(String title,String content ,BuildContext context){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
              title: new Icon(Icons.wifi),
              content: new Text(content),
              actions: <Widget>[
                new FlatButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child:new Text("Close") )
              ]
          );
        }
    );}
  checkConnection(BuildContext context)
  async{
    listener = DataConnectionChecker().onStatusChange.listen((status) {
      switch (status){
        case DataConnectionStatus.connected:
          InternetStatus = "Connected to the Internet";
          contentmessage = "Connected to the Internet";
          _showDialog(InternetStatus,contentmessage,context);
          break;
        case DataConnectionStatus.disconnected:
          InternetStatus = "You are disconnected to the Internet. ";
          contentmessage = "Please check your internet connection";
          _showDialog(InternetStatus,contentmessage,context);
          break;
      }
    });
    return await DataConnectionChecker().connectionStatus;
  }

  @override
  void initState() {
    checkConnection(context);
  }

  @override
  void dispose() {
    listener.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: new BoxDecoration(

            gradient: new LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.Home_Color1_Gra,
                AppColors.Home_Color2_Gra
              ],
            )),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 40,right: 0),
            child: Container(
width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(

                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image:AssetImage("assets/home.jpg"),
                  ),

                color: Colors.pinkAccent,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(150),
                  bottomRight: Radius.circular(150),
                ),
              ),
              padding: EdgeInsets.only(right: 30,bottom: 5,top: 5),
              // child: Image.asset("assets/home.jpg",fit: BoxFit.fill,),
            ),
          ),
          Expanded(
            child: Container(width: double.infinity,
              height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text("Virtual Health \nand Prescriptions",textAlign: TextAlign.center,style: TextStyle(color:AppColors.Text_white,fontSize: 25,fontWeight: FontWeight.w500 ),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Text("Any treatment begins with the consultant of a qualified specialist",textAlign: TextAlign.center,style: TextStyle(color:AppColors.Text_white,fontSize: 20, ),),
              ),
              InkWell(onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateAccount()),
                );

              },
                child: Container(
                  width: MediaQuery.of(context).size.width*.7,
                  height: 70,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Color(0XFF006dff),
                    elevation: 10,
child: Center(child: Text("Continue with mail",style: TextStyle(color:AppColors.Text_white,fontSize: 20, ))),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(  border: Border.all(color: AppColors.Text_white),
                          color: AppColors.Home_Back_arrow,
                          borderRadius: BorderRadius.all(Radius.circular(40))
                      ),
                      child: Center(child: Icon(Icons.arrow_back,color: AppColors.Text_Black,size: 25,)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                      color: AppColors.Text_white,
                        borderRadius: BorderRadius.all(Radius.circular(40))
                    ),
                    child: Center(child: Icon(Icons.arrow_forward,color: AppColors.Text_Black,size: 25,)),
                    ),
                  ),
                ],
              )

            ],),

            ),
          )
        ],),
      ),
    );
  }
}
