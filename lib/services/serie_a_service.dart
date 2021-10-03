import 'package:universal_html/controller.dart';

import 'package:standing_board_console/models/soccer_standing.dart';
import 'package:standing_board_console/services/soccer_service.dart';

class SerieAService extends SoccerService {
  WindowController windowController;

  SerieAService({
    this.windowController,
  });

  @override
  Future<List<SoccerStanding>> getCurrentStanding() async {
    final content =
        windowController.window.document.querySelector(".classifica tbody");

    List<SoccerStanding> standings = [];

    for (var i = 0; i < content.children.length; i++) {
      if (content.children[i].className == 'tablesorter-scroller-spacer') {
        continue;
      }

      standings.add(SoccerStanding(
          name: content.children[i].children[0].children[1].attributes['title'],
          logo: content.children[i].children[0].children[1].attributes['src'],
          played: content.children[i].children[2].text,
          won: content.children[i].children[3].text,
          drawn: content.children[i].children[4].text,
          lost: content.children[i].children[5].text,
          gf: content.children[i].children[14].text,
          ga: content.children[i].children[15].text,
          gd: 'NA',
          points: content.children[i].children[1].text));
    }

    return standings;
  }
}
