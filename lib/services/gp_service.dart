import 'package:standing_board_console/models/gp_standing.dart';
import 'package:universal_html/controller.dart';

import 'package:standing_board_console/services/race_service.dart';

class GpService extends RaceService {
  WindowController windowController;

  GpService({
    this.windowController,
  });

  @override
  Future<List<GpStanding>> getCurrentStanding() async {
    final content = windowController.window.document
        .querySelectorAll("#main_result table tbody tr");

    List<GpStanding> standings = [];

    for (int i = 0; i < content.length; i++) {
      standings.add(
        GpStanding(
          rider: content[i].children[1].children[0].text,
          bike: content[i].children[2].text,
          nation: content[i].children[3].text,
          points: content[i].children[4].text,
        ),
      );
    }
    return standings;
  }
}
