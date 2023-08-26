import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_generator_sample/ui/pokemon/pokemon_list_page_view_model.dart';

class Pokemon extends ConsumerWidget {
  const Pokemon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemon = ref.watch(pokemonListPageViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Pokemon"),
      ),
      body: pokemon.when(
        data: (poke) => Column(
          children: [
            ListTile(
              leading: Container(
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(
                      poke!.imageUrl,
                    ),
                  ),
                ),
              ),
              title: Text(
                poke.name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(poke.types.first),
              trailing: const Icon(Icons.navigate_next),
              onTap: () => {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (BuildContext context) => const PokeDetail(),
                //   ),
                // ),
              },
            ),
          ],
        ),
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Text(error.toString()),
      ),
    );
  }
}
