import 'package:dio/dio.dart';
import 'package:ansicolor/ansicolor.dart';
import 'package:mindxtalk/services/endpoints.dart';

API api = API();

class API {
  Dio dio = Dio(BaseOptions(baseUrl: Endpoints.BASE_URL));
  late DateTime startTime;

  static final API _api = API._();

  factory API() => _api;

  API._() {
    if (bool.fromEnvironment("dart.vm.product")) ansiColorDisabled = true;
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      _printDebugRequest(options);
      return options;
    }, onResponse: (Response response) async {
      _printDebugResponse(response);
      return response;
    }, onError: (DioError error) async {
      _printDebugError(error);
      return error; //continue
    }));
  }

  void _printDebugRequest(RequestOptions options) {
    assert(() {
      AnsiPen pen = AnsiPen()..cyan();
      startTime = new DateTime.now();
      print("\n\n");
      print(pen("================ Request ================"));
      print(pen("method: ${options.method}"));
      if (options.queryParameters.length > 0)
        print(pen("params: ${options.queryParameters}"));
      print(pen("headers: ${options.headers}"));
      print(pen("data: ${options.data}"));
      print(pen("uri: ${options.path}"));
      print(pen("Content type: ${options.contentType}"));
      print(pen("============== End Request =============="));
      print("\n\n");
      return true;
    }());
  }

  void _printDebugResponse(Response response) {
    assert(() {
      AnsiPen pen = AnsiPen()..green();
      print("\n\n");
      print(pen("================ Response ==============="));
      print(pen("uri: ${response.request.path}"));
      print(pen("status: ${response.statusCode} ${response.statusMessage}"));
      print(pen("data: ${response.data}"));
      print(pen(
          "time: ${DateTime.now().millisecondsSinceEpoch - startTime.millisecondsSinceEpoch} ms"));
      print(pen("============== End Response ============="));
      print("\n\n");
      return true;
    }());
  }

  void _printDebugError(DioError error) {
    assert(() {
      AnsiPen pen = AnsiPen()..red();
      print("\n\n");
      print(pen("============= Response ERROR ============"));
      print(pen("uri: ${error.request.path}"));
      print(pen("type: ${error.type}"));
      print(pen("error: ${error.error}"));
      if (error.response != null && error.response.data != null)
        print(pen("message: ${error.response.data}"));
      print(pen("============== End Response ============="));
      print("\n\n");
      return true;
    }());
  }
}
