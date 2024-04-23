import 'package:test_x/flavor.dart';

class Server {
  // Only change this parameter in case you need to change
  // the environment.
  static bool isTrueEnv = false;
  static String dynamicLink = Flavor.instance.dynamicLink;
  static final String _api = Flavor.instance.api;

  // Endpoints (PENDING TO REFACTOR NOT USE)
  static const String _user = '/user/';
  static const String _auth = '/auth/';
  static const String _sales = '/sales/';
  static const String _expanse = '/expense/';
  static const String _inventory = '/inventory/';
  static const String _category = '/category/';
  static const String _subCategory = '/subCategory/';
  static const String _product = '/products/';

  static const String _repair = '/repair/';
  static const String _collaborator = '/collaborators/';

  static const String _refreshToken = 'users/rest-auth/token/refresh/';

  // Refactoring !! Important to follow the correct path (USE THIS)

  static const String _authMobile = '${_auth}mobile/';
  static const String _verify = '${_auth}verify/';
  static const String _otp = '${_auth}otp/';
  static const String _process = '${_repair}process/';
  static const String _processEnd = '${_repair}end/';

  // Full url (PENDING TO REFACTOR NOT USE)
  static String get user => "$_api$_user";
  static String get sales => "$_api$_sales";
  static String get expanse => "$_api$_expanse";
  static String get repair => "$_api$_repair";
  static String get authMobile => "$_api$_authMobile";
  static String get collaborator => "$_api$_collaborator";
  static String get inventory => "$_api$_inventory";
  static String get category => "$_api$_category";

  static String get refreshToken => "$_api$_refreshToken";
  //static String store(int idStore) => "$_api$_storeStores$idStore/";
  static String otp(String id) => "$_api$_otp$id";
  static String verify(String mobile, String otp) =>
      "$_api$_verify$mobile/$otp";

  static String userUpdate(String id) => "$_api$_user$id";
  static String process(String id) => "$_api$_process$id";
  static String repairUpdate(String id) => "$_api$_repair$id";
  static String processEnd(String id) => "$_api$_processEnd$id";
  static String updateExpanse(String id) => "$_api$_expanse$id";
  static String updateAllSales(String id) => "$_api$_sales$id";
  static String updateSales(String id) => "$_api${_sales}one/$id";
  static String deletedSales(String id) => "$_api${_sales}ones/$id/";
  static String getAllCollaborator(String id) => "$_api${_collaborator}all/$id";
  static String addCollaborator(String id) => "$_api$_collaborator$id";
  static String getCollaborator(String id) => "$_api$_collaborator$id";
  static String getUserCollaborator(String id) =>
      "$_api${_collaborator}user/$id";
  static String updateUserCollaborator(String id) => "$_api${_user}user/$id";

  static String deletedCollaborator(String id) =>
      "$_api${_collaborator}delete/$id";

  static String reportDaily(
    String id,
    String startDay,
    String endDay,
    String type,
  ) =>
      "$_api$_sales$id/start$type=$startDay&end$type=$endDay";
  static String getInventory(String id) => "$_api$_inventory$id";
  static String getAllProduct(String id) => "$_api$_product$id";
  static String getAllSubCategory(String id) => "$_api$_subCategory$id";
}
