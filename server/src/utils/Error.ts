import { IErrorWithStatusCode, IStatusCode } from '@/types/types';
import StatusCode from '@/utils/StatusCode';

class ErrorWithStatusCode extends Error implements IErrorWithStatusCode {
  public statusCode: IStatusCode;
  constructor(message: string, statusCode: IStatusCode) {
    super(message);
    this.name = `ERROR WITH STATUS CODE`;
    this.statusCode = statusCode;
  }
}
class DBError extends ErrorWithStatusCode {
  constructor(message: string) {
    super(message, StatusCode.SERVER_ERROR);
    this.name = `DB ERROR`;
  }
}

class QuerySyntexError extends ErrorWithStatusCode {
  constructor(message: string) {
    super(message, StatusCode.BAD_REQUEST);
    this.name = `QUERY ERROR`;
  }
}

class QueryResponseError extends ErrorWithStatusCode {
  constructor(message: string) {
    super(message, StatusCode.BAD_REQUEST);
    this.name = `QUERY ERROR`;
  }
}
class ParamsError extends ErrorWithStatusCode {
  constructor(message: string) {
    super(message, StatusCode.BAD_REQUEST);
    this.name = `PARMAS ERROR`;
  }
}

class BodyError extends ErrorWithStatusCode {
  constructor(message: string) {
    super(message, StatusCode.BAD_REQUEST);
    this.name = `BODY ERROR`;
  }
}

class AuthError extends ErrorWithStatusCode {
  constructor(message: string, statusCode: IStatusCode) {
    super(message, statusCode);
    this.name = `AUTH ERROR`;
  }
}

class TokenError extends AuthError {
  constructor(message: string) {
    super(message, StatusCode.UNAUTHORIZED);
    this.name = `TOKEN ERROR`;
  }
}

class SigninError extends AuthError {
  constructor(message: string) {
    super(message, StatusCode.UNAUTHORIZED);
    this.name = `SIGNIN ERROR`;
  }
}

class SignupError extends AuthError {
  constructor(message: string) {
    super(message, StatusCode.CONFLICT);
    this.name = `SIGNIN ERROR`;
  }
}

class NotFoundError extends ErrorWithStatusCode {
  constructor(message: string) {
    super(message, StatusCode.NOT_FOUND);
    this.name = `NOT FOUND ERROR`;
  }
}

export { ErrorWithStatusCode, DBError, ParamsError, BodyError, QuerySyntexError, QueryResponseError, TokenError, SigninError, SignupError, NotFoundError };
