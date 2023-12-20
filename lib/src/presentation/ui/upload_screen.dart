import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:retsept/src/presentation/bloc/create_cook/create_cook_bloc.dart';
import 'package:retsept/src/presentation/ui/main_home_screen.dart';
import 'package:retsept/src/service/constants/app_color.dart';
import 'package:retsept/src/service/constants/images.dart';
import 'package:retsept/src/service/constants/strings.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  TextEditingController foodName = TextEditingController();
  TextEditingController description = TextEditingController();
  double value = 0;
  int itemID = 0;

  final ImagePicker picker = ImagePicker();
  File? image;


  /// #Image Cancel
  void cancelImage() async{
    setState(() => image = null);
  }
  
  /// #Image Picker
  void pickImage(ImageSource source) async  {
    Navigator.pop(context);
    try {
      final result =await picker.pickImage(source: source);
      image = File(result!.path);
      setState(() {});
    }on PlatformException {
      showMessage("Invalid image format");
    }catch (e) {
      showMessage("error");
    }
  }
  
  /// #Error print
  void showMessage(String text){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
  
  /// #Image type galery or take photo
  void getImage(){
    showModalBottomSheet(
        context: context,
        builder:(context) {
          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(title:  const Text( "Take a photo"),onTap: () => pickImage(ImageSource.camera),),
                ListTile(title: const Text("Phone gallery"), onTap: () => pickImage(ImageSource.gallery),),
              ],
            ),
          );
        });
  }
  /// #Save data
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// #AppBar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextButton(
          onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> const MainHomeScreen()));
          },
          child: Text(Strings.devCancel,style: GoogleFonts.inter(
            color: AppColor.devFF6464,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),),
        ),
        actions: [
          RichText(text: TextSpan(
            children: [
              TextSpan(text: '1/',style: GoogleFonts.inter(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: AppColor.dev3E5481
              )),
              TextSpan(text: '2',style:GoogleFonts.inter(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: AppColor.dev9FA5C0
              ) ),
            ]
          )),
          const SizedBox(width: 24),
        ],
      ),

      /// #Body
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// #Image
              Material(
                clipBehavior: Clip.antiAlias,
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: InkWell(
                  onTap: (){
                    getImage();
                  },
                  child: Container(
                    height: 161,
                    width: 327,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      border: Border.all(
                        color: AppColor.devD0DBEA,
                        width: 2,
                      )
                    ),
                    child:image != null?Stack(
                      alignment: Alignment.topRight,
                      children: [
                        SizedBox.expand(child: ClipRRect(
                            clipBehavior:Clip.antiAlias,
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            child: Image(image: FileImage(image!),fit: BoxFit.cover,))),
                        IconButton(
                            onPressed:cancelImage ,
                            icon: const Icon(Icons.cancel,size: 30,))
                      ],
                    ) :Padding(
                      padding: const EdgeInsets.symmetric(vertical: 17),
                      child: Column(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                              height:64,
                              width: 64,
                              child: Image(image: AppImages.devImage)),
                          Text(Strings.devAddCoverPhoto,style: GoogleFonts.inter(
                            color: AppColor.dev3E5481,
                              fontSize: 15,
                            fontWeight: FontWeight.w700
                          ),),
                          Text(Strings.devUpto12Mb,style: GoogleFonts.inter(
                              color: AppColor.dev9FA5C0,
                              fontSize: 12,
                              fontWeight: FontWeight.w500
                          ),),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              /// #FoodName
              SizedBox(
                height: 90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Strings.devFoodName,style: GoogleFonts.inter(
                      color: AppColor.dev3E5481,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,

                    ),),
                    SizedBox(
                      height: 56,
                      child: TextField(
                        controller: foodName,
                        decoration: InputDecoration(
                        hintText: Strings.devEnterfoodname,
                          hintStyle: GoogleFonts.inter(
                            color: AppColor.dev9FA5C0,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(32)),
                            borderSide: BorderSide(
                              color: AppColor.devD0DBEA,
                              width: 1
                            )
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(32)),
                              borderSide: BorderSide(
                                color: AppColor.devD0DBEA,
                                width: 1
                              )
                          ),
                          errorBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(32)),
                              borderSide: BorderSide(
                                  color: AppColor.devD0DBEA,
                                  width: 1
                              )
                          ),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(32)),
                              borderSide: BorderSide(
                                  color: AppColor.devD0DBEA,
                                  width: 1
                              )
                          ),

                        ),
                      ),
                    ),


                  ],
                ),
              ),
              const SizedBox(height: 24),

              /// #Description
              SizedBox(
                height: 110,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Strings.devDescription,style: GoogleFonts.inter(
                      color: AppColor.dev3E5481,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,

                    ),),
                    SizedBox(
                      height: 80,
                      child: TextField(
                        maxLines: 3,
                        controller: description,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        decoration: InputDecoration(
                          hintText: Strings.devTellaLittleAboutYourFood,
                          hintStyle: GoogleFonts.inter(
                              color: AppColor.dev9FA5C0,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal
                          ),
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                  color: AppColor.devD0DBEA,
                                  width: 1
                              )
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                  color: AppColor.devD0DBEA,
                                  width: 1
                              )
                          ),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                  color: AppColor.devD0DBEA,
                                  width: 1
                              )
                          ),

                        ),
                      ),
                    ),


                  ],
                ),
              ),
              const SizedBox(height: 24),

              /// #Cooking Duration
              SizedBox(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(text: TextSpan(
                      children: [
                        TextSpan(text: Strings.devCookingDuration,style:GoogleFonts.inter(
                            color: AppColor.dev3E5481,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal
                        ),),
                        TextSpan(text: Strings.devInMinutes,style: GoogleFonts.inter(
                            color: AppColor.dev9FA5C0,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal
                        ),),
                      ]
                    )),
                    DefaultTextStyle(
                      style: GoogleFonts.inter(
                        color: AppColor.dev9FA5C0,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(Strings.dev10),
                          Text(Strings.dev30),
                          Text(Strings.dev60),
                        ],
                      ),
                    ),
                    Slider(
                        value: value,
                        divisions: 2,
                        activeColor: AppColor.dev1FCC79,
                        inactiveColor: AppColor.devF4F5F7,
                        onChanged: (index){
                          value = index;
                          setState(() {});
                        }),
                  ],
                ),
              ),
              const SizedBox(height: 48),

              /// #Next
              Material(
                clipBehavior: Clip.antiAlias,
                borderRadius: const BorderRadius.all(Radius.circular(32)),
                child: InkWell(
                  onTap: (){
                    context.read<CreateCookBloc>().add(AddNewCookEvent(
                        id: itemID,
                        name: foodName.text.trim(),
                        description: description.text.trim(),
                        time: value,
                        imageUrl: "$image"
                    ));
                    foodName.text = '';
                    description.text ='';
                    value = 0;
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 56,
                    width: 327,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: AppColor.dev1FCC79,
                      borderRadius: BorderRadius.all(Radius.circular(32))
                    ),
                    child: Text(Strings.devNext,style: GoogleFonts.inter(
                      color: AppColor.devFFFFFF,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal
                    ),),
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
