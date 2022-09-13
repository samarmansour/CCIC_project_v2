import 'package:flutter/material.dart';
import 'package:taskes_project/bottom_nav.dart';

import 'package:taskes_project/rigister.dart';
import 'bottom_nav.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);
 
  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  TextEditingController mail = TextEditingController();
  TextEditingController Password = TextEditingController();
  var formkey=GlobalKey<FormState>();
   bool ispass = true;
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Login')),
      ),
      body: 
      Form(
        key: formkey,
        child: ListView(
          children: [
            Icon(
              Icons.login,
              color: Colors.blue,
              size: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Text(
              'LOGIN...',
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
              ),
            )),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'log now to browse our hot offers',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                controller: mail,
                decoration: InputDecoration(
                    labelText: 'Email', border: OutlineInputBorder()),
                    validator: (String?value){
                      if (value!.isEmpty){
                        return('email can not be empty');
                      }
                    },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                validator: (String?value){
                      if (value!.isEmpty){
                        return('please enter your password');
                      }
                    },
                controller: Password,
                keyboardType: TextInputType.visiblePassword,
                obscureText: ispass,
                decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(), 
                    suffixIcon: IconButton(onPressed: () {setState(() {
                      ispass=!ispass;
                    });}, icon: ispass?Icon(Icons.visibility_off):Icon(Icons.visibility)),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 1, right: 40, left: 40),
              child: ElevatedButton(
                child: Text('login'),
                onPressed: () {
                  print('mail' + mail.text.toString());
                  print('pass' + Password.text.toString());
                  if(formkey.currentState!.validate()){
                    Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => bottom_navigation()));
                  }
                 
                },
              ),
            ),
            SizedBox(height: 10,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("Don't have an account ?",style: TextStyle(fontSize: 15, color: Colors.grey,fontWeight:FontWeight.bold),)

                 ,TextButton(onPressed: (){
                   Navigator.push(context,
                       MaterialPageRoute(builder: (context) =>Register()));
                 }, child: Text("Register",style: TextStyle(fontSize: 18),))
               ],
             )
          ],
        ),
      ),
    );
  }
}
