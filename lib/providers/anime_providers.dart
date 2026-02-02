import 'package:flutter/widgets.dart';

class AnimeProvider extends ChangeNotifier {
  AnimeProvider() {
    print('Proveedor de animes inicializado.');
    this.getOnDisplayAnime();
  }

  getOnDisplayAnime() async {
    print('getOnDisplayAnime');
  }
}
