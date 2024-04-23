import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_x/core/helper/preferences_helper_user.dart';
import 'package:test_x/core/services/db.dart';

class UserStore {
  UserStore._internal();

  static final UserStore _instance = UserStore._internal();

  static UserStore get instance => _instance;

  String _uid = '';
  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _countryCode = '';
  String _mobile = '';
  String _accessStore = "";
  String _avatar = '';
  String _rol = '';
  String _collaborator = '';

  bool _estado = true;
  bool _google = false;
  bool _apple = false;
  bool _facebook = false;
  String _createdAt = '';
  String _updatedAt = '';

  String get uid => _uid;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get email => _email;
  String get countryCode => _countryCode;
  String get mobile => _mobile;
  String get avatar => _avatar;
  String get rol => _rol;
  String get collaborator => _collaborator;
  bool get estado => _estado;
  bool get google => _google;
  bool get apple => _apple;
  bool get facebook => _facebook;
  String get createdAt => _createdAt;
  String get accessStore => _accessStore;

  String get updatedAt => _updatedAt;

  final SharedPreferences _sharedPreferences = DB.instance.prefs;

  Future<void> init() async {
    _uid = _sharedPreferences.getString(PreferencesHelperUser.uid) ?? '';
    _firstName =
        _sharedPreferences.getString(PreferencesHelperUser.firstName) ?? '';
    _lastName =
        _sharedPreferences.getString(PreferencesHelperUser.lastName) ?? "";
    _email = _sharedPreferences.getString(PreferencesHelperUser.email) ?? "";
    _accessStore =
        _sharedPreferences.getString(PreferencesHelperUser.accessStore) ?? "";

    _countryCode =
        _sharedPreferences.getString(PreferencesHelperUser.countryCode) ?? "";
    _mobile = _sharedPreferences.getString(PreferencesHelperUser.mobile) ?? "";

    _avatar = _sharedPreferences.getString(PreferencesHelperUser.avatar) ?? "";
    _rol = _sharedPreferences.getString(PreferencesHelperUser.rol) ?? '';
    _collaborator =
        _sharedPreferences.getString(PreferencesHelperUser.collaborator) ?? "";

    _estado = _sharedPreferences.getBool(PreferencesHelperUser.estado) ?? true;
    _google = _sharedPreferences.getBool(PreferencesHelperUser.google) ?? false;
    _apple = _sharedPreferences.getBool(PreferencesHelperUser.apple) ?? false;
    _facebook =
        _sharedPreferences.getBool(PreferencesHelperUser.facebook) ?? false;
    _createdAt =
        _sharedPreferences.getString(PreferencesHelperUser.createdAt) ?? '';
    _updatedAt =
        _sharedPreferences.getString(PreferencesHelperUser.updatedAt) ?? '';
  }

  Future<void> logInSession({
    required String uid,
    required String firstName,
    required String lastName,
    required String email,
    required String accessStore,
    required String countryCode,
    required String mobile,
    required String avatar,
    required String rol,
    required String collaborator,
    required bool estado,
    required bool google,
    required bool apple,
    required bool facebook,
    required String createdAt,
    required String updatedAt,
  }) async {
    _uid = uid;
    await _sharedPreferences.setString(PreferencesHelperUser.uid, uid);
    _firstName = firstName;
    await _sharedPreferences.setString(
        PreferencesHelperUser.firstName, firstName);
    _lastName = lastName;
    await _sharedPreferences.setString(
        PreferencesHelperUser.lastName, lastName);
    _mobile = mobile;
    await _sharedPreferences.setString(PreferencesHelperUser.mobile, mobile);
    _email = email;
    await _sharedPreferences.setString(PreferencesHelperUser.email, email);
    _countryCode = countryCode;
    await _sharedPreferences.setString(
        PreferencesHelperUser.countryCode, countryCode);
    _accessStore = accessStore;
    await _sharedPreferences.setString(
        PreferencesHelperUser.accessStore, accessStore);
    _avatar = avatar;
    await _sharedPreferences.setString(PreferencesHelperUser.avatar, avatar);
    _collaborator = collaborator;
    await _sharedPreferences.setString(
        PreferencesHelperUser.collaborator, collaborator);
    _rol = rol;
    await _sharedPreferences.setString(PreferencesHelperUser.rol, rol);

    _estado = estado;
    await _sharedPreferences.setBool(PreferencesHelperUser.estado, true);
    _google = google;
    await _sharedPreferences.setBool(PreferencesHelperUser.google, false);
    _apple = apple;
    await _sharedPreferences.setBool(PreferencesHelperUser.apple, false);
    _facebook = facebook;
    await _sharedPreferences.setBool(PreferencesHelperUser.facebook, false);
    _createdAt = createdAt;
    await _sharedPreferences.setString(
        PreferencesHelperUser.createdAt, createdAt);
    _updatedAt = updatedAt;
    await _sharedPreferences.setString(
        PreferencesHelperUser.updatedAt, updatedAt);
  }

  Future<void> logOutSession() async {
    _uid = '';
    await _sharedPreferences.setString(PreferencesHelperUser.uid, "");

    _firstName = '';
    await _sharedPreferences.setString(PreferencesHelperUser.firstName, "");

    _lastName = '';
    await _sharedPreferences.setString(PreferencesHelperUser.lastName, "");

    _email = '';
    await _sharedPreferences.setString(PreferencesHelperUser.email, "");

    _accessStore = '';
    await _sharedPreferences.setString(PreferencesHelperUser.accessStore, "");

    _countryCode = '';
    await _sharedPreferences.setString(PreferencesHelperUser.countryCode, "");

    _mobile = '';
    await _sharedPreferences.setString(PreferencesHelperUser.mobile, "");

    _avatar = '';
    await _sharedPreferences.setString(PreferencesHelperUser.avatar, "");

    _rol = '';
    await _sharedPreferences.setString(PreferencesHelperUser.rol, "");

    _collaborator = '';
    await _sharedPreferences.setString(PreferencesHelperUser.collaborator, "");

    _estado = false;
    await _sharedPreferences.setBool(PreferencesHelperUser.estado, true);

    _google = false;
    await _sharedPreferences.setBool(PreferencesHelperUser.google, true);

    _apple = false;
    await _sharedPreferences.setBool(PreferencesHelperUser.apple, true);

    _facebook = false;
    await _sharedPreferences.setBool(PreferencesHelperUser.facebook, true);

    _createdAt = '';
    await _sharedPreferences.setString(PreferencesHelperUser.createdAt, "");

    _updatedAt = '';
    await _sharedPreferences.setString(PreferencesHelperUser.updatedAt, "");
  }
}
