import 'package:dio/dio.dart';

class HttpException implements Exception {
  final String? _message;
  final int _statusCode;

  // Get methods
  int get statusCode => _statusCode;

  String get message => _message ?? _getMessageFromStatusCode(statusCode);

  static String _getMessageFromStatusCode(int statusCode) {
    if (_statusCodeResponses.containsKey(statusCode)) {
      return '${_statusCodeResponses[statusCode]} '; //Por favor, tente novamente mais tarde.';
    }

    return '${_statusCodeResponses[HttpStatusExceptionType.unexpectedException.statusCode]} Por favor, tente novamente mais tarde.';
  }

  static String _getMessageFromDioException(DioException dioException) {
    Response? response = dioException.response;
    if (response != null &&
        response.statusCode != null &&
        _statusCodeResponses.containsKey(response.statusCode)) {
      return _statusCodeResponses[dioException.response!.statusCode]!;
    }

    if (_dioExceptionTypes.containsKey(dioException.type)) {
      return '${_dioExceptionTypes[dioException.type]!} Por favor, tente novamente mais tarde.';
    }

    return '${_statusCodeResponses[HttpStatusExceptionType.unexpectedException.statusCode]!} Por favor, tente novamente mais tarde.';
  }

  // Constructors
  HttpException({required statusCode, required message})
    : _message = message,
      _statusCode = statusCode;

  HttpException.fromDioException(DioException dioException)
    : _statusCode = 0,
      _message = _getMessageFromDioException(dioException);

  HttpException.fromStatusCode({required int statusCode})
    : _statusCode = statusCode,
      _message = _getMessageFromStatusCode(statusCode);

  HttpException.fromMessage({required String message})
    : _message = message,
      _statusCode = 0;

  static HttpException socketException = HttpException.fromMessage(
    message:
        "Sem conexão com a internet. Por favor, tente novamente mais tarde.",
  );

  static HttpException unexpectedRequestException = HttpException.fromMessage(
    message:
        "Ocorreu um erro inesperado durante a requisição!. Por favor, tente novamente mais tarde.",
  );

  static HttpException unexpectedException = HttpException.fromMessage(
    message:
        '${_statusCodeResponses[HttpStatusExceptionType.unexpectedException.statusCode]!} Por favor, tente novamente mais tarde',
  );

  // Status code messages
  // FIXME: Update
  static final Map<int, String> _statusCodeResponses = {
    HttpStatusExceptionType.accepted.statusCode:
        'Não há dados disponíveis para essa requisição!.',

    // HttpStatusExceptionType.badRequest: 'Os dados estão temporariamente indisponíveis!',
    HttpStatusExceptionType.badRequest.statusCode:
        'Email e/ou senha inválido(s).',

    HttpStatusExceptionType.unauthorized.statusCode:
        'Email e/ou senha inválido(s).',
    HttpStatusExceptionType.forbidden.statusCode:
        'O usuário não possui autorização.',
    HttpStatusExceptionType.notFound.statusCode: 'Recurso não encontrado.',
    HttpStatusExceptionType.notAllowedMethod.statusCode:
        'Requisição não permitida.',
    HttpStatusExceptionType.conflict.statusCode: 'Transação inexistente.',
    HttpStatusExceptionType.badGateway.statusCode: 'Serviço indisponível.',
    HttpStatusExceptionType.serviceUnavailable.statusCode:
        'Serviço indisponível.',
    HttpStatusExceptionType.gatewayTimeout.statusCode: 'Serviço indisponível.',
    HttpStatusExceptionType.unexpectedException.statusCode:
        'Ocorreu um erro inesperado.',
  };

  static final Map<DioExceptionType, String> _dioExceptionTypes = {
    DioExceptionType.connectionError:
        'Sem conexão com a internet. Por favor, tente novamente mais tarde.',
    DioExceptionType.connectionTimeout:
        'Serviço indisponível. Por favor, tente novamente mais tarde.',
    DioExceptionType.receiveTimeout:
        'Serviço indisponível. Por favor, tente novamente mais tarde.',
    DioExceptionType.sendTimeout:
        'Serviço indisponível. Por favor, tente novamente mais tarde.',
  };

  @override
  String toString() {
    return 'Code: $statusCode | Message: $_message';
  }
}

enum HttpStatusExceptionType {
  ok(200),
  created(201),
  accepted(202),
  noContent(204),
  badRequest(400),
  unauthorized(401),
  forbidden(403),
  notFound(404),
  notAllowedMethod(405),
  conflict(409),
  unexpectedException(500),
  badGateway(502),
  serviceUnavailable(503),
  gatewayTimeout(504);

  final int statusCode;

  const HttpStatusExceptionType(this.statusCode);
}
