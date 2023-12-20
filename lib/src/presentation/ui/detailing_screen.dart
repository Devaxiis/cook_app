import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:retsept/src/service/constants/app_color.dart';
import 'package:retsept/src/service/constants/images.dart';
import 'package:retsept/src/service/constants/strings.dart';

class DetailingScreen extends StatefulWidget {
  const DetailingScreen({super.key});

  @override
  State<DetailingScreen> createState() => _DetailingScreenState();
}

class _DetailingScreenState extends State<DetailingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(
         child: Stack(
           children: [
             const SizedBox(
                 height: 320,
                 width: double.maxFinite,
                 child: Image(image: AppImages.devPirock,fit: BoxFit.cover,)),
             Align(
               alignment: Alignment.bottomCenter,
               child: Container(
                 height: MediaQuery.sizeOf(context).height * 0.6,
                 width: double.maxFinite,
                 decoration: const BoxDecoration(
                color: AppColor.devFFFFFF,
                   borderRadius: BorderRadius.only(topLeft: Radius.circular(32),topRight: Radius.circular(32)),
                 ),
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Center(
                         child: Container(
                           height: 5,
                           width: 50,

                           decoration: const BoxDecoration(
                             color: AppColor.devD0DBEA,
                             borderRadius: BorderRadius.all(Radius.circular(32))
                           ),
                         ),
                       ),

                       Text("Pirok",style: GoogleFonts.inter(
                         fontSize: 17,
                         fontWeight: FontWeight.w700,
                         color: AppColor.dev3E5481
                       ),),
                       Text("${Strings.devFood} • ${Strings.dev60mins}",style: GoogleFonts.inter(
                           fontSize: 15,
                           fontWeight: FontWeight.w500,
                           color: AppColor.dev9FA5C0
                       )),

                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Expanded(
                             child: Row(
                       crossAxisAlignment:CrossAxisAlignment.center,
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 Container(
                                   height: 31,
                                   width: 31,
                                   decoration: const BoxDecoration(
                                     // color: AppColor.dev2E3E5C,
                                       image: DecorationImage(image:AppImages.devPerson, fit: BoxFit.contain),
                                       borderRadius: BorderRadius.all(
                                           Radius.circular(11))),
                                 ),
                                 const SizedBox(width: 8),
                                 Expanded(
                                   child: Text(
                                     "Mirjalol Abdunazarov",
                                     style: GoogleFonts.inter(
                                       fontSize: 15,
                                       fontWeight: FontWeight.w700,
                                       color: AppColor.dev3E5481
                                   ),
                                     overflow: TextOverflow.ellipsis,
                                   ),
                                 ),
                               ],
                             ),
                           ),
                           Expanded(
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.end,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   Container(
                                     height:32,
                                     width: 32,

                                     decoration: const BoxDecoration(
                                       color: AppColor.dev1FCC79,
                                       borderRadius: BorderRadius.all(Radius.circular(32))
                                     ),
                                     child: const SizedBox(
                                         height: 15,
                                         width: 15,
                                         child: Icon(Icons.heart_broken,color: AppColor.devFFFFFF,)),
                                   ),
                                   const Text("273 Likes"),
                                 ],
                               ),
                           )
                         ],
                       ),
                        const Divider(
                          color: AppColor.devD0DBEA,
                        ),
                       Text(Strings.devDescription,style: GoogleFonts.inter(
                           fontSize: 17,
                           fontWeight: FontWeight.w700,
                           color: AppColor.dev3E5481
                       )),
                       Text(Strings.devDesc,style: GoogleFonts.inter(
                           fontSize: 15,
                           fontWeight: FontWeight.w500,
                           color: AppColor.devD0DBEA
                       )),
                        const Divider(
                          color: AppColor.devD0DBEA,
                        ),
                       Text(Strings.devIngredients,style: GoogleFonts.inter(
                       fontSize: 17,
                           fontWeight: FontWeight.w700,
                           color: AppColor.dev3E5481
                       )),
                        Row(
                         children: [
                           const Icon(Icons.check,color: AppColor.dev1FCC79,),
                           Text("4 Eggs",style: GoogleFonts.inter(
                               fontSize: 15,
                               fontWeight: FontWeight.w500,
                               color: AppColor.dev2E3E5C
                           )),
                         ],
                       ),
                       Row(
                         children: [
                           const Icon(Icons.check,color: AppColor.dev1FCC79,),
                           Text("4 Eggs",style: GoogleFonts.inter(
                               fontSize: 15,
                               fontWeight: FontWeight.w500,
                               color: AppColor.dev2E3E5C
                           )),
                         ],
                       ),
                       Row(
                         children: [
                           const Icon(Icons.check,color: AppColor.dev1FCC79,),
                           Text("4 Eggs",style: GoogleFonts.inter(
                               fontSize: 15,
                               fontWeight: FontWeight.w500,
                               color: AppColor.dev2E3E5C
                           )),
                         ],
                       ),
                       Row(
                         children: [
                           const Icon(Icons.check,color: AppColor.dev1FCC79,),
                           Text("4 Eggs",style: GoogleFonts.inter(
                               fontSize: 15,
                               fontWeight: FontWeight.w500,
                               color: AppColor.dev2E3E5C
                           )),
                         ],
                       ),
                     ],
                   ),
                 ),
               ),
             ),
           ],
         ),
       ),

    );
  }
}
