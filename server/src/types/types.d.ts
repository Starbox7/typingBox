import { IStatusCode } from '@/types/types';
interface IUser {
    idx?: number;
    id: string;
    password: string;
}

interface IConfig {
    host: string;
    port?: number;
    database: string;
    user: string;
    password: string;
    multipleStatements: boolean;
}

interface IStatusCode {
    status: number;
    information: string;
}

export { IUser, IConfig, IStatusCode }