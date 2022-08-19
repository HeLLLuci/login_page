import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.red[100],
        elevation: 10,
        width: 200,
        child: Column(
          children: [
            DrawerHeader(child: Text("Login Page by Mustkeem"),)
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Login Page",
          style: TextStyle(fontFamily: "BLUECHERIES", fontSize: 30),
        ),
      ),
      backgroundColor: Colors.red[100],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                child: Image(
                    image: AssetImage("assets/images/lock.png"), width: 100),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 50, 20, 30),
                decoration: BoxDecoration(),
                child: GestureDetector(
                  onTap: (){
                  //  enter your navigation here
                  },
                  child: Text("Enter Your credentials",
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: "BLUECHERIES",
                          color: Colors.grey)),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: "Username",
                    // helperText: "Enter Username",
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      // labelText: "Password",
                      label: Text(
                        "Password",
                        style: TextStyle(),
                      )),
                  onChanged: (String value) {
                    print("Entered Password is: ${value}");
                  },
                ),
              ),
              Container(
                  height: 50,
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      topRight: Radius.circular(15))))),
                      onPressed: () {
                        showDialog(barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: Text("Sure to Continue"),
                                  content: Text("Check All details filled"),
                                  actions: <Widget>[
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("Sure"))
                                  ],
                                ));
                      },
                      child: Text("Submit"))),
              // ElevatedButton.icon(onPressed: (){}, icon: Image(image: AssetImage("assets/images/lock.png")), label: Text("Submit Alt"))
            ],

          ),
        ),
      ),
    );
  }
}
