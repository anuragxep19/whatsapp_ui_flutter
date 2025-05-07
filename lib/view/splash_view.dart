import 'package:flutter/material.dart';
import 'package:ui_whatsapp/view/language/language_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Navigate to LanguageView on any screen tap
      onTap:
          () => Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => LanguageView())),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(), // Empty widget to help push content down
              // Centered WhatsApp logo
              Center(
                child: Image.asset(
                  'assets/icons/logo.png',
                  width: 250,
                  height: 250,
                ),
              ),

              // Bottom branding section
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Column(
                  children: [
                    // "from" text above the Meta logo
                    const Text(
                      'from',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Meta logo and text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/meta_logo.png',
                          width: 24,
                          height: 24,
                          color: Colors.green, // Branding color
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          'meta',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
