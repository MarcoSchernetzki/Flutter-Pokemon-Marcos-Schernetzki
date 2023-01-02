import 'dart:convert';
import 'dart:developer';

PokeApi pokeApiFromJson(String string) {
  return PokeApi.fromJson(json.decode(string));
}

PokeImage pokeImageFromJson(String string) {
  return PokeImage.fromJson(json.decode(string));
}

String pokeApiToJson(PokeApi data) => json.encode(data.toJson());

class PokeApi {
  PokeApi({required this.count, required this.results});

  int count;
  List<Poke> results;

  factory PokeApi.fromJson(Map<String, dynamic> json) {
    return PokeApi(
        count: json['count'],
        results: List<Poke>.from(json['results'].map((x) => Poke.fromJson(x))));
  }

  Map<String, dynamic> toJson() => {
        'count': count,
        'results': List<dynamic>.from(results.map((x) => x.toJson()))
      };
}

class Poke {
  Poke(
      {required this.name,
      required this.url,
      required this.urlImage,
      required this.abilities});
  String name, url;
  List<String> urlImage;
  String abilities;

  factory Poke.fromJson(Map<String, dynamic> json) {
    List<String> urlImages = [];
    String abilities = '';

    urlImages.add(json['url']);

    return Poke(
        name: json['name'],
        url: json['url'],
        urlImage: urlImages,
        abilities: abilities);
  }

  Map<String, dynamic> toJson() =>
      {'name': name, 'url': url, 'urlImage': urlImage, 'abilities': abilities};
}

class PokeImage {
  PokeImage({required this.sprites, required this.abilities});
  String sprites;
  String abilities;

  factory PokeImage.fromJson(Map<String, dynamic> json) {
    return PokeImage(
        sprites: json['sprites']['other']['home']['front_default'],
        abilities: json['abilities'][0]['ability']['name']);
  }

  Map<String, dynamic> toJson() => {'sprites': sprites, 'abilities': abilities};
}
