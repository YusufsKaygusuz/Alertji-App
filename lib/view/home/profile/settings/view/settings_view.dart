import 'package:alertji_app/view/home/profile/view/profie_view.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkModeEnabled = false;
  String selectedLanguage = 'Türkçe';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayarlar'),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const ProfileView()),
                (Route<dynamic> route) => false);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Görünüm Ayarları',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Container(
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.all(12.0),
              child: ListTile(
                title: Text(
                  isDarkModeEnabled ? 'Açık Mod' : 'Koyu Mod',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                trailing: Transform.scale(
                  scale: 1.5,
                  child: Switch(
                    value: isDarkModeEnabled,
                    onChanged: (bool? value) {
                      setState(() {
                        isDarkModeEnabled = value ?? false;
                      });
                    },
                    activeColor: Colors.green,
                    activeTrackColor: Colors.green.withOpacity(0.3),
                  ),
                ),
                contentPadding: EdgeInsets.zero,
                dense: true,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Dil Ayarları',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.green),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: DropdownButtonFormField<String>(
                value: selectedLanguage,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedLanguage = newValue ?? 'Türkçe';
                  });
                },
                items: <String>['Türkçe', 'İngilizce']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  enabledBorder: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
