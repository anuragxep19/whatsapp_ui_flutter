import 'package:flutter/material.dart';
import 'package:ui_whatsapp/view/enter_phone_number/enter_phone_number_view.dart';
import 'package:ui_whatsapp/view/welcome/widgets/language_popup_selector.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //  Double tap to go back
      onDoubleTap: () => Navigator.of(context).pop(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(251, 255, 255, 255),

        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    // Background image
                    Align(
                      alignment: const Alignment(0, -0.85),
                      child: Image.asset(
                        'assets/icons/background.png',
                        width: 320,
                        height: 320,
                        color: Colors.green,
                      ),
                    ),

                    const SizedBox(height: 8),

                    //  Welcome message
                    const Text(
                      'Welcome to WhatsApp',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // privacy policy and terms
                    Text.rich(
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                      TextSpan(
                        text: 'Read our ',
                        children: [
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 14.5,
                            ),
                          ),
                          const TextSpan(
                            text:
                                ". Tap to 'Agree and Continue' to accept the ",
                          ),
                          TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 14.5,
                            ),
                          ),
                          const TextSpan(text: '.'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    //  Language picker
                    const LanguagePopupSelector(),
                  ],
                ),

                const SizedBox(height: 40),

                // Agree & Continue button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: const WidgetStatePropertyAll(
                        Colors.green,
                      ),
                    ),

                    // Navigate to phone number entry screen
                    onPressed:
                        () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const EnterPhoneNumberView(),
                          ),
                        ),

                    child: const Text(
                      'Agree and Continue',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
