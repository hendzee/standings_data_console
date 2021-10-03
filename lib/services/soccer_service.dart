import 'package:standing_board_console/models/soccer_standing.dart';

abstract class SoccerService {
  Future<List<SoccerStanding>> getCurrentStanding();
}
