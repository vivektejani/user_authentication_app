import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  SizedBox box2 = const SizedBox(
    height: 15,
  );
  bool isfalse = false;

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            box2,
            const Icon(
              Icons.person_pin_circle_outlined,
              size: 100,
              color: Colors.blue,
            ),
            Form(
              key: registerFormKey,
              child: Container(
                margin: const EdgeInsets.all(15),
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
                        String userName = userNameController.text;
                        String password = passwordController.text;

                        SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                        String? fUserName =
                            prefs.getString('userName') ?? "admin";
                        String? fPassword =
                            prefs.getString('password') ?? "admin";
                        if (userName != fUserName) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Wrong Username...",
                              ),
                              backgroundColor: Colors.red,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      },
                      decoration: InputDecoration(
                        label: const Text("User Name"),
                        hintText: "User Name",
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    box2,
                    TextFormField(
                      controller: passwordController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter Password ...";
                        }
                        return null;
                      },
                      onSaved: (val) async {
                        String userName = userNameController.text;
                        String password = passwordController.text;

                        SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                        String? fUserName =
                            prefs.getString('userName') ?? "admin";
                        String? fPassword =
                            prefs.getString('password') ?? "admin";
                        if (userName == fUserName && password == fPassword) {
                          Navigator.of(context).pushReplacementNamed('/');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Wrong Password...",
                              ),
                              backgroundColor: Colors.red,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Password",
                        label: const Text("Password"),
                        prefixIcon: const Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    box2,
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (registerFormKey.currentState!.validate()) {
                  registerFormKey.currentState!.save();
                  Navigator.of(context).pushReplacementNamed('Login_page');
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(100, 35),
                shape: const StadiumBorder(),
              ),
              child: const Text("Login"),
            ),
            box2,
            CheckboxListTile(
                value: isfalse,
                title: const Text("Remember Me"),
                onChanged: (val) async {
                  SharedPreferences prefs =
                  await SharedPreferences.getInstance();
                  if (val == true) {
                    await prefs.setBool('isLoggedIn', true);
                  } else {
                    await prefs.setBool('isLoggedIn', false);
                  }
                  setState(() {
                    isfalse = val!;
                  });
                }),
          ],
        ),
      ),
    );
  }
}