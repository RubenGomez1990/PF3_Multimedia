import 'package:flutter/widgets.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class AnimeProvider extends ChangeNotifier {
  AnimeProvider() {
    print('Proveedor de animes inicializado.');
    this.getOnDisplayAnime();
  }

  getOnDisplayAnime() async {
    print('getOnDisplayAnime');
    var url =
        // Buscamos los animes top de temporada
        Uri.https('api.jikan.moe', '/v4/top/anime');
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      final List<dynamic> listaAnimes = jsonResponse['data'];

      var itemCount = listaAnimes.length;
      print('Número de animes obtenidos: $itemCount.');
      ;
      print('Nombre del primer anime: ${listaAnimes[0]['title']}');
    } else {
      print('Error en la petición: ${response.statusCode}');
    }
  }
}
