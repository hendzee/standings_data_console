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
        .querySelectorAll(".ms-table--result tr");

    List<GpStanding> standings = [];

    print(content.length);

    for (int i = 0; i < content.length; i++) {
      if (i == 0) continue;
      standings.add(
        GpStanding(
          rider: content[i].children[1].children[0].children[1].text,
          bike: '',
          nation:
              content[i].children[1].children[0].children[0].attributes['alt'],
          points: content[i].children[2].text,
        ),
      );
    }
    return standings;
  }
}
