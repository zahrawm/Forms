import 'package:flutter/material.dart';
import 'package:form/helper/size_box_helper.dart';
import 'package:form/widgtes/custom_button.dart';
import 'package:form/widgtes/custom_text_field.dart';
import 'package:form/widgtes/screen_background.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static String routeName ='/forgetPasswordScreen';
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body: ScreenBackground(child: ListView(children: [
            SizedBoxHelper.sizedBox100,
            const Text("Enter your email to reset your password",
            textAlign: TextAlign.center, style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            CustomTextField(controlller: emailController, hintText: "Enter your email",
             labelText: 'Email', prefixIconData: Icons.email, validator: (String? value){
              if(value!.isEmpty){
                return 'Please enter a value';
              }
              return null;

             }),
             SizedBoxHelper.sizedBox20,
             CustomButton(onPressed: (){}, title: "Forget Password")
       ],)),
    );

  }
}