import 'package:flutter/material.dart';
import 'package:ui_whatsapp/view/profile_view.dart';
import 'package:ui_whatsapp/view/verify_phone_number/widgets/o_t_p_field.dart';

class VerifyPhoneNumberView extends StatelessWidget {
  const VerifyPhoneNumberView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Double tap anywhere to go back to the previous screen
      onDoubleTap: () => Navigator.pop(context),

      //  Single tap anywhere pushes to the profile view
      onTap:
          MediaQuery.of(context).viewInsets.bottom > 0
              ? () => FocusManager.instance.primaryFocus?.unfocus()
              : () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileView()),
              ),

      child: Scaffold(
        backgroundColor: Colors.white,

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),

                  // Heading
                  const Text(
                    'Verify your phone number',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text.rich(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                    TextSpan(
                      text: 'You have tried to register ',
                      children: [
                        //  Phone number
                        TextSpan(
                          text: '+919988776655',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        TextSpan(
                          text:
                              ' recently. wait before requisition an SMS or a call with your code. ',
                        ),
                        // Option to change the number
                        TextSpan(
                          text: "Wrong number ?",
                          style: TextStyle(color: Colors.green, fontSize: 13),
                        ),
                        TextSpan(text: '.'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  //  OTP input field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: OTPField(),
                  ),

                  const SizedBox(height: 100),

                  // Option for retry if code was not received
                  const Text(
                    "Didn't receive code?",
                    style: TextStyle(fontSize: 12),
                  ),

                  const SizedBox(height: 10),

                  //  Countdown timer placeholder
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'You may request a new code in ',
                        style: TextStyle(fontSize: 12),
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        '00:00',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
