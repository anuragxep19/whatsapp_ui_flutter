import 'package:flutter/material.dart';

class UpdatesView extends StatelessWidget {
  const UpdatesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //Double-tap anywhere on screen to navigate back
      onDoubleTap: () => Navigator.pop(context),

      child: Scaffold(
        backgroundColor: Colors.white,

        ///App Bar
        appBar: AppBar(
          leadingWidth: 150,
          backgroundColor: Colors.white,
          leading: const Text(
            '  Updates',
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

        body: Stack(
          children: [
            /// Scrollable main content
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Status section
                  const Text(
                    'Status',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 30),

                  /// "My Status" tile
                  ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.person, color: Colors.grey),
                    ),
                    title: const Text('My status'),
                    subtitle: const Text('Tap to add status update'),
                    onTap: () {},
                  ),

                  const SizedBox(height: 30),

                  /// Recent updates label
                  Text(
                    'Recent updates',
                    style: TextStyle(color: Colors.grey[800], fontSize: 14),
                  ),

                  const SizedBox(height: 20),

                  /// List of recent status updates from other users
                  Column(
                    children: List.generate(2, (index) {
                      return ListTile(
                        leading: const CircleAvatar(
                          child: Icon(Icons.person, color: Colors.grey),
                        ),
                        title: Text('User$index'),
                        subtitle: Text('00:0$index'),
                        onTap: () {},
                      );
                    }),
                  ),

                  const SizedBox(height: 30),

                  //  Channels Section
                  const Text(
                    'Channels',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  ///  Description about channels
                  Text(
                    'Stay updated on topics that matter to you. The channels you follow will appear here.',
                    style: TextStyle(color: Colors.grey[800], fontSize: 14),
                  ),

                  const SizedBox(height: 20),

                  /// Suggested channels label
                  Text(
                    'Feed channels to follow',
                    style: TextStyle(color: Colors.grey[800], fontSize: 14),
                  ),

                  const SizedBox(height: 20),

                  /// Button to explore more channels
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Explore more',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),

                  const SizedBox(
                    height: 100,
                  ), // Prevent content from overlapping FAB
                ],
              ),
            ),

            /// edit button above FAB
            Positioned(
              bottom: 80,
              right: 24,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
                ),
                child: IconButton(
                  icon: const Icon(Icons.edit, color: Colors.green),
                  onPressed: () {},
                ),
              ),
            ),

            /// FAB
            Positioned(
              bottom: 13,
              right: 16,
              child: FloatingActionButton(
                backgroundColor: const Color.fromARGB(255, 28, 196, 34),
                onPressed: () {},
                child: const Icon(Icons.camera_alt, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
