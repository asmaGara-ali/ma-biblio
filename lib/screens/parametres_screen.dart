
import 'package:flutter/material.dart';

class ParametresScreen extends StatelessWidget {
  const ParametresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Mon profil'),
              subtitle: const Text('Nom, e-mail, mot de passe'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Profil sélectionné'),
                  ),
                );
              },
              trailing: const Icon(Icons.chevron_right),
            ),

            ListTile(
              leading: const Icon(
                Icons.notifications,
                color: Colors.deepPurple,
              ),
              title: const Text(
                'Notifications',
                style: TextStyle(color: Colors.deepPurple),
              ),
              trailing: const Icon(Icons.chevron_right),
              tileColor: const Color.fromRGBO(103, 58, 183, 0.08),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Langue'),
              subtitle: const Text('Français'),
              trailing: const Icon(Icons.chevron_right),
            ),

            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('À propos'),
              subtitle: const Text(
                'Informations sur l’application\nVersion 1.0',
              ),
              trailing: const Icon(Icons.chevron_right),
              dense: true,
              isThreeLine: true,
              enabled: false,
            ),

            ListTile(title: const Text('Option 1')),
            ListTile(title: const Text('Option 2')),
            ListTile(title: const Text('Option 3')),
            ListTile(title: const Text('Option 4')),
            ListTile(title: const Text('Option 5')),
            ListTile(title: const Text('Option 6')),
            ListTile(title: const Text('Option 7')),
            ListTile(title: const Text('Option 8')),
            ListTile(title: const Text('Option 9')),
            ListTile(title: const Text('Option 10')),
          ],
        ).toList(),
      ),
    );
  }
}
