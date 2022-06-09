import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'const.dart';
class Booked extends StatefulWidget {
  const Booked({Key? key, DateTime? date}) : super(key: key);

  @override
  _BookedState createState() => _BookedState();
}

class _BookedState extends State<Booked> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Booking",
          style: TextStyle(
              color: AppColors.Text_Black,
              fontWeight: FontWeight.w500,
              fontSize: 20),
        ),
        elevation: 0,
        backgroundColor: AppColors.Text_white,
        leading: InkWell(onTap: (){
          Navigator.pop(context);
        },
          child: Icon(
            Icons.arrow_back,
            color: AppColors.Text_Black,
            size: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20,left: 8,right: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Card(
            elevation: 5,
            child: ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: 250,
                decoration: new BoxDecoration(

                    gradient: new LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.Home_Color1_Gra,
                        AppColors.Home_Color2_Gra
                      ],
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15,bottom: 15,left: 8),
                  child: Column(

                    children: [
                     Row(
                       children: [
                         Text("Name :",style: TextStyle(color: AppColors.Text_white,fontWeight: FontWeight.bold,fontSize: 18),),
                         SizedBox(width: 15),
                         Text("Roberto Aleydon",style: TextStyle(color: AppColors.Text_white,fontWeight: FontWeight.bold,fontSize: 15),),
                       ],
                     ),
                    Row(
                      children: [
                        Text("Sex :",style: TextStyle(color: AppColors.Text_white,fontWeight: FontWeight.bold,fontSize: 18),),
                        SizedBox(width: 15),
                        Text("Male",style: TextStyle(color: AppColors.Text_white,fontWeight: FontWeight.bold,fontSize: 15),),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Number :",style: TextStyle(color: AppColors.Text_white,fontWeight: FontWeight.bold,fontSize: 18),),
                        SizedBox(width: 15),
                        Text("+111 000000000",style: TextStyle(color: AppColors.Text_white,fontWeight: FontWeight.bold,fontSize: 15),),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Appointment Time :",style: TextStyle(color: AppColors.Text_white,fontWeight: FontWeight.bold,fontSize: 18),),
                        SizedBox(width: 15),
                        Text("08.00 AM",style: TextStyle(color: AppColors.Text_white,fontWeight: FontWeight.bold,fontSize: 15),),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Appointment Date :",style: TextStyle(color: AppColors.Text_white,fontWeight: FontWeight.bold,fontSize: 18),),
                        SizedBox(width: 15),
                        Text("",style: TextStyle(color: AppColors.Text_white,fontWeight: FontWeight.bold,fontSize: 15),),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Doctor Name :",style: TextStyle(color: AppColors.Text_white,fontWeight: FontWeight.bold,fontSize: 18),),
                        SizedBox(width: 15),
                        Text("dr.Nick Sanders",style: TextStyle(color: AppColors.Text_white,fontWeight: FontWeight.bold,fontSize: 15),),
                      ],
                    ),
                  ],),
                ),
              ),
            ),
          ),

        ],),
      ),
    );
  }
}
