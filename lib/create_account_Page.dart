import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Come_back_page.dart';
import 'Sign_up_Page.dart';
import 'const.dart';
class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
          colors: [
            AppColors.Home_Color1_Gra,
            AppColors.Home_Color2_Gra
      ],),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Column(

              children: [
                Spacer(flex: 1,),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("Welcome to \nVirtual Health",textAlign: TextAlign.center,style: TextStyle(color:AppColors.Text_white,fontSize: 25,fontWeight: FontWeight.w500 ),),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Create Account",style: TextStyle(color:AppColors.Text_Black,fontSize: 25,fontWeight: FontWeight.w500 ),),

                Padding(
                  padding: const EdgeInsets.only(top: 15,bottom: 15),
                  child: Container(

                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: Color(0XFFfbf8ff),
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                    width: MediaQuery.of(context).size.width*.9,
                    child: TextFormField(


                      decoration: const InputDecoration(

                        hintStyle: TextStyle(color: Color(0XFFd9d8dc),fontSize: 18),
                          border:InputBorder.none,
                          hintText: "Full Name"
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Container(

                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: Color(0XFFfbf8ff),
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    width: MediaQuery.of(context).size.width*.9,
                    child: TextFormField(


                      decoration: const InputDecoration(

                          hintStyle: TextStyle(color: Color(0XFFd9d8dc),fontSize: 18),
                          border:InputBorder.none,
                          hintText: "Email or Phone Number"
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(

                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: Color(0XFFfbf8ff),
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    width: MediaQuery.of(context).size.width*.9,
                    child: TextFormField(


                      decoration: const InputDecoration(

                          hintStyle: TextStyle(color: Color(0XFFd9d8dc),fontSize: 18),
                          border:InputBorder.none,
                          hintText: "Password"
                      ),
                    ),
                  ),
                ),

                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ComeBack()),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width*.7,
                    height: 70,
                    child: Card(

                      shadowColor: Colors.black.withOpacity(.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Color(0XFF006dff),
                      elevation: 20,
                      child: Center(child: Text("Sign Up",style: TextStyle(color:AppColors.Text_white,fontSize: 20, ))),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>SignIp()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15,bottom: 15),
                    child: RichText(
                      text: TextSpan(
                        text: 'Already Have an Account ',
                       style: TextStyle(color: AppColors.Text_Black,fontSize: 13,),
                        children: const <TextSpan>[
                          TextSpan(text: 'Sign in', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,)),


                        ],
                      ),
                    ),
                  ),
                ),
            Padding(
              padding: const EdgeInsets.only(top: 25,bottom: 15),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final boxWidth = constraints.constrainWidth();
                  final dashWidth = 10.0;
                  final dashHeight = 1;
                  final dashCount = (boxWidth / (1.5* dashWidth)).floor();
                  return Flex(
                    children: List.generate(dashCount, (_) {
                      return SizedBox(
                        width: dashWidth,
                        height: 1,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color:Colors.grey.shade400),
                        ),
                      );
                    }),
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    direction: Axis.horizontal,
                  );
                },
              ),
            ),
                Padding(
                  padding: const EdgeInsets.only(top: 15,bottom: 15),
                  child: Text("continue with" ,style: TextStyle(color: AppColors.Text_Black,fontSize: 15,),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 70,
width: 70,
decoration: BoxDecoration(color: Color(0XFFf0f0f0), borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: Card(
shadowColor: Colors.black,
                        elevation: 20,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(15),
                              height: 30,width: 30,
                              child: Image.network("data:image/png;base64,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",fit: BoxFit.fill,width: 20,height: 20,)))),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(color: Color(0XFFf0f0f0), borderRadius: BorderRadius.all(Radius.circular(40))),
                        child: Card(

                            shadowColor: Colors.black,
                            elevation: 20,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Container(
                                padding: EdgeInsets.all(15),
                                height: 20,width: 20,
                                child:
                                Image.network("data:image/png;base64,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"),)))),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(color: Color(0XFFf0f0f0), borderRadius: BorderRadius.all(Radius.circular(40))),
                        child: Card(
                            shadowColor: Colors.black,
                            elevation: 20,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(15),
                              height: 20,width: 20,
                              child: Image.network("data:image/png;base64,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"),
                            ))),
                  ),

                ],)

              ],
            ),
          )
        ],
      ),
    );
  }
}
