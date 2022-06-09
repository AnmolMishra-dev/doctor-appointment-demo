import 'package:flutter/material.dart';
import 'package:flutter_appointment/const.dart';

import 'Booked_page.dart';
import 'Schedule_Page.dart';

class Appointment extends StatefulWidget {
  const Appointment({Key? key}) : super(key: key);

  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Appointment",
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          "https://st3.depositphotos.com/10654668/13844/i/1600/depositphotos_138445604-stock-photo-male-doctor-in-hospital.jpg"),
                    ),
                    Column(
                      children: [
                        Text(
                          "dr.Nick Sanders",
                          style: TextStyle(
                              color: AppColors.Text_Black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Dermatologist London",
                          style: TextStyle(
                              color: AppColors.Text_Black, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  padding: EdgeInsets.all(15),
                  height: 70,
                  width: MediaQuery.of(context).size.width*.8,
                  decoration: BoxDecoration(
                      color: AppColors.Text_Filed_Cream_Color,
                      borderRadius: BorderRadius.circular(10)

                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Container(height: 40,width:100,
                   decoration: BoxDecoration(
                     color: AppColors.Home_Color1_Gra,
                     borderRadius: BorderRadius.circular(10)

                   ),
                        child:  Center(child: Text("Profil",style: TextStyle(color:AppColors.Text_white,fontSize: 15,fontWeight: FontWeight.w500),))
                    ),
                    InkWell(onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Schedule()),
                      );
                    }
                    ,
                      child: Container(
                          padding: EdgeInsets.only(right: 30),
                          height: 40,

                      child:  Center(child: Text("Schedule",style: TextStyle(color:AppColors.Text_Black,fontSize: 15,fontWeight: FontWeight.bold),))
                      ),
                    )
                  ],),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(

                  children: [
                    Align(alignment: Alignment.topLeft,child: Text("About Us",style: TextStyle(color: AppColors.Text_Black,fontSize: 18,fontWeight: FontWeight.w500),)),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(child: Text("We have great designed WordPress theme for dermatologists which can be used easily by clinics and dermatology doctors. Our great design WordPress design gives you a lot of options to finalize your website in effective way. Dermatology WordPress theme is awesome way to create the best website for your dermatology",style: TextStyle(color: AppColors.Text_Black,fontSize: 15,),)),
                    )
                  ],
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width*.6,
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Column(children: [
                  Text("Patients",style: TextStyle(color: AppColors.Text_Black,fontSize: 15,fontWeight: FontWeight.w500),),
                  Text("550+",style: TextStyle(color: AppColors.Text_Black,fontSize: 20,fontWeight: FontWeight.bold),),
                ],),
                Column(children: [
                  Text("Experience",style: TextStyle(color: AppColors.Text_Black,fontSize: 15,fontWeight: FontWeight.w500),),
                  Text("13Yrs+",style: TextStyle(color: AppColors.Text_Black,fontSize: 20,fontWeight: FontWeight.bold),),
                ],),
              ],),),

              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Booked()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    child: Center(child: Text("Book Appointment",style:TextStyle(color: AppColors.Text_white,fontWeight: FontWeight.w500,fontSize: 15),)),
                    height: 60,
                    width: MediaQuery.of(context).size.width*.7,
                    decoration: BoxDecoration(
                      color: AppColors.Home_Color1_Gra,
                      borderRadius: BorderRadius.circular(15)
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
