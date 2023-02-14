import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matrimonial_app/model/add_profile_pic_model.dart';
import 'package:matrimonial_app/model/api.dart';
import 'package:matrimonial_app/utils/routes.dart';
import 'package:matrimonial_app/widgets/gradient_button.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import 'dart:io';

class MultipleProfileScreen extends StatefulWidget {
  const MultipleProfileScreen({Key? key}) : super(key: key);

  @override
  State<MultipleProfileScreen> createState() => _MultipleProfileScreenState();
}

class _MultipleProfileScreenState extends State<MultipleProfileScreen> {

  bool _isLoading = false;
  List<File?> _image =[null,null,null,null,null];
  Future getImage(ImageSource source,int i) async {
    try {
      final XFile? image1 = await ImagePicker().pickImage(source: source);
      final File image = File(image1!.path);
      if (image == null) return;
      final imagePermanent = await saveImagePermanently(image.path);
      setState(() {
        _image[i] = imagePermanent;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image : $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return _isLoading?SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(child: CircularProgressIndicator(),))
        :Scaffold(
        backgroundColor: Colors.amber,
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg1.png"), fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  screenHeight < 800
                      ? SizedBox(height: 290.h)
                      : SizedBox(height: 210.h),
                  Container(
                    child: Text(
                      "Upload",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30.sp),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.w, top: 20.h),
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                        "Your multiple photos with\nclose-ups as well as your distant angle",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.kristi(
                          textStyle: TextStyle(
                              fontSize: 25.sp,
                              // fontWeight: F.spontWeight.bold,
                              letterSpacing: 0.3),
                        )),
                  ),
                  //Create GridView With 5 widgets and 2 row and 2nd row should be center
                  
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                        childAspectRatio: 1,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1),
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: CircleAvatar(
                              radius: 40.r,
                              backgroundColor: Color(0xffFA1BFF),
                              child: CircleAvatar(
                                radius: 35.r,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 31.r,
                                  backgroundColor: Color(0xfff9d2ff),
                                  backgroundImage:
                                      _image.elementAt(index) == null ? null : FileImage(_image.elementAt(index)!),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: screenHeight < 800 ? 50 : 55,
                            left: screenWidth < 380 ? 68 : 73,
                            child: Container(
                              width:  40 ,
                              height:  40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60.r),
                                  color: const Color(0xffFA1BFF)),
                              child: IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text(
                                            "Choose option",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xffFA1BFF)),
                                          ),
                                          content: SizedBox(
                                            height: 100.h,
                                            child: Column(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    getImage(ImageSource.camera,index);
                                                    Navigator.pop(context);
                                                  },
                                                  splashColor:
                                                      Colors.purpleAccent,
                                                  child: Row(
                                                    children: [
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        child: Icon(
                                                          Icons.camera,
                                                          color:
                                                              Colors.purpleAccent,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Camera",
                                                        style: TextStyle(
                                                            fontSize: 18.sp),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                const Divider(
                                                  color: Colors.purpleAccent,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    getImage(ImageSource.gallery,index);
                                                    Navigator.pop(context);
                                                  },
                                                  splashColor:
                                                      Colors.purpleAccent,
                                                  child: Row(
                                                    children: [
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        child: Icon(
                                                          Icons.image,
                                                          color:
                                                              Colors.purpleAccent,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Gallery",
                                                        style: TextStyle(
                                                            fontSize: 18.sp),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          // content: ListBody(children: [
                                          //   InkWell(
                                          //     splashColor: Colors.purpleAccent,
                                          //     child: Row(
                                          //       children: [
                                          //         Padding(
                                          //           padding: EdgeInsets.all(8),
                                          //           child: Icon(
                                          //             Icons.camera,
                                          //             color: Colors.purpleAccent,
                                          //           ),
                                          //         ),
                                          //         Text(
                                          //           "Camera",
                                          //           style: TextStyle(fontSize: 18),
                                          //         )
                                          //       ],
                                          //     ),
                                          //   )
                                          // ]),
                                        );
                                      });
                                },
                                icon: Icon(
                                  Icons.add_a_photo,
                                  color: Colors.white,
                                  size: 20.sm,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  GradientButton(
                      width: 280.w,
                      height: 50.h,
                      color1: Color(0xfffd7a8f),
                      color2: Color(0xfff653e1),
                      // text: "Save",
                      text: "Submit",
                      onPressed: () async{
                        setState(() {
                          _isLoading = true;
                        });
                        add_profilepic_model AddProfilePicModel = await _onSubmit(context);
                        setState(() {
                          _isLoading = false;
                        });
                        if(AddProfilePicModel.message == "user_photo added"){
                          Navigator.pushReplacementNamed(
                                      context, MyRoutes.profileScreenRoute);
                        }
                        else{
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(
                            content: Text(AddProfilePicModel.message.toString()),
                          ));
                        }
                      }),
                  TextButton(onPressed: (){Navigator.pushReplacementNamed(
                      context, MyRoutes.profileScreenRoute);}, child: Text("Skip",style: TextStyle(color: Colors.pinkAccent),))
                ]),
          ),
        ));
  }

  Future<add_profilepic_model> _onSubmit(context) async {
    List<String> imagepaths = [];
    if(_image.every((element) => element == null)){
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(
      //   content: Text("Please Select Image"),
      // ));
      return add_profilepic_model(message: "Please Select Image");
    }
    for (int i = 0; i < _image.length; i++) {
      if(_image.elementAt(i) != null){
        imagepaths.add(_image.elementAt(i)!.path);
      }
    }
    add_profilepic_model addProfilepicModel = await profilePicAdd().uploadImage(imagepaths);

    return addProfilepicModel;
  }
}
