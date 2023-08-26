import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_generator_sample/data/model/pokemon.dart';
import 'package:riverpod_generator_sample/data/service/pokemon_api_service.dart';

part 'pokemon_repository.g.dart';

@riverpod
PokemonRepository pokemonRepository(PokemonRepositoryRef ref) =>
    PokemonRepository(
      ref.read(pokemonApiServiceProvider),
    );

class PokemonRepository {
  PokemonRepository(this._client);
  final PokemonApiService _client;
  Future<Pokemon> pokemon(String id) async {
    return await _client.pokemon(id);
  }
}
