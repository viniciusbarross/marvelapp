import 'package:flutter/material.dart';
import 'package:heroesapp/features/character/presentation/controller/character_controller.dart';
import 'package:heroesapp/features/character/presentation/heroe_detail_screen.dart';
import 'package:provider/provider.dart';

class HeroesScreen extends StatefulWidget {
  const HeroesScreen({super.key});

  @override
  State<HeroesScreen> createState() => _HeroesScreenState();
}

class _HeroesScreenState extends State<HeroesScreen> {
  final TextEditingController _filterController = TextEditingController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Super-Heróis'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _filterController,
              decoration: const InputDecoration(
                labelText: 'Filtrar por nome',
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                Provider.of<CharacterController>(context, listen: false).filterCharactersByName(value);
              },
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: Consumer<CharacterController>(
                builder: (context, characterController, _) {
                  final paginatedCharacters = characterController.filteredCharacters.skip(_currentPage * 4).take(4).toList();

                  return ListView.builder(
                    itemCount: paginatedCharacters.length,
                    itemBuilder: (context, index) {
                      final character = paginatedCharacters[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HeroDetailsScreen(character: character),
                          ));
                        },
                        child: SizedBox(
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Card(
                              elevation: 3.0,
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(16.0),
                                leading: character.thumbnail != null
                                    ? Image.network(
                                        '${character.thumbnail!.path}.${character.thumbnail!.extension}',
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      )
                                    : const SizedBox.shrink(),
                                title: Text(
                                  character.name!,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  character.description ?? 'Sem descrição',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: _currentPage > 0
                      ? () {
                          setState(() {
                            _currentPage--;
                          });
                        }
                      : null,
                ),
                const SizedBox(width: 16.0),
                Text('Página ${_currentPage + 1}'),
                const SizedBox(width: 16.0),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () {
                    setState(() {
                      _currentPage++;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
