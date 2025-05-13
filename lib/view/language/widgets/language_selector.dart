import 'package:flutter/material.dart';
import 'package:whatsapp_ui/constants/languages.dart';

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  final ValueNotifier<String> selectedLanguage = ValueNotifier<String>(
    'English (US)',
  );

  @override
  void dispose() {
    selectedLanguage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: selectedLanguage,
      builder: (context, value, child) {
        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          itemCount: languages.length,

          itemBuilder: (context, index) {
            return RadioListTile<String>(
              value: languages[index],
              groupValue: value,
              onChanged: (val) => selectedLanguage.value = val!,

              fillColor: const WidgetStatePropertyAll(Colors.green),
              radioScaleFactor: 1.3, // Slightly larger radio button
              visualDensity: VisualDensity.compact, // Tighter layout
              //Display the language name
              title: Text(
                languages[index],
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
