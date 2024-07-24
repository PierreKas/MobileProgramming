import 'package:calculator/pages/buttons.dart';
import 'package:calculator/pages/signin.dart';
import 'package:calculator/pages/signup.dart';
import 'package:flutter/material.dart';
//import 'calculator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const SignInScreen(),
    const SignUpScreen(),
    const CalculatorScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Navigation Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Sign In'),
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
                Navigator.pop(context); // close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.app_registration),
              title: Text('Sign Up'),
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                });
                Navigator.pop(context); // close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.calculate),
              title: Text('Calculator'),
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                });
                Navigator.pop(context); // close the drawer
              },
            ),
          ],
        ),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Sign In',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.app_registration),
            label: 'Sign Up',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculator',
          ),
        ],
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      bottom: false,
      child: Column(
        children: [
          //output
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(32),
                child: const Text(
                  "0",
                  style: TextStyle(
                      fontSize: 100, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ),
          //buttons
          Wrap(
            children: Btn.buttonValues
                .map(
                  (value) => SizedBox(
                      width: screenSize.width / 4,
                      height: screenSize.width / 5,
                      child: buildButton(value)),
                )
                .toList(),
          )
        ],
      ),
    ));
  }

  Widget buildButton(value) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        color: [Btn.del, Btn.clr].contains(value)
            ? Colors.blueGrey
            : [
                Btn.per,
                Btn.multiply,
                Btn.add,
                Btn.substract,
                Btn.divide,
                Btn.calculate,
              ].contains(value)
                ? Colors.orange
                : Colors.black,
        clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white24,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: InkWell(
          onTap: () {},
          child: Center(
            child: Text(value),
          ),
        ),
      ),
    );
  }
}
