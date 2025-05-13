import 'package:flutter/material.dart';
import 'package:whatsapp_ui/constants/country_codes.dart';

class CountryCodeDropdownScreen extends StatefulWidget {
  const CountryCodeDropdownScreen({super.key});

  @override
  State<CountryCodeDropdownScreen> createState() =>
      _CountryCodeDropdownScreenState();
}

class _CountryCodeDropdownScreenState extends State<CountryCodeDropdownScreen> {
  String selectedCountryCode = 'India';

  ///  bottom sheet modal to select a country.
  void _showCountryCodeSelector(BuildContext context) async {
    final result = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true, //  Avoid system UI like notches
      backgroundColor: Colors.white,
      builder: (_) {
        return CountryCodeSelectorModal(
          selectedCountryCode: selectedCountryCode,
        );
      },
    );

    if (result != null) {
      setState(() {
        selectedCountryCode = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => _showCountryCodeSelector(context),
        child: Container(
          width: 300,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.green, width: 2)),
          ),

          //country selection field
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(),
                Text(selectedCountryCode, style: const TextStyle(fontSize: 16)),
                const SizedBox(width: 6),
                const Spacer(),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CountryCodeSelectorModal extends StatelessWidget {
  final String selectedCountryCode;

  const CountryCodeSelectorModal({
    super.key,
    required this.selectedCountryCode,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          AppBar(
            backgroundColor: Colors.white,
            leading: const BackButton(color: Colors.black),
            title: const Text(
              'Choose a Country',
              style: TextStyle(color: Color.fromARGB(255, 35, 168, 40)),
            ),
            elevation: 1,
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.black),
                onPressed: () {},
              ),
            ],
          ),

          // List of all countries with flag, name, and dial code
          Expanded(
            child: ListView.builder(
              itemCount: countryCodes.length,
              itemBuilder: (context, index) {
                final code = countryCodes[index];
                return ListTile(
                  splashColor: Colors.green.shade100,
                  leading: Image.asset(code['icon'], width: 20, height: 20),
                  title: Text(
                    code['title'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  trailing: Text(
                    code['code'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  // Return selected country title
                  onTap: () => Navigator.pop(context, code['title']),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
