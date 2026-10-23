
import 'package:flutter/material.dart';
import '../data/livres_data.dart';

class MaListeScreen extends StatefulWidget {
  const MaListeScreen({super.key});

  @override
  State<MaListeScreen> createState() => _MaListeScreenState();
}

class _MaListeScreenState extends State<MaListeScreen> {
  bool _nouveautesSeulement = false;

  Map<String, bool> _genres = {
    'Roman': true,
    'Science': true,
    'Informatique': true,
    'Jeunesse': true,
    'Histoire': true,
  };

  // Vérifier l'état de tous les genres
  bool? get _tousLesGenres {
    if (_genres.values.every((genre) => genre)) {
      return true;
    }

    if (_genres.values.every((genre) => !genre)) {
      return false;
    }

    return null;
  }

  // Liste des livres filtrée
  get _livresFiltres {
    return livres.where((livre) {
      return _genres[livre.genre] == true;
    }).where((livre) {
      if (_nouveautesSeulement) {
        return livre.nouveaute;
      }
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final livresFiltres = _livresFiltres;

    // Calcul du nombre de livres lus et du total affiché
    final nombreLus =
        livresFiltres.where((livre) => livre.lu).length;
    final nombreTotal = livresFiltres.length;

    return Scaffold(
      appBar: AppBar(
        title: Text('Lus : $nombreLus / $nombreTotal'),
      ),

      body: Column(
        children: [
          // Filtre des nouveautés
          CheckboxListTile(
            title: const Text(
              'Afficher uniquement les nouveautés',
            ),
            value: _nouveautesSeulement,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (bool? valeur) {
              setState(() {
                _nouveautesSeulement = valeur ?? false;
              });
            },
          ),

          const Divider(),

          // Tous les genres
          CheckboxListTile(
            title: const Text('Tous les genres'),
            tristate: true,
            value: _tousLesGenres,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (bool? valeur) {
              setState(() {
                final bool cocher = _tousLesGenres != true;
                _genres.updateAll((genre, ancien) => cocher);
              });
            },
          ),

          // Filtres par genre
          ..._genres.keys.map((genre) {
            final nombreLivres = livres
                .where((livre) => livre.genre == genre)
                .length;

            IconData icone;

            switch (genre) {
              case 'Roman':
                icone = Icons.menu_book;
                break;
              case 'Science':
                icone = Icons.science;
                break;
              case 'Informatique':
                icone = Icons.computer;
                break;
              case 'Jeunesse':
                icone = Icons.child_care;
                break;
              case 'Histoire':
                icone = Icons.history_edu;
                break;
              default:
                icone = Icons.category;
            }

            return CheckboxListTile(
              title: Text(genre),
              subtitle: Text('$nombreLivres livres'),
              secondary: Icon(icone),
              activeColor: Colors.deepPurple,
              controlAffinity: ListTileControlAffinity.leading,
              value: _genres[genre],
              onChanged: (bool? valeur) {
                setState(() {
                  _genres[genre] = valeur ?? false;
                });
              },
            );
          }),

          const Divider(),

          // Liste des livres filtrés
          Expanded(
            child: ListView.separated(
              itemCount: livresFiltres.length,
              separatorBuilder: (context, index) {
                return const Divider(height: 1);
              },
              itemBuilder: (context, index) {
                final livre = livresFiltres[index];

                return CheckboxListTile(
                  title: Text(
                    livre.titre,
                    style: TextStyle(
                      decoration: livre.lu
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  subtitle: Text(
                    '${livre.auteur} • ${livre.genre}',
                  ),
                  value: livre.lu,
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Colors.deepPurple,
                  onChanged: (bool? valeur) {
                    setState(() {
                      livre.lu = valeur ?? false;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
