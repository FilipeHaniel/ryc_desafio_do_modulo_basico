
abstract class HttpCore {
  Future<void> post(String path, {Object? data});
  Future<void> get(String path, {Object? data});
}
