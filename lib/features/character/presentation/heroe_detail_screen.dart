import 'package:flutter/material.dart';
import 'package:heroesapp/features/character/domain/entities/character.dart';

class HeroDetailsScreen extends StatelessWidget {
  final Character character;

  HeroDetailsScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name ?? ''),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (character.thumbnail != null)
              Image.network(
                '${character.thumbnail!.path}.${character.thumbnail!.extension}',
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 16.0),
            Text(
              character.name ?? '',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              character.description ?? 'Sem descrição',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            if (character.comics != null && character.comics!.items != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Comics:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  ...character.comics!.items!.map((comic) {
                    return Text(comic.name ?? '');
                  }),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
