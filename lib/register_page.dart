import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  SizedBox box = SizedBox(
    height: 15,
  );
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Page"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            box,
            Icon(
              Icons.how_to_reg,
              size: 100,
              color: Colors.blue,
            ),
            Form(
              key: registerFormKey,
              child: Container(
                margin: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: userNameController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter User Name...";
                        }
                        return null;
                      },
                      onSaved: (val) async {
                        SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                        await prefs.setString('userName', val!);
                      },
                      decoration: InputDecoration(
                        hintText: "vivek tejani",
                        label: Text("User Name"),
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    box,
                    TextFormField(
                      controller: numberController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter Number...";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                      onSaved: (val) async {
                        SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                        await prefs.setString('number', val!);
                      },
                      decoration: InputDecoration(
                        hintText: "Mobile Number",
                        label: Text("Mobile Number"),
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    box,
                    TextFormField(
                      controller: passwordController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter Password ...";
                        }
                        return null;
                      },
                      onSaved: (val) async {
                        SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                        await prefs.setString('password', val!);
                      },
                      decoration: InputDecoration(
                        hintText: "Create Password",
                        label: Text("Create PAssword"),
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    box,
                    TextFormField(
                      controller: confirmPasswordController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter Confirm Password...";
                        } else if (val != passwordController.text) {
                          return "Enter Same Password...";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (val) async {
                        SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                        await prefs.setString('confirmPassword', val!);
                      },
                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        label: Text("Confirm PAssword"),
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();

                if (registerFormKey.currentState!.validate()) {
                  registerFormKey.currentState!.save();
                  await prefs.setBool('isRegister', true);
                  Navigator.of(context).pushReplacementNamed('Login_page');
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(100, 35),
                shape: StadiumBorder(),
              ),
              child: const Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}