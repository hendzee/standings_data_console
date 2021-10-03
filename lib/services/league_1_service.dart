import 'package:standing_board_console/models/soccer_standing.dart';
import 'package:standing_board_console/services/soccer_service.dart';

import 'package:universal_html/controller.dart';

class League1Service extends SoccerService {
  WindowController windowController;

  League1Service({
    this.windowController,
  });

  @override
  Future<List<SoccerStanding>> getCurrentStanding() async {
    List<SoccerStanding> standings = [];

    final content = windowController.window.document
        .querySelectorAll(".classement-table .GeneralStats-row");

    for (int i = 0; i < content.length; i++) {
      standings.add(SoccerStanding(
        name: content[i].children[0].children[1].children[1].text,
        logo: content[i].children[0].children[1].children[0].attributes['src'],
        played: content[i].children[0].children[3].text,
        won: content[i].children[0].children[4].text,
        drawn: content[i].children[0].children[5].text,
        lost: content[i].children[0].children[6].text,
        gf: content[i].children[0].children[7].text,
        ga: content[i].children[0].children[8].text,
        gd: content[i].children[0].children[9].text,
        points: content[i].children[0].children[2].text,
      ));
    }

    return standings;
  }
}
