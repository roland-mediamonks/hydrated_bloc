import 'package:hydrated_bloc/src/storage/interface.dart';

class HydratedBlocStorage implements HydratedBlocStorageInterface {
  static Future<HydratedBlocStorage> getInstance() {
    //Override
  }

  /// Returns value for key
  dynamic read(String key) {
    // Override
    return null;
  }

  /// Persists key value pair
  Future<void> write(String key, dynamic value) {
    // Override
    return null;
  }

  /// Deletes key value pair
  Future<void> delete(String key) {
    // Override
    return null;
  }

  /// Clears all key value pairs from storage
  Future<void> clear() {
    // Override
    return null;
  }
}
