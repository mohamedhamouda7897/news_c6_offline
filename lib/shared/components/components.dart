

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMessage(BuildContext context, String message, String actionName,
    VoidCallback actionCallBack) {
  showDialog(
      context: context,
      builder: (c) {
        return AlertDialog(
          content: Text(message),
          actions: [
            TextButton(onPressed: actionCallBack, child: Text(actionName)),
          ],
        );
      });
}

void showLoading(BuildContext context, String text) {
  showDialog(
      context: context,
      builder: (c) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(
                width: 10,
              ),
              Text(text),
            ],
          ),
        );
      });
}

void hideBottomSheet(BuildContext context) {
  Navigator.pop(context);
}

Widget defaultButton(
    {double Btnwidth = double.infinity,
    required String text,
    required VoidCallback onPressed,
    bool isUpperCse = false,
    Color btnColor = Colors.blue,
    double? raduis}) {
  return Container(
    width: Btnwidth,
    height: 50,
    child: MaterialButton(
      onPressed: onPressed,
      child: Text(
        isUpperCse ? text.toUpperCase() : text,
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(raduis ?? 0.0),
      color: btnColor,
    ),
  );
}

Widget defaultTextButton(
    {required VoidCallback onPressed,
    required String text,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.normal}) {
  return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
      ));
}

Widget defaultTextFormField(
    {required TextEditingController controller,
    required String label,
    int lines = 1,
    ValueChanged<String?>? onChanged,
    ValueChanged<String?>? onSaved,
    required VoidCallback validate,
    TextInputType textInputType = TextInputType.text,
    bool isPassword = false}) {
  return TextFormField(
    controller: controller,
    onChanged: onChanged,
    validator: (text) {
      validate();
    },
    onSaved: onSaved,
    maxLines: lines,
    keyboardType: textInputType,
    decoration: InputDecoration(labelText: label),
    obscureText: isPassword,
  );
}


void showToast({
  required String message,
  required ToastState state,
})async{
  await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: choosenState(state),
      textColor: Colors.white,
      fontSize: 16.0
  );
}

enum ToastState{SUCCESS,ERROR,Warning}

Color choosenState( ToastState state){

  Color color=Colors.white;

  switch(state) {
    case ToastState.SUCCESS:
      color = Colors.green;
      break;
    case ToastState.Warning:
      color = Colors.yellow;
      break;
    case ToastState.ERROR:
      color = Colors.red;
      break;

  }
  // if(state == ToastState.SUCCESS)
  //   {
  //     color= Colors.green;
  //   }else if(state == ToastState.ERROR){
  //   color=Colors.red;
  // }else if(state==ToastState.DONE){
  //   color=Colors.yellow;
  // }else{
  //   color= Colors.grey;
  // }
    return color;
  }


