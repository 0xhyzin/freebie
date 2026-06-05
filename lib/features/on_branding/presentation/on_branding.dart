import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBranding extends StatelessWidget {
  const OnBranding({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.only(top: 50),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Image.asset("asset/img/background_wave.png"),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsetsGeometry.symmetric(horizontal: 20),
                    child: Text(
                      "Define yourself in your unique way.",
                      style: GoogleFonts.sansation(
                        fontSize: 69,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.01,
                        wordSpacing: 0,
                        height: 1,
                      ),
                    ),
                  ),
                ),

                Positioned(bottom: 22, child: Image.asset("asset/img/man.png")),
                Container(
                  height: 130,
                  width: double.infinity,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsetsGeometry.symmetric(
                      horizontal: 24,
                      vertical: 29,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        textStyle: GoogleFonts.sansation(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        )
                      ),
                      onPressed: () {},
                      
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Get Started"),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
