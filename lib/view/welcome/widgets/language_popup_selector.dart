import 'package:flutter/material.dart';
import 'package:ui_whatsapp/constants/languages.dart';

class LanguagePopupSelector extends StatefulWidget {
  const LanguagePopupSelector({super.key});

  @override
  State<LanguagePopupSelector> createState() => _LanguagePopupSelectorState();
}

class _LanguagePopupSelectorState extends State<LanguagePopupSelector> {
  // default to English
  String selectedLanguage = 'English (US)';

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero, // Remove default padding

      onSelected: (value) {
        setState(() {
          selectedLanguage = value;
        });
      },

      //  popup menu items
      itemBuilder: (context) {
        return languages
            .map((lang) => PopupMenuItem(value: lang, child: Text(lang)))
            .toList();
      },

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

      //Language button
      child: Container(
        width: 160,
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(193, 185, 246, 202),
          border: Border.all(color: Colors.grey.shade100),
          borderRadius: BorderRadius.circular(30),
        ),

        // Language button
        child: Row(
          children: [
            const Icon(Icons.language, color: Colors.green, size: 20),
            const SizedBox(width: 8),

            //  currently selected language text
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Text(
                  selectedLanguage,
                  key: ValueKey(selectedLanguage), // for switch animation
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 6),
            const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
