import '../data/model/role_model.dart';

class AppConstants {
  static const String baseUrl = 'https://valorant-api.com/';
  static const String method = 'v1/agents';
  static const String apiUrl = 'https://valorant-api.com/v1/agents';
  static const appLogo = 'assets/images/valo_logo.png';
  static List<RoleModel> roles = [
    RoleModel(
        displayIcon: 'assets/images/controller.png', displayName: 'Controller'),
    RoleModel(displayIcon: 'assets/images/duelist.png', displayName: 'Duelist'),
    RoleModel(
        displayIcon: 'assets/images/initiator.png', displayName: 'Initiator'),
    RoleModel(
        displayIcon: 'assets/images/sential.png', displayName: 'Sentinel'),
  ];
}
