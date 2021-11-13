import 'package:compify/about.dart';
import 'package:compify/faq.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: setting(),
    );
  }
}

class setting extends StatefulWidget {
  setting({Key? key}) : super(key: key);

  @override
  _settingState createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[400],
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => About()));
            },
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.landscape),
              title: Text("About"),
              subtitle: Text("Compify!!"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
          RaisedButton(
            onPressed: () {},
            child: ListTile(
              leading: Icon(Icons.help_outline_rounded),
              title: Text("Help"),
              subtitle: Text("Clear the doubt.."),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Faq()));
            },
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.question_answer),
              title: Text("FAQ"),
              subtitle: Text("Here the soutions!"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
          RaisedButton(
            onPressed: () {},
            child: ListTile(
              leading: Icon(Icons.feedback_rounded),
              title: Text("Feedback"),
              subtitle: Text("Give ur thoughts.."),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
          RaisedButton(
            onPressed: () {},
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.save),
              title: Text("Terms & conditions"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              subtitle: Text("Licences"),
            ),
          ),
          RaisedButton(
            onPressed: () {},
            child: ListTile(
              leading: Icon(Icons.delete),
              title: Text("Delete Account"),
              subtitle: Text("We will wait for you!!"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
          RaisedButton(
            onPressed: () {},
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text("Log out"),
              subtitle: Text("Come Quick! Gain Coupons!!"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
