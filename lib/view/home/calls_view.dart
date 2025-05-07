import 'package:flutter/material.dart';

class CallsView extends StatelessWidget {
  const CallsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //  Double tap anywhere to navigate back
      onDoubleTap: () => Navigator.pop(context),
      child: Scaffold(
        backgroundColor: Colors.white,

        /// AppBar
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leadingWidth: 150,
          backgroundColor: Colors.white,
          title: const Text(
            'Calls',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.qr_code_scanner),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.camera_alt_outlined),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),

        ///  Scrollable Body Content
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section: Favorites
              const Text(
                'Favorites',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              // Add favorite contact
              ListTile(
                leading: const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.heart_broken, color: Colors.white),
                ),
                title: const Text('Add favorite'),
                onTap: () {},
              ),

              const SizedBox(height: 30),

              //  Section: Recent Calls
              Text(
                'Recent',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              /// List of recent calls
              Column(
                children: List.generate(10, (index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.person, color: Colors.grey),
                    ),
                    title: Text('User$index'),
                    subtitle: Text('00:0$index'), // call time
                    trailing: const Icon(Icons.call), //  Call icon
                    onTap: () {},
                  );
                }),
              ),

              const SizedBox(height: 30),

              ///  Call Encryption Notice
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.lock_outline, size: 14),
                  Text(
                    'Your personal calls are ',
                    style: TextStyle(color: Colors.grey[800], fontSize: 14),
                  ),
                  Text(
                    'end-to-end encrypted',
                    style: TextStyle(color: Colors.green, fontSize: 14),
                  ),
                ],
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),

        /// Floating Button
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 28, 196, 34),
          onPressed: () {},
          child: const Icon(Icons.add_ic_call, color: Colors.white),
        ),
      ),
    );
  }
}
