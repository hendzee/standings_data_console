import 'package:standing_board_console/models/soccer_standing.dart';
import 'package:standing_board_console/services/soccer_service.dart';

import 'package:universal_html/controller.dart';

class LaligaService extends SoccerService {
  WindowController windowController;

  LaligaService({
    this.windowController,
  });

  @override
  Future<List<SoccerStanding>> getCurrentStanding() async {
    final content = windowController.window.document
        .querySelectorAll(".styled__StandingTableContainer-e89col-1")
        .first
        .querySelectorAll(".HquGF");

    List<SoccerStanding> standings = [];

    for (int i = 0; i < content.length; i++) {
      // Get to position class .fVocLp
      var currentPos = content[i].children[0].children[2].children[0];

      standings.add(SoccerStanding(
        name: currentPos.children[1].children[1].children[1].text,
        logo: 'NA',
        played: currentPos.children[3].children[0].text,
        won: currentPos.children[3].children[0].text,
        drawn: currentPos.children[4].children[0].text,
        lost: currentPos.children[5].children[0].text,
        gf: currentPos.children[6].children[0].text,
        ga: currentPos.children[7].children[0].text,
        gd: currentPos.children[8].children[0].text,
        points: currentPos.children[2].children[0].text,
      ));
    }

    return standings;
  }
}
