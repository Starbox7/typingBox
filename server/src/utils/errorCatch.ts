import { ErrorWithStatusCode } from '@/utils/Error';
import { Response } from 'express';
import StatusCode from './StatusCode';

const errorCatch = (err: unknown, res: Response) => {
  if (err instanceof ErrorWithStatusCode) {
    return res.status(err.statusCode.status).json({ ...err.statusCode, message: err.message, name: err.name });
  }
  return res.status(StatusCode.SERVER_ERROR.status).json(StatusCode.SERVER_ERROR);
};

export default errorCatch;
