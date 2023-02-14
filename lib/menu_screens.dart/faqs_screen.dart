import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimonial_app/model/api.dart';
import 'package:matrimonial_app/model/display_faq_model.dart';

class FaqsScreen extends StatelessWidget {
  FaqsScreen({Key? key}) : super(key: key);


  Map<String,String>  FaqList = {};
  Future<bool> loaddata() async{
    await getFAQs().get().then((value) {
      print(value.data);
      if(value.data!=null){
        if(value.data!.length==0){
          return false;
        }
        value.data!.forEach((element) {
          if(element.questions!=null) {
            FaqList[(element.questions)??""]=element.answer ?? "";
          }
        });
        print(FaqList);
        return true;
      }
      else{
        return false;
      }
    });
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("FAQs",style: GoogleFonts.inter(
            fontWeight: FontWeight.w600, fontSize: 20, color: Colors.black)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        //Add image as other pages
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg2.png"),
            fit: BoxFit.cover,
          ),
        ),
        //Add Center Title "Have Questions? We are Here to Help."
        child: FutureBuilder<bool>(
          future: loaddata(),
          builder: (context, snapshot) {
            if(snapshot.hasData){

                  return Column(
                    children: [
                      SizedBox(
                        height: 150,
                      ),
                      Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          "Have Questions?\nWe are Here to Help.",
                          style: GoogleFonts.inter(
                              height: 1.9,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w800,
                              fontSize: 19),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      //Add ListView
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                            itemCount: FaqList.length,
                            itemBuilder: (context, index) {

                              return _buildTile(FaqList.keys.elementAt(index), FaqList.values.elementAt(index));
                            }
                        ),
                      ),
                    ],
                  );
                }
            else{
              return Center(child: CircularProgressIndicator());
            }
              }

      ),
    ));
  }

  Widget _buildTile(String question, String answer){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: ExpansionTile(
        //Add Underline
        tilePadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        trailing: Icon(Icons.add, color: Colors.black),
        initiallyExpanded: false,
        title: Text(question, style: GoogleFonts.inter(
            fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black)),
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(answer, style: GoogleFonts.inter(
                fontWeight: FontWeight.w400, fontSize: 16, color: Colors.black)),
          )
        ],
      ),
    );
  }
}