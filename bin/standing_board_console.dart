import 'package:standing_board_console/models/formula_1_standing.dart';
import 'package:standing_board_console/models/gp_standing.dart';
import 'package:standing_board_console/models/soccer_standing.dart';
import 'package:standing_board_console/services/bundesliga_service.dart';
import 'package:standing_board_console/services/formula_1_service.dart';
import 'package:standing_board_console/services/gp_service.dart';
import 'package:standing_board_console/services/laliga_service.dart';
import 'package:standing_board_console/services/league_1_service.dart';
import 'package:standing_board_console/services/premiere_league_service.dart';
import 'package:standing_board_console/services/serie_a_service.dart';
import 'package:universal_html/controller.dart';
import 'package:universal_html/parsing.dart';

void main(List<String> arguments) {
  print('Standing Board Console Version 1.0');
  // _getDataEPL();
  // _getDataSerieA();
  // _getDataLaliga();
  // _getDataLeague1();
  // _getDataMotoGp();
  _getDataFormula1();
}

/// Get data english premiere league
Future<void> _getDataEPL() async {
  final controller = WindowController();
  await controller.openHttp(
    uri: Uri.parse("https://www.premierleague.com/tables"),
  );

  PremiereLeagueService premiereLeagueService =
      PremiereLeagueService(windowController: controller);

  List<SoccerStanding> premiereStanding =
      await premiereLeagueService.getCurrentStanding();

  for (var item in premiereStanding) {
    print('${item.name} (${item.points})');
  }
}

/// Get data serie A itally
Future<void> _getDataSerieA() async {
  final controller = WindowController();
  await controller.openHttp(
    uri: Uri.parse("https://www.legaseriea.it/en/serie-a/league-table"),
  );

  SerieAService serieAService = SerieAService(windowController: controller);

  List<SoccerStanding> serieAStanding =
      await serieAService.getCurrentStanding();

  for (var item in serieAStanding) {
    print('${item.name} (${item.points})');
  }
}

/// Get data Laliga spain
Future<void> _getDataLaliga() async {
  final controller = WindowController();
  await controller.openHttp(
    uri: Uri.parse("https://www.laliga.com/en-GB/laliga-santander/standing"),
  );

  LaligaService laligaService = LaligaService(windowController: controller);

  List<SoccerStanding> laligaStanding =
      await laligaService.getCurrentStanding();

  for (var item in laligaStanding) {
    print('${item.name} (${item.points})');
  }
}

/// Get data league 1 french
Future<void> _getDataLeague1() async {
  final controller = WindowController();
  await controller.openHttp(
    uri: Uri.parse("https://www.ligue1.com/ranking"),
  );

  League1Service league1service = League1Service(windowController: controller);

  List<SoccerStanding> leagueStanding =
      await league1service.getCurrentStanding();

  for (var item in leagueStanding) {
    print('${item.name} (${item.points})');
  }
}

/// Get data bundes liga germany
Future<void> _getDataBundesliga() async {
  final controller = WindowController();
  await controller.openHttp(
    uri: Uri.parse("https://www.bundesliga.com/en/bundesliga/table"),
  );

  BundesligaService bundesligaService =
      BundesligaService(windowController: controller);

  List<SoccerStanding> leagueStanding =
      await bundesligaService.getCurrentStanding();

  for (var item in leagueStanding) {
    print('${item.name} (${item.points})');
  }
}

/// Get data Moto GP's standing data
Future<void> _getDataMotoGp() async {
  final controller = WindowController();
  await controller.openHttp(
    uri: Uri.parse("https://www.autosport.com/motogp/standings/"),
  );

  GpService gpService = GpService(windowController: controller);

  gpService.getCurrentStanding();

  List<GpStanding> gpStanding = await gpService.getCurrentStanding();

  for (var item in gpStanding) {
    print('${item.rider} (${item.points})');
  }
}

/// Get data Formula 1 standing data
Future<void> _getDataFormula1() async {
  final controller = WindowController();
  await controller.openHttp(
    uri: Uri.parse("https://www.autosport.com/f1/standings/"),
  );

  Formula1Service formula1service =
      Formula1Service(windowController: controller);

  formula1service.getCurrentStanding();

  List<Formula1Standing> formula1Standing =
      await formula1service.getCurrentStanding();

  for (var item in formula1Standing) {
    print('${item.driver} (${item.points})');
  }
}
