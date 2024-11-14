import 'package:flutter/material.dart';
import 'package:form/helper/size_box_helper.dart';
import 'package:form/provider/auth_provider.dart';
import 'package:form/screens/forget_password_screen.dart';
import 'package:form/widgtes/custom_button.dart';
import 'package:form/widgtes/custom_text_field.dart';
import 'package:form/widgtes/screen_background.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/HomeScreen';
  
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
      TextEditingController passwordController = TextEditingController();
        TextEditingController confirmedPasswordController = TextEditingController();
        GlobalKey<FormState> _key = GlobalKey();
  
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Consumer<AuthProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: AppBar(
              actions: [IconButton(onPressed: (){
                provider.logOut();
              }, icon: Icon(Icons.logout))],
            ),
            body:ScreenBackground(
              
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _key
                  ,
                  child: ListView(
                    children: [
                  
                      SizedBoxHelper.sizedBox20,
                     
                         CustomTextField(
                           validator: (String ? value){
                          if(value!.isEmpty){
                            return "Please enter a valid email";
                          }
                          else {
                            return null;
                          }
          
                        },
                           controlller:  emailController,
                       labelText: "Email" ,
                      hintText: "Enter your email", prefixIconData: Icons.email),
                       SizedBoxHelper.sizedBox20,
                         CustomTextField(
                           validator: (String ? value){
                          if(value!.isEmpty || value.length< 8){
                            return "Please  your password";
                          }
                          else {
                            return null;
                          }
          
                        },controlller: passwordController,
                       labelText: "Password" ,
                      hintText: "Enter your password", prefixIconData: Icons.password, 
                      suffixIcon:  IconButton(
                        onPressed: (){
                          provider.setobscureText();
                        },
                        icon: Icon( provider.obsureText?Icons.remove_red_eye : Icons.visibility_off)),),
                       
                      
                       SizedBoxHelper.sizedBox20,
                       CustomButton(onPressed: (){
                        if(_key.currentState!.validate()){
                          if(provider.isLogin){
                            provider.signIn(email: emailController.text, password: passwordController.text);
                          }
                          else{
                            provider.signUp(email: emailController.text, password: passwordController.text);
                          }
                          
          
                        }
                       }, title: provider.isLogin?'Login': 'Register'),
                       MaterialButton(onPressed: (){

                        provider.setIsLogin();
                       }, child:  Text( provider.isLogin ? "Don't have an account ? Register":
                          "Already have an account ? , Login")),
                      MaterialButton(onPressed: (){
                        Navigator.of(context).pushNamed(ForgetPasswordScreen.routeName);
                      }, child:  const Text("Forget Password"),)
                          
                    ],
                  ),
                ),
              ),
            ),
          
            
          );
        }
      ),
    );
  }
}