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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        ),
        initialRoute: '/signup', // Set SignUp as the initial route
        routes: {
          '/login': (context) => LoginPage(), // Route for the LoginPage
          '/signup': (context) => SignUp(), // Route for the SignUp page
        },
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
}

// class MyHomePage extends StatefulWidget {
//   @override
//   MyHomePageState createState() => MyHomePageState();
// }

// class MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.white,
//         child: Navigator(
//           onGenerateRoute: (settings) {
//             Widget page;
//             if (settings.name == '/') {
//               page = SignUp(); // Default page
//             } else if (settings.name == '/login') {
//               page = LoginPage();
//             } else if (settings.name == '/signup') {
//               page = SignUp();
//             } else {
//               throw UnimplementedError('Unknown route: ${settings.name}');
//             }
//             return MaterialPageRoute(builder: (_) => page);
//           },
//         ),
//       ),
//     );
//   }
// }

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var appState = context.watch<MyAppState>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Image.asset('assets/images/logo-horizontal.png'),
            SizedBox(
              height: 40,
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
            SizedBox(
              height: 8,
            ),
            PasswordField(),
            SizedBox(
              height: 32,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(
                    0xFF185FD9), // Background color for the inactive state
                foregroundColor: Colors.white, // Text color
                textStyle: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600, // Semi-bold
                  fontSize: 18, // Font size 18px
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Radius 8
                ),
                minimumSize: Size(
                    double.infinity, 50), // Full-width button with height 50
              ),
              onPressed: () async {
                // Replace 'socjones29' and 'Milan17' with  actual username and password variables
                final response = await http.post(
                  Uri.parse(
                      'https://noahs-user-management-jo363h3rtq-ue.a.run.app/get_session_token'),
                  headers: <String, String>{
                    'Content-Type': 'application/x-www-form-urlencoded',
                  },
                  body: {
                    'grant_type': 'password',
                    'username': 'socjones29',
                    'password': 'Milan17',
                    'scope': '',
                    'client_id': 'string',
                    'client_secret': 'string',
                  },
                );

                if (response.statusCode == 200) {
                  // Parse the JSON response
                  final Map<String, dynamic> responseData =
                      jsonDecode(response.body);
                  final String accessToken = responseData['access_token'];

                  // Print the access token to the console (or store it as needed)
                  print('Access Token: $accessToken');

                  // Navigate to the next page logic here
                } else {
                  // Handle the error - show an error message to the user
                  print('Failed to login: ${response.statusCode}');
                }
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
              mainAxisAlignment: MainAxisAlignment.center,
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
                    Navigator.pushReplacementNamed(context, '/signup');
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
      ),
    );
  }
}

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Image.asset('assets/images/logo-horizontal.png'),
            SizedBox(
              height: 40,
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
            SizedBox(
              height: 8,
            ),
            PasswordField(),
            SizedBox(
              height: 32,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(
                    0xFF185FD9), // Background color for the inactive state
                foregroundColor: Colors.white, // Text color
                textStyle: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600, // Semi-bold
                  fontSize: 18, // Font size 18px
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Radius 8
                ),
                minimumSize: Size(
                    double.infinity, 50), // Full-width button with height 50
              ),
              // onPressed: () {
              //   print('sign up button pressed');
              // },
              onPressed: () async {
                final response = await http.post(
                  Uri.parse(
                      'https://noahs-user-management-jo363h3rtq-ue.a.run.app/create_account'),
                  headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                  },
                  body: jsonEncode(<String, String>{
                    'username':
                        'socjones29', // Replace with actual username input
                    'email':
                        'djones111797@gmail.com', // Replace with actual email input
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
              mainAxisAlignment: MainAxisAlignment.center,
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
                    Navigator.pushReplacementNamed(context, '/login');
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
