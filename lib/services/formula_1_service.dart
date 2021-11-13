import 'package:standing_board_console/models/formula_1_standing.dart';
import 'package:standing_board_console/models/gp_standing.dart';
import 'package:universal_html/controller.dart';

import 'package:standing_board_console/services/race_service.dart';

class Formula1Service extends RaceService {
  WindowController windowController;

  Formula1Service({
    this.windowController,
  });

  @override
  Future<List<Formula1Standing>> getCurrentStanding() async {
    final content = windowController.window.document
        .querySelectorAll(".ms-table--result tr");

    List<Formula1Standing> standings = [];

    for (int i = 0; i < content.length; i++) {
      if (i == 0) continue;
      standings.add(
        Formula1Standing(
          driver: content[i].children[1].children[0].children[1].text,
          nation:
              content[i].children[1].children[0].children[0].attributes['alt'],
          points: content[i].children[2].text,
        ),
      );
    }
    return standings;
  }
}
