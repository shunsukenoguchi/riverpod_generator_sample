import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_generator_sample/data/model/pokemon.dart';
import 'package:riverpod_generator_sample/data/service/pokemon_api_service.dart';

final pokemonRepositoryProvider =
    Provider<PokemonRepository>((ref) => PokemonRepository._(ref));

class PokemonRepository {
  final Ref _ref;
  PokemonRepository._(this._ref);

  Future<Pokemon> pokemon(String id) async {
    return await _ref.read(pokemonApiServiceProvider).pokemon(id);
  }
}
