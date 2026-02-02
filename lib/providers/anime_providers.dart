import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';

class AnimeProvider extends ChangeNotifier {
  List<Anime> onDisplayAnime = [];
  AnimeProvider() {
    print('Proveedor de animes inicializado.');
    this.getOnDisplayAnime();
  }

  getOnDisplayAnime() async {
    print('getOnDisplayAnime');
    var url =
        // Buscamos los animes top de temporada
        Uri.https('api.jikan.moe', '/v4/top/anime');
    // Usamos data porque los resultados de esta API se llaman data.
    final data = await http.get(url);
    // Primero cogemos todo el texto del JSON, usamos decode para procesarlo
    // y luego usamos nuestro modelo para crear los objetos
    final topAnimeResponse = TopAnimeResponse.fromJson(json.decode(data.body));

    onDisplayAnime = topAnimeResponse.data;

    notifyListeners();
  }
}
