import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:hydrated_bloc/src/storage/interface.dart';

/// Implementation of `HydratedStorage` which uses `window.localStorage`
/// to persist and retrieve state changes from the local storage.
class HydratedBlocStorage implements HydratedBlocStorageInterface {
  static HydratedBlocStorage _instance;
  final Map<String, dynamic> _storage;
  final Storage _localStorage;
  final String _fileName;

  /// Returns an instance of `HydratedBlocStorage`.
  /// By default, `hydrated_bloc` is used as key.
  static Future<HydratedBlocStorage> getInstance() async {
    if (_instance != null) {
      return _instance;
    }

    final fileName = 'hydrated_bloc';
    var localStorage = window.localStorage;
    var storage = <String, dynamic>{};

    if (await localStorage.containsKey(fileName)) {
      try {
        final data = localStorage.entries.firstWhere(
          (i) => i.key == fileName,
          orElse: () => null,
        );
        storage = json.decode(data?.value) as Map<String, dynamic>;
      } on dynamic catch (_) {
        await localStorage.remove(fileName);
      }
    }

    _instance = HydratedBlocStorage._(storage, localStorage, fileName);
    return _instance;
  }

  HydratedBlocStorage._(this._storage, this._localStorage, this._fileName);

  @override
  dynamic read(String key) {
    return _storage[key];
  }

  @override
  Future<void> write(String key, dynamic value) async {
    _storage[key] = value;
    _localStorage[_fileName] = json.encode(_storage);
    return _storage[key] = value;
  }

  @override
  Future<void> delete(String key) async {
    await _storage.remove(key);
    _localStorage[_fileName] = json.encode(_storage);
    return;
  }

  @override
  Future<void> clear() async {
    _storage.clear();
    _instance = null;
    return await _localStorage.remove(_fileName);
  }
}
