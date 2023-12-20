
import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:retsept/src/core/service_loactor.dart';
import 'package:retsept/src/domain/model/cooking_model.dart';
import 'package:retsept/src/presentation/bloc/create_cook/create_cook_bloc.dart';
import 'package:retsept/src/presentation/bloc/read_cook/read_cook_bloc.dart';
import 'package:retsept/src/presentation/ui/detailing_screen.dart';
import 'package:retsept/src/service/constants/app_color.dart';
import 'package:retsept/src/service/constants/images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();
  List<CookingModel> cook = [];
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    context.read<ReadCookBloc>().add(ReadCook());
    getData();
  }

  void getData(){
    cook = repository.readCooking();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// #AppBar
      appBar: AppBar(
        backgroundColor: AppColor.devFFFFFF,
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        title: Container(
          height: 56,
          width: MediaQuery.sizeOf(context).width,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
              color: AppColor.devF4F5F7,
              borderRadius: BorderRadius.all(Radius.circular(32))),
          child:  TextField(
            controller: controller,
            decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 24,
                      width: 24,
                      child: Image(image: AppImages.devSearch)),
                ),
                suffixIcon: IconButton(onPressed: (){
                  controller.text = '';
                  setState(() {});
                },icon: const Icon(Icons.cancel),),
                hintText: "Search",
                border: InputBorder.none),
          ),
        ),
        actions: const [
          SizedBox(
              height: 24,
              width: 24,
              child: Image(image: AppImages.devFilter)),
          SizedBox(width: 24),
        ],
        bottom: const PreferredSize(
          preferredSize: Size(double.infinity, 20),
          child: SizedBox(height: 20),
        ),
      ),

      /// Body
      body: MultiBlocListener(
        listeners: [
          BlocListener<CreateCookBloc,CreateCookState>(
            listener: (context,state){
              if(state == AddCookSuccess){
                context.read<ReadCookBloc>().add(ReadCook());
              }
              if(state == AddCookFailure){

              }
            },
          ),

        ],
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1.7 / 3,
              ),
              itemCount: cook.length,
              itemBuilder: (_, index) {
                final data = cook[index];
                File image =File('');
                  image.writeAsString(data.imageUrl??"");

                return ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Material(
                    child: InkWell(
                      onTap: () {
                       Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DetailingScreen()));
                      },
                      child: Container(
                        padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
                        decoration: const BoxDecoration(
                          color: Color(0x55ffffff),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Row(
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
                                      flex: 2,
                                      child: Text(
                                        "Mirjalol Abdunazarov",
                                        style: GoogleFonts.inter(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: AppColor.dev2E3E5C,
                                            fontStyle: FontStyle.normal),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                )),
                            Expanded(
                              flex: 4,
                              child: Container(
                                height: MediaQuery.sizeOf(context).height,
                                width: MediaQuery.sizeOf(context).width,
                                alignment: Alignment.topRight,
                                padding: const EdgeInsets.all(16),
                                decoration:  const BoxDecoration(

                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Image(image: FileImage(image)),
                                    Container(
                                      height: 32,
                                      width: 32,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(8))
                                      ),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        fit: StackFit.passthrough,
                                        children: [
                                          Container(
                                            height: 32,
                                            width: 32,
                                            decoration: const BoxDecoration(
                                              color: Color(0x55ffffff),
                                                borderRadius: BorderRadius.all(Radius.circular(8))
                                            ),
                                            child: ImageFiltered(
                                              imageFilter: ImageFilter.blur(
                                                sigmaX: 2,
                                                sigmaY: 2
                                            ),
                                              child: const SizedBox(
                                                height: 32,
                                                width: 32,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: Icon(Icons.favorite_outline,color:AppColor.devFFFFFF,))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Text(
                                            data.name??"",
                                            style: GoogleFonts.inter(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700,
                                                color: AppColor.dev3E5481,
                                                fontStyle: FontStyle.normal),
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                      Expanded(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Food • >60 mins',
                                            style: GoogleFonts.inter(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: AppColor.dev9FA5C0,
                                                fontStyle: FontStyle.normal),
                                          ),
                                          const Text("",
                                              style: TextStyle(
                                                  color: Color(0xfff38634))),
                                        ],
                                      )),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        )),
      ),
    );

  }
}
