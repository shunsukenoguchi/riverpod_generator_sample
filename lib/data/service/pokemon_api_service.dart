import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_generator_sample/data/model/pokemon.dart';
import 'package:http/http.dart' as http;

part 'pokemon_api_service.g.dart';

@riverpod
PokemonApiService pokemonApiService(PokemonApiServiceRef ref) =>
    PokemonApiService();

class PokemonApiService {
  Future<Pokemon> pokemon(String id) async {
    final res =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$id'));
    return Pokemon.fromJson(jsonDecode(res.body));
  }
}
