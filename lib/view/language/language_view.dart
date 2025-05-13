import 'package:flutter/material.dart';
import 'package:whatsapp_ui/view/language/widgets/language_selector.dart';
import 'package:whatsapp_ui/view/welcome/welcome_view.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Double-tap anywhere to go back
      onDoubleTap: () => Navigator.of(context).pop(),

      child: Scaffold(
        backgroundColor: const Color.fromARGB(251, 255, 255, 255),

        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),

            child: Stack(
              children: [
                // Background image with gradient fade
                Align(
                  alignment: const Alignment(0, -0.85),
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.green, Colors.transparent],
                        stops: [0.35, 0.6], // Fade out halfway
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.dstIn, // Creates fade effect
                    child: Image.asset(
                      'assets/icons/background.png',
                      width: 320,
                      height: 320,
                      color: Colors.green.shade100, // Faint green tint
                    ),
                  ),
                ),

                // Main content with heading and language selector
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Welcome texts
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              'Welcome to WhatsApp',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Choose your language to get started',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ),

                    //  Language selector widget
                    const Expanded(flex: 3, child: LanguageSelector()),
                  ],
                ),
              ],
            ),
          ),
        ),

        //  Floating action button to move to Welcome screen
        floatingActionButton: SizedBox(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              // Navigate to WelcomeView when FAB is pressed
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => WelcomeView()));
            },
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 32,
            ),
          ),
        ),
      ),
    );
  }
}
