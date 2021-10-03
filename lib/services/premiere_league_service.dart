import 'package:universal_html/controller.dart';

import 'package:standing_board_console/models/soccer_standing.dart';
import 'package:standing_board_console/services/soccer_service.dart';

class PremiereLeagueService extends SoccerService {
  WindowController windowController;

  PremiereLeagueService({
    this.windowController,
  });

  @override
  Future<List<SoccerStanding>> getCurrentStanding() async {
    final content = windowController.window.document
        .querySelectorAll("tbody.tableBodyContainer");

    List<SoccerStanding> standings = [];

    for (var i = 0; i < content[0].children.length; i++) {
      if (content[0].children[i].className == 'expandable') {
        continue;
      }
      standings.add(
        SoccerStanding(
          name:
              content[0].children[i].attributes['data-filtered-table-row-name'],
          logo: content[0]
              .children[i]
              .children[2]
              .children[0]
              .children[0]
              .children[0]
              .attributes['src']
              .toString(),
          played: content[0].children[i].children[3].text,
          won: content[0].children[i].children[4].text,
          drawn: content[0].children[i].children[5].text,
          lost: content[0].children[i].children[6].text,
          gf: content[0].children[i].children[7].text,
          ga: content[0].children[i].children[8].text,
          gd: content[0].children[i].children[9].text.toString().trim(),
          points: content[0].children[i].children[10].text,
        ),
      );
    }

    return standings;
  }
}
