import 'package:standing_board_console/models/soccer_standing.dart';
import 'package:standing_board_console/services/soccer_service.dart';

import 'package:universal_html/controller.dart';

class BundesligaService extends SoccerService {
  WindowController windowController;

  BundesligaService({
    this.windowController,
  });

  @override
  Future<List<SoccerStanding>> getCurrentStanding() async {
    final content = windowController.window.document
        .querySelectorAll("tbody.ng-star-inserted tr");

    List<SoccerStanding> standings = [];

    for (int i = 0; i < content.length; i++) {
      standings.add(
        SoccerStanding(
            name: content[i].querySelector(".team a").attributes['title'],
            logo: content[i].querySelector(".logo img").attributes['src'],
            played: content[i].querySelector(".matches").text,
            won: content[i].querySelector(".wins").text,
            drawn: content[i].querySelector(".draws").text,
            lost: content[i].querySelector(".looses").text,
            gf: 'NA',
            ga: 'NA',
            gd: content[i].querySelector(".goals").text,
            points: content[i].querySelector(".pts").text),
      );
    }

    return standings;
  }
}
