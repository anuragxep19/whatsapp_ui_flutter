import 'package:flutter/material.dart';
import 'package:ui_whatsapp/view/enter_phone_number/widgets/country_code_dropdown.dart';
import 'package:ui_whatsapp/view/verify_phone_number/verify_phone_number_view.dart';

class EnterPhoneNumberView extends StatelessWidget {
  const EnterPhoneNumberView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      // Double tap anywhere to go back
      onDoubleTap: () => Navigator.pop(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 50),

                // Title
                const Text(
                  'Enter your phone number',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),

                const SizedBox(height: 20),

                // Information text with link-style text
                Text.rich(
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                  TextSpan(
                    text:
                        'Whatsapp will need to verify your phone number. Carrier charges may apply ',
                    children: [
                      TextSpan(
                        text: "What's my number ?",
                        style: TextStyle(color: Colors.green, fontSize: 14.5),
                      ),
                      const TextSpan(text: '.'),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                //Country selector using bottom sheet modal
                const CountryCodeDropdownScreen(),

                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Row(
                    children: [
                      //  Country dial code input
                      Expanded(
                        flex: 1,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: 'Code',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 20),

                      // Phone number input field
                      Expanded(
                        flex: 3,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: 'Phone Number',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.green),
                ),
                onPressed: () {
                  // Navigate to next OTP verification
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const VerifyPhoneNumberView(),
                    ),
                  );
                },
                child: const Text(
                  'Agree and Continue',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
