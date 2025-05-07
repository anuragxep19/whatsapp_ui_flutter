import 'package:flutter/material.dart';
import 'package:ui_whatsapp/view/home/widgets/custom_tile.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      // Double tap to go back
      onDoubleTap: () => Navigator.pop(context),
      child: Scaffold(
        backgroundColor: Colors.white,

        /// App bar
        appBar: AppBar(
          leadingWidth: 150,
          backgroundColor: Colors.white,
          leading: Text(
            '  Whatsapp',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.qr_code_scanner)),
            IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Column(
            children: [
              // Search bar
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                child: SearchBar(
                  elevation: WidgetStatePropertyAll(0),
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 10),
                  ),
                  leading: Icon(Icons.search),
                  hintText: 'Ask Meta AI or Search',
                ),
              ),

              SizedBox(height: 10),

              // Tab filters
              Tabs(),

              // Archived chats
              ListTile(
                leading: Icon(Icons.archive_outlined),
                title: Text('Archived'),
                trailing: Text('5'),
              ),

              // Chat list
              Expanded(
                child: ListView.builder(
                  itemCount: 10, // Number of chat tiles
                  itemBuilder: (BuildContext context, int index) {
                    return CustomTile(
                      title: 'User$index',
                      subtitle: 'Hi$index',
                      onTap:
                          () => FocusManager.instance.primaryFocus?.unfocus(),
                      time: "00:0$index",
                      isUnread: true,
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        /// Floating button
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 28, 196, 34),
          onPressed: () {},
          child: Icon(Icons.medical_services_sharp, color: Colors.white),
        ),
      ),
    );
  }
}

/// Tab row with selectable filters
class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int selectedIndex = 0; // Currently selected tab

  final List<String> options = ['All', 'Unread', 'Favorites', 'Groups', '+'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(options.length, (index) {
          final isSelected = selectedIndex == index;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color:
                      isSelected
                          ? const Color.fromARGB(82, 76, 175, 79)
                          : Colors.grey[50],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  options[index],
                  style: TextStyle(
                    color:
                        isSelected
                            ? const Color.fromARGB(255, 26, 85, 28)
                            : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
