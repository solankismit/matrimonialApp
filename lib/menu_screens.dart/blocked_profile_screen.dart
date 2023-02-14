import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimonial_app/model/display_block_user_model.dart' as block;
import 'package:matrimonial_app/model/unblock_user_model.dart' as unblock;

import '../model/api.dart';
import '../model/user_lists_model.dart';

class BlockedProfileScreen extends StatefulWidget {
  const BlockedProfileScreen({Key? key}) : super(key: key);

  @override
  State<BlockedProfileScreen> createState() => _BlockedProfileScreenState();
}

class _BlockedProfileScreenState extends State<BlockedProfileScreen> {

  List<block.Data>? blockIdList;
  List<Data>? blockList;

  Future<bool> loaddata() async{
    blockIdList=[];
    blockList=[];
    block.display_block_user_model? blockUserModel = await displayBlockUsers().blockList();
    print(blockUserModel.message);
  if(blockUserModel.message == "no block user"){
    print('no block user');
      return false;
    }
    if(blockUserModel.message == "display block user"){
      blockIdList = blockUserModel.data;
      user_list_model snapshot = await userList().userLists();
      if (snapshot.data != null) {
      for(int i = 0; i < blockIdList!.length; i++){
        var index = snapshot.data?.indexWhere((element) => element.sId == blockIdList![i].blockId) ?? -1;
        print("BLOCKED SCREEN ${index}");
        print("BLOCKED SCREEN LIST  ${blockList}");
        // print("BLOCKED SCREEN LIST  ${blockList}");
        if(index == -1){continue;}
        blockList!.add(snapshot.data![index]);
        // blockList?.add((snapshot.data?[index])!);
        }
      }
      }
    if(blockList != null && blockList!.length > 0){
      return true;
    }
    return false;
    setState(() {});
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg2.png"), fit: BoxFit.cover)),
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            ListTile(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.of(context).pop(),
                color: Colors.black,
              ),
              title: Container(
                padding: EdgeInsets.only(left: 50.w),
                child: Text(
                  "Blocked Profile",
                  // textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600, fontSize: 18),
                ),
                margin: EdgeInsets.only(left: 10.w),
              ),
            ),
            SizedBox(
              height: 80.h,
            ),
            Expanded(
              child: FutureBuilder<bool>(
                future: loaddata(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data ?? false) {
                      return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: blockList!.length,
                        itemBuilder: (context, index) {
                          return _buildTile(
                            name: blockList![index].userName,
                            image: blockList![index].userPhoto,
                            age: blockList![index].age,
                            designation: blockList![index].designation,
                            blockId: blockIdList![index].sId,
                            location: blockList![index].homeTown,
                          );
                        },
                      );
                    }
                    else {
                      return Center(
                        child: Text(
                          "No Blocked Profile",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      );
                    }
                  }
                  else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }
              ),
            )
            // _buildTile(),
          ],
        ),
      ),
    );
  }

  Padding _buildTile({name, image, age, location, designation, blockId}) {
    return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 10,
              child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      image,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          "assets/blocked_prof_pic.png",
                          fit: BoxFit.cover,
                        );
                      },
                      height: 160.h,
                      width: 80.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    "${name}, ${age}",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${designation}",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                      Text(
                        "${location}",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700, fontSize: 14),
                      ),
                    ],
                  ),
                  isThreeLine: true,
                  trailing: TextButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side:
                                      BorderSide(color: Color(0xff3C0A53))))),
                      onPressed: () async{
                        unblock.unblock_user_model? unblockUserModel = await unblockUser().unblockList( block_id: blockId);
                        if(unblockUserModel != null && unblockUserModel.message == "deleted successfully"){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Unblocked Successfully")));
                          // loaddata();
                          setState(() {});
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 4.h, horizontal: 8.w),
                        child: Text(
                          "Unblock",
                          style: GoogleFonts.inter(
                              color: Color(0xff3C0A53),
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                      ))),
            ),
          );
  }
}
