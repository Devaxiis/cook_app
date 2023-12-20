import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retsept/src/presentation/ui/home_screen.dart';
import 'package:retsept/src/presentation/ui/notification_screen.dart';
import 'package:retsept/src/presentation/ui/profile_screen.dart';
import 'package:retsept/src/presentation/ui/scan_screen.dart';
import 'package:retsept/src/presentation/ui/upload_screen.dart';
import 'package:retsept/src/service/constants/app_color.dart';
import 'package:retsept/src/service/constants/strings.dart';


class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  PageController controller = PageController(initialPage: 0);
  int page = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// #PageView
        body: SafeArea(
          child:PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller,
            children: const [
              HomeScreen(),
              UploadScreen(),
              ScanScreen(),
              NotificationScreen(),
              ProfileScreen(),
            ],
          ),
        ),

      /// #BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedIconTheme: const IconThemeData(color: AppColor.dev9FA5C0),
        selectedIconTheme: const IconThemeData(color: AppColor.dev1FCC79),
        selectedLabelStyle:  const TextStyle(color:AppColor.dev1FCC79),
        unselectedLabelStyle: const TextStyle(color: AppColor.dev9FA5C0),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        useLegacyColorScheme: false,
        onTap: (value){
          page = value;
          if(page != 1){
          controller.jumpToPage(page);
          setState(() {});
          }else{
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const UploadScreen()));
          }
        },
        currentIndex: page,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: Strings.devHome),
          BottomNavigationBarItem(icon: Icon(Icons.edit_rounded),label: Strings.devUpload),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner_sharp),label: Strings.devScan),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.bell_solid),label: Strings.devNotification),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_solid),label: Strings.devProfile),
        ],
      ),
    );
  }
}
