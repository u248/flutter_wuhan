import 'package:dio/dio.dart';

/// @desc  网络请求错误
/// @time 2019/3/20 10:02 AM
/// @author chenyun
class HttpError {
  ///HTTP 状态码
  static const int UNAUTHORIZED = 401;
  static const int FORBIDDEN = 403;
  static const int NOT_FOUND = 404;
  static const int REQUEST_TIMEOUT = 408;
  static const int INTERNAL_SERVER_ERROR = 500;
  static const int BAD_GATEWAY = 502;
  static const int SERVICE_UNAVAILABLE = 503;
  static const int GATEWAY_TIMEOUT = 504;

  ///未知错误
  static const String UNKNOWN = "UNKNOWN";

  ///解析错误
  static const String PARSE_ERROR = "PARSE_ERROR";

  ///网络错误
  static const String NETWORK_ERROR = "NETWORK_ERROR";

  ///协议错误
  static const String HTTP_ERROR = "HTTP_ERROR";

  ///证书错误
  static const String SSL_ERROR = "SSL_ERROR";

  ///连接超时
  static const String CONNECT_TIMEOUT = "CONNECT_TIMEOUT";

  ///响应超时
  static const String RECEIVE_TIMEOUT = "RECEIVE_TIMEOUT";

  ///发送超时
  static const String SEND_TIMEOUT = "SEND_TIMEOUT";

  ///网络请求取消
  static const String CANCEL = "CANCEL";

  String code;

  String message;

  HttpError(this.code, this.message);

  HttpError.dioError(DioError error) {
    message = error.message;
    switch (error.type) {
      case DioErrorType.CONNECT_TIMEOUT:
        code = CONNECT_TIMEOUT;
        message = "网络连接超时，请检查网络设置";
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        code = RECEIVE_TIMEOUT;
        message = "服务器异常，请稍后重试！";
        break;
      case DioErrorType.SEND_TIMEOUT:
        code = SEND_TIMEOUT;
        message = "网络连接超时，请检查网络设置";
        break;
      case DioErrorType.RESPONSE:
        code = HTTP_ERROR;
        message = "服务器异常，请稍后重试！";
        break;
      case DioErrorType.CANCEL:
        code = CANCEL;
        message = "请求已被取消，请重新请求";
        break;
      case DioErrorType.DEFAULT:
        code = UNKNOWN;
        message = "网络异常，请稍后重试！";
        break;
    }
  }

  @override
  String toString() {
    return 'HttpError{code: $code, message: $message}';
  }
}


///交易对象校验错误码
const String SUCCESS_1000 = '1000'; //校验成功
const String ERROR_1001 = '1001'; //姓名不通过
const String ERROR_1002 = '1002'; //手机号不通过
const String ERROR_1003 = '1003'; //公司名不通过