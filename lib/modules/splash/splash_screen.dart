import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_social_app/modules/LoginScreen/login_screen.dart';
import 'package:my_social_app/modules/RegisterScreen/register_screen.dart';
import 'package:my_social_app/shared/components/components.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.9),
                ],
              ).createShader(
                  Rect.fromLTRB(0, 300, rect.width, rect.height - 1));
            },
            blendMode: BlendMode.darken,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/splash.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 150),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Find new \n friends nearby",
                      style: GoogleFonts.lato(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "with milions of users all over the world,\n we gives you the ability to connect with people\n no matter where you are.",
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 170),
                            child: GestureDetector(
                              onTap: () {
                                navigateAndFinsh(
                                  context,
                                  RegisterScreen(),
                                );
                              },
                              child: Container(
                                width: 139,
                                height: 39,
                                decoration: BoxDecoration(
                                  color: Colors.black12.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Center(
                                  child: Text(
                                    "Sign Up",
                                    style: GoogleFonts.lato(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFFDE3163),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              navigateAndFinsh(
                                context,
                                LoginScreen(),
                              );
                            },
                            child: Container(
                              width: 139,
                              height: 39,
                              decoration: BoxDecoration(
                                color: Color(0xFFDE3163),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Center(
                                child: Text(
                                  "Sign In",
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
