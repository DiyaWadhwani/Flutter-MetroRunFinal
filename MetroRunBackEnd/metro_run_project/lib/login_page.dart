import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:metro_run/auth.dart';
import 'package:metro_run/profile_page.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  String email;
  String password;
  String phnum;

  User user;

  Animation animation, delayedAnimation, muchDelayedAnimation;
  AnimationController animationController;

  Widget googleLoginButton() {
    return OutlinedButton(
      onPressed: () {
        print("Heading to profile_page");
        this.user = user;
        // print("User : " + user.displayName);
        signInWithGoogle().then((user) => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfilePage(
                          // userDisplayName: user.displayName
                          )))
            });
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
        ),
        splashFactory: InkSplash.splashFactory,
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/google_logo.png'),
                height: 35,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text('Sign in with Google',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 25,
                    )),
              )
            ]),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        curve: Curves.fastOutSlowIn, parent: animationController));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController));

    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController));
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    animationController.forward();

    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return new Scaffold(
            backgroundColor: Colors.green[100],
            resizeToAvoidBottomInset: false,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Transform(
                  transform: Matrix4.translationValues(
                      0.0, animation.value * height, 0.0),
                  child: Container(
                    child: Stack(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.fromLTRB(15.0, 100.0, 0, 0),
                            child: Text(
                              'Hey',
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 65.0,
                                  fontWeight: FontWeight.bold),
                            )),
                        Container(
                            padding: EdgeInsets.fromLTRB(16.0, 175.0, 0, 0),
                            child: Text(
                              'There',
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 65.0,
                                  fontWeight: FontWeight.bold),
                            )),
                        Container(
                            padding: EdgeInsets.fromLTRB(190.0, 175.0, 0, 0),
                            child: Text(
                              '!',
                              style: TextStyle(
                                  fontSize: 65.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[800]),
                            )),
                      ],
                    ),
                  ),
                ),
                Transform(
                  transform: Matrix4.translationValues(
                      delayedAnimation.value * width, 0.0, 0.0),
                  child: Container(
                    padding: EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextField(
                          decoration:
                              InputDecoration(hintText: 'Email/Username'),
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                        ),
                        SizedBox(height: 15.0),
                        TextField(
                          decoration: InputDecoration(hintText: 'Password'),
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                        ),
                        SizedBox(height: 20.0),
                        // ElevatedButton(
                        //     child: Text('Login'),
                        //     style: ElevatedButton.styleFrom(
                        //       primary: Colors.green[700],
                        //       onPrimary: Colors.black,
                        //       elevation: 7.0,
                        //       shadowColor: Colors.green[900],
                        //       shape: RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(50.0)),
                        //     ),
                        //     onPressed: () {
                        //       print("Heading to profile_page");
                        //       Navigator.of(context).pushNamed('/profilepage');
                        //     }),

                        googleLoginButton(),

                        SizedBox(height: 25.0),
                        Transform(
                          transform: Matrix4.translationValues(
                              muchDelayedAnimation.value * width, 0.0, 0.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'New to MetroRun? Sign up, create an account!',
                                style: TextStyle(color: Colors.black45),
                              ),
                              SizedBox(height: 10.0),
                              ElevatedButton(
                                  child: Text('Sign Up'),
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0)),
                                      primary: Colors.green[700],
                                      onPrimary: Colors.black,
                                      elevation: 7.0,
                                      shadowColor: Colors.green[900]),
                                  onPressed: () {
                                    print("Heading to signup_page");
                                    Navigator.of(context).pushNamed('/signup');
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

// import 'package:flutter/material.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   LoginPageState createState() => LoginPageState();
// }

// class LoginPageState extends State<LoginPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             MaterialButton(
//               onPressed: () => null,
//               color: Colors.white,
//               textColor: Colors.black,
//               child: Text(
//                 'Login with Google',
//               ),
//             ),

//             MaterialButton(
//               onPressed: () => null,
//               color: Colors.red.shade700,
//               textColor: Colors.white,
//               child: Text(
//                 'Signout',
//               ),
//             ),

//           ],

//         )
//       ),
//     );
//   }
// }
