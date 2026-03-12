abstract class SharedPrefsPort {
  Future<void> setToken(String value);

  Future<String?> getToken();

  Future<void> clear();

  Future<void> saveThemeMode(bool isDark);

  Future<bool> getThemeMode();
}
