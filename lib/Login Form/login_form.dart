import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: Text('Login Page', style: TextStyle(
          fontSize: 35,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),),
      ),

     body: SingleChildScrollView(
       child: Column(
        children: [
          Image.network('https://cdn.pixabay.com/photo/2021/11/11/12/41/facebook-6786210_960_720.png',
            height: 200,
            width: 300,
          ),
       
          Column(
            children: [
              Text('Welcome!',style: TextStyle(
                fontSize: 35,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),),
       
              SizedBox(height: 20),
       
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.blueAccent,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              ),
                            ),
       
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return 'Please enter your phone number';
                            }
                            else {
                              return null;
                            }
                          },
                        ),
                      ),
       
                      SizedBox(height: 10,),
       
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.visibility),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.blueAccent,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
       
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return 'Please enter your password';
                            }
                            else {
                              return null;
                            }
                          },
                        ),
                      ),
       
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(onPressed: (){},
                                child: Text('Forgot Password?',style: TextStyle(
                              fontSize: 18,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w400,
                            ),)),
                          ],
                        ),
                      ),
       
                      SizedBox(height: 10,),
       
                      SizedBox(
                        height: 50,
                        width: 200,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: (){
                              if(_formKey.currentState!.validate()){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Login Successful')),
                                );
                                phoneController.clear();
                                passwordController.clear();
                              }
                        }, child: Text('Login',style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),)),
                      ),
       
                      SizedBox(height: 20,),
       
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.email_outlined,
                          color: Colors.red),
       
                          SizedBox(width: 10,),
       
                          Icon(Icons.facebook_outlined,
                          color: Colors.blueAccent),
                        ],
                      ),
       
                      SizedBox(height: 20,),
       
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?",style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),),
       
                          TextButton(
                            onPressed: (){},
                            child: Text('Sign Up',style: TextStyle(
                              fontSize: 20,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
