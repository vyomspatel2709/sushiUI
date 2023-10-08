import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushiui/components/button.dart';
import 'package:sushiui/pages/menu_page.dart';
import 'package:sushiui/themes/color.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //shop name
              Text("SUSHI MAN",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.white
              ),
              ),
              const SizedBox(height: 25),
              //icon
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image.asset('lib/images/salmon_egg.png'),),
              //title
              const SizedBox(height: 25),
      
              Text("THE TASTE OF THE JAPANESE FOOD",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 44,
                color: Colors.white
              ),),
              const SizedBox(height: 10),
              //subttle
              Text("Feel the taste of the most popular Japanese food from anywhere and anytime",
              style: TextStyle(color: Colors.grey[300],
              height: 2
              ),
              ),
              const SizedBox(height: 25),
              //get started button
              MyButton(
                text: "Get Started",
                onTap: () {
                  //go to the menu page
                  Navigator.pushNamed(context, '/menupage');
                },
                )
            ],
          ),
        ),
      ),
    );
  }
}