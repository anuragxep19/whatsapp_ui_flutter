import 'package:flutter/material.dart';
import 'package:whatsapp_ui/view/loading_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      // Double-tap anywhere on the screen to go back
      onDoubleTap: () => Navigator.pop(context),

      child: Scaffold(
        backgroundColor: Colors.white,

        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 50),

                // AppBar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Invisible icon to keep the title centered
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
                          'Profile Info',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),

                    // menu icon
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // Description text
                const Text(
                  'Please provide your name and an optional profile photo ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 20),

                // Profile Picture Placeholder
                const CircleAvatar(
                  radius: 50,
                  child: Text('S', style: TextStyle(fontSize: 40)),
                ),

                const SizedBox(height: 40),

                // Name Input Field with Emoji Icon
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            hintText: 'Your Name',
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
                      // Emoji Picker
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.emoji_emotions_outlined),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            //  'Next' Button
            Container(
              margin: const EdgeInsets.all(20),
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.green),
                ),

                //  Navigate to the LoadingView
                onPressed:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoadingView()),
                    ),

                child: const Text(
                  'Next',
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
