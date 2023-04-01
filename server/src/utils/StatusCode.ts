import { IStatusCode } from '@/types/types';

const StatusCode: { [key: string]: IStatusCode } = {
    OK: {
        status: 200,
        information: 'OK',
    },
    CREATED: {
        status: 201,
        information: 'CREATED',
    },
    BAD_REQUEST: {
        status: 400,
        information: 'BAD_REQUEST',
    },
    UNAUTHORIZED: {
        status: 401,
        information: 'UNAUTHORIZED',
    },
    NOT_FOUND: {
        status: 404,
        information: 'NOT FOUND',
    },
    CONFLICT: {
        status: 409,
        information: 'CONFLICT',
    },
    SERVER_ERROR: {
        status: 500,
        information: 'INTERNAL SERVER ERROR',
    },
};

export default StatusCode;