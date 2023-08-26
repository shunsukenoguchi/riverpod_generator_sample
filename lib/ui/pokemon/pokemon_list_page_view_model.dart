import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_generator_sample/data/model/pokemon.dart';
import 'package:riverpod_generator_sample/data/repository/pokemon_repository.dart';

part 'pokemon_list_page_view_model.g.dart';

@riverpod
class PokemonListPageViewModel extends _$PokemonListPageViewModel {
  @override
  Future<Pokemon> build() async => fetchPokemon();

  Future<Pokemon> fetchPokemon() async {
    return await ref.read(pokemonRepositoryProvider).pokemon("1");
  }
}
