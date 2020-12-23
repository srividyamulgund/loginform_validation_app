import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter",
      /*theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.light),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),*/
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color('#003366'),
      appBar: AppBar(
        title: Text("Flutter"),
      ),
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode:
              AutovalidateMode.always, //check for validation while typing
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(100.0),
                  child: Container(
                    height: 200,
                    width: 250,
                    child: Image.asset(
                      'asset/images/Flutter_DarkMode.jpg',
                      fit: BoxFit.cover,
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abcdefgh@xxxxx.com',
                  ),
                  validator: MultiValidator([
                    RequiredValidator(errorText: '* Required'),
                    EmailValidator(errorText: 'Enter valid email id')
                  ]),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText:
                        'Password needs to be between 8-15 characters long',
                  ),
                  validator: MultiValidator([
                    RequiredValidator(errorText: '* Required'),
                    MinLengthValidator(8,
                        errorText:
                            'Password needs to be at least 8 chars long'),
                    MaxLengthValidator(15,
                        errorText:
                            'Password needs to be maximum of 15 chars long'),
                    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                        errorText:
                            'passwords must have at least one special character'),
                    PatternValidator(r'(?=.*?[0123456789])',
                        errorText: 'passwords must have at least one digit'),
                  ]),
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 80,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: FlatButton(
                  onPressed: () {
                    if (formkey.currentState.validate()) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => HomePage()));
                      print('Validated');
                    } else {
                      print('Not Validated');
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
