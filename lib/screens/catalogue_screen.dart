
import 'package:flutter/material.dart';
import '../models/livre.dart';
import '../data/livres_data.dart';

class CatalogueScreen extends StatelessWidget {
  const CatalogueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalogue'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'Nouveautés',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: livres
                  .where((livre) => livre.nouveaute == true)
                  .map((livre) {
                return Container(
                  width: 110,
                  margin: const EdgeInsets.all(8),
                  color: livre.couleur,
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      livre.titre,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'Tout le catalogue',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: livres.length,
            itemBuilder: (context, index) {
              final Livre livre = livres[index];

              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: livre.couleur,
                  child: Text(livre.titre[0]),
                ),
                title: Text(livre.titre),
                subtitle: Text('${livre.auteur} - ${livre.annee}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(livre.note.toString()),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(indent: 72);
            },
          ),
        ],
      ),
    );
  }
}
