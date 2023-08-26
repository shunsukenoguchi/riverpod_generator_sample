import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_generator_sample/data/model/pokemon.dart';
import 'package:http/http.dart' as http;

final pokemonApiServiceProvider =
    Provider<PokemonApiService>((ref) => PokemonApiService._(ref));

class PokemonApiService {
  final Ref _ref;
  PokemonApiService._(this._ref);

  Future<Pokemon> pokemon(String id) async {
    final res =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$id'));
    return Pokemon.fromJson(jsonDecode(res.body));
  }
}
