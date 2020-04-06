import 'package:hydrated_bloc/src/hydrated_bloc_storage.dart';

abstract class HydratedBlocStorageInterface {
  static Future<HydratedBlocStorage> getInstance() {
    //Override
  }

  /// Returns value for key
  dynamic read(String key);

  /// Persists key value pair
  Future<void> write(String key, dynamic value);

  /// Deletes key value pair
  Future<void> delete(String key);

  /// Clears all key value pairs from storage
  Future<void> clear();
}
