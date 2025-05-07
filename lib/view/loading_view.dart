import 'package:flutter/material.dart';
import 'package:ui_whatsapp/view/home/home_bottom_navigation_bar.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //  Double-tap on screen to go back
      onDoubleTap: () => Navigator.pop(context),

      //  Single tap anywhere navigates to HomeView
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeBottomNavigationBar()),
          ),

      child: Scaffold(
        backgroundColor: Colors.white,

        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  //AppBar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left transparent icon to balance layout
                      IconButton(
                        onPressed: null,
                        icon: const Icon(
                          Icons.more_vert,
                          color: Colors.transparent,
                        ),
                      ),

                      // Title
                      Expanded(
                        child: Center(
                          child: const Text(
                            'Initializing...',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),

                      // Menu icon placeholder
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Subtitle
                  const Text(
                    'Please wait a moment ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),

              //Central illustration
              Image.asset(
                'assets/icons/background.png',
                width: 320,
                height: 320,
                color: Colors.green,
              ),

              //Circular loading spinner
              const CircularProgressIndicator(color: Colors.green),
            ],
          ),
        ),
      ),
    );
  }
}
