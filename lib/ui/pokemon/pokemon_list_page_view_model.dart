import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_generator_sample/data/model/pokemon.dart';
import 'package:riverpod_generator_sample/data/repository/pokemon_repository.dart';

final pokemonListPageViewModelProvider = StateNotifierProvider.autoDispose<
    PokemonListPageViewModelProvider, AsyncValue<Pokemon>>((ref) {
  return PokemonListPageViewModelProvider(ref);
});

class PokemonListPageViewModelProvider
    extends StateNotifier<AsyncValue<Pokemon>> {
  final Ref _ref;
  PokemonListPageViewModelProvider(this._ref)
      : super(const AsyncValue.loading()) {
    fetchPokemon();
  }

  Future<void> fetchPokemon() async {
    state = await AsyncValue.guard(() async {
      return await _ref.read(pokemonRepositoryProvider).pokemon("1");
    });
  }
}
