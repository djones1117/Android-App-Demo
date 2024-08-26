import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Android App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
        // routes: {
        //   '/login': (context) => LoginPage(), // this line  defines the route
        // },
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = SignUp();
        break;
      case 1:
        page = LoginPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return Scaffold(
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              extended: false,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.favorite),
                  label: Text('Favorites'),
                ),
              ],
              selectedIndex: selectedIndex,
              onDestinationSelected: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: page,
            ),
          ),
        ],
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var appState = context.watch<MyAppState>();
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Image.asset('assets/images/logo-horizontal.png'),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Log in',
                  style: TextStyle(
                    fontFamily: 'Inter', // Use the Inter font family
                    fontWeight: FontWeight.bold, // Bold style
                    fontSize: 23, // Font size 23px
                    color: Color(0xFF000000), // Color #000000
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'Email address',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Color(0xFF000000),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText:
                  'hello@example.com', // Placeholder text inside the TextField
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Password',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Color(0xFF000000),
              ),
            ),
          ),
          PasswordField(),
          SizedBox(
            height: 32,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Color(0xFF185FD9), // Background color for the inactive state
              foregroundColor: Colors.white, // Text color
              textStyle: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600, // Semi-bold
                fontSize: 18, // Font size 18px
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Radius 8
              ),
              minimumSize:
                  Size(double.infinity, 50), // Full-width button with height 50
            ),
            onPressed: () {
              // Define the action when the button is pressed
            },
            child: Text('Log in'),
          ),
          SizedBox(
            height: 16,
          ),
          TextButton(
            onPressed: () {
              // Define the action when the "Forgot Password?" button is pressed
            },
            child: Text(
              'Forgot password?',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500, // Medium style
                fontSize: 16, // Font size 16px
                color: Color(0xFF185FD9), // Color #185FD9
              ),
            ),
          ),
          SizedBox(
            height: 48,
          ),
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: Color(0xFF7A7A7A), // Color of the line
                  thickness: 1, // Thickness of the line
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'or log in with',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400, // Normal weight
                    fontSize: 16, // Font size 16px
                    color: Color(0xFF7A7A7A), // Color #7A7A7A
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                  color: Color(0xFF7A7A7A), // Color of the line
                  thickness: 1, // Thickness of the line
                ),
              ),
            ],
          ),
          SizedBox(
            height: 32,
          ),
          Row(
            children: [
              Image.asset(
                  'assets/images/Google.png'), // just photos until we add oauth
              Image.asset('assets/images/facebook.png'),
              Image.asset('assets/images/Apple.png'),
            ],
          ),
          SizedBox(
            height: 57,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? ",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF7A7A7A),
                ),
              ),
              SizedBox(
                width: 25,
              ),
              GestureDetector(
                onTap: () {
                  print('sign up button pressed');
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF185FD9),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 48,
          ),
        ],
      ),
    );
  }
}

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Image.asset('assets/images/logo-horizontal.png'),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontFamily: 'Inter', // Use the Inter font family
                    fontWeight: FontWeight.bold, // Bold style
                    fontSize: 23, // Font size 23px
                    color: Color(0xFF000000), // Color #000000
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'Email address',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Color(0xFF000000),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText:
                  'hello@example.com', // Placeholder text inside the TextField
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Password',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Color(0xFF000000),
              ),
            ),
          ),
          PasswordField(),
          SizedBox(
            height: 32,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Color(0xFF185FD9), // Background color for the inactive state
              foregroundColor: Colors.white, // Text color
              textStyle: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600, // Semi-bold
                fontSize: 18, // Font size 18px
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Radius 8
              ),
              minimumSize:
                  Size(double.infinity, 50), // Full-width button with height 50
            ),
            // onPressed: () {
            //   print('sign up button pressed');
            // },
            onPressed: () async {
  final response = await http.post(
    Uri.parse('https://noahs-user-management-jo363h3rtq-ue.a.run.app/create_account'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': 'socjones11117', // Replace with actual username input
      'email': 'socjones21@yahoo.com', // Replace with actual email input
    }),
  );

  if (response.statusCode == 200) {
    // If the server returns an OK response, parse the JSON.
    print('Account created successfully.');
  } else {
    // If the server did not return a 200 OK response, throw an exception.
    throw Exception('Failed to create account.');
  }
},       
            child: Text('Sign up'),
          ),
          SizedBox(
            height: 16,
          ),
          TextButton(
            onPressed: () {
              // Define the action when the "Forgot Password?" button is pressed
            },
            child: Text(
              'Forgot password?',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500, // Medium style
                fontSize: 16, // Font size 16px
                color: Color(0xFF185FD9), // Color #185FD9
              ),
            ),
          ),
          SizedBox(
            height: 48,
          ),
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: Color(0xFF7A7A7A), // Color of the line
                  thickness: 1, // Thickness of the line
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'or sign up with',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400, // Normal weight
                    fontSize: 16, // Font size 16px
                    color: Color(0xFF7A7A7A), // Color #7A7A7A
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                  color: Color(0xFF7A7A7A), // Color of the line
                  thickness: 1, // Thickness of the line
                ),
              ),
            ],
          ),
          SizedBox(
            height: 32,
          ),
          Row(
            children: [
              Image.asset(
                  'assets/images/Google.png'), // just photos until we add oauth
              Image.asset('assets/images/facebook.png'),
              Image.asset('assets/images/Apple.png'),
            ],
          ),
          SizedBox(
            height: 57,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "You already have an account? ",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF7A7A7A),
                ),
              ),
              SizedBox(
                width: 25,
              ),
              GestureDetector(
                onTap: () {
                  print('Login button pressed');
                  // Navigator.pushNamed(context, '/login');
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF185FD9),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 48,
          ),
        ],
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  @override
  PasswordFieldState createState() => PasswordFieldState();
}

class PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: '••••••••', // Placeholder text
        border: OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: _togglePasswordVisibility,
        ),
      ),
    );
  }
}
