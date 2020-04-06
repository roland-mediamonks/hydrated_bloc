import 'interface.dart';

/// Implementation of `HydratedStorage` for unsupported platforms,
/// only return throw
class HydratedBlocStorage implements HydratedBlocStorageInterface {
  /// Returns an instance of `HydratedBlocStorage`.
  static Future<HydratedBlocStorage> getInstance() {
    //Override
    throw 'Platform Not Supported';
  }

  /// Returns value for key
  dynamic read(String key) {
    // Override
    throw 'Platform Not Supported';
  }

  /// Persists key value pair
  Future<void> write(String key, dynamic value) {
    // Override
    throw 'Platform Not Supported';
  }

  /// Deletes key value pair
  Future<void> delete(String key) {
    // Override
    throw 'Platform Not Supported';
  }

  /// Clears all key value pairs from storage
  Future<void> clear() {
    // Override
    throw 'Platform Not Supported';
  }
}
