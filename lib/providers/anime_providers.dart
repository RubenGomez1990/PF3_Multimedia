import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';

class AnimeProvider extends ChangeNotifier {
  String _baseUrl = 'api.jikan.moe';
  List<Anime> onDisplayAnime = [];
  List<Anime> seasonalAnimes = [];

  AnimeProvider() {
    print('Proveedor de animes inicializado.');
    this.getOnDisplayAnime();
    this.getOnSeasonalAnimes();
  }

  getOnDisplayAnime() async {
    print('getOnDisplayAnime');

    // Buscamos los animes top de temporada
    // Usamos data porque los resultados de esta API se llaman data.
    var url = Uri.https(_baseUrl, '/v4/top/anime');
    final data = await http.get(url);

    if (data.statusCode == 200) {
      // Primero cogemos todo el texto del JSON, usamos decode para procesarlo
      // y luego usamos nuestro modelo para crear los objetos
      final topAnimeResponse =
          TopAnimeResponse.fromJson(json.decode(data.body));
      onDisplayAnime = topAnimeResponse.data;
      notifyListeners();
    } else {
      print('Error en la petición: ${data.statusCode}');
    }
  }

  getOnSeasonalAnimes() async {
    print('getOnSeasonalAnimes');
    var url = Uri.https(_baseUrl, '/v4/seasons/now');
    final data = await http.get(url);

    if (data.statusCode == 200) {
      final seasonalResponse =
          TopAnimeResponse.fromJson(json.decode(data.body));
      seasonalAnimes = seasonalResponse.data;
      notifyListeners();
    } else {
      print('Error en Seasonal: ${data.statusCode}');
    }
  }
}
