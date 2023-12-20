import 'package:flutter/material.dart';

Future<Widget> BottomSheetNew(BuildContext context)async{
  return await showModalBottomSheet(
      context: context,
      builder: (context){
        return Container(
          height: 500,
          color: Colors.black,
        );
      });
}
