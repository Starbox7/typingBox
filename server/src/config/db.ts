import { DB_HOST, DB_NAME, DB_PASSWORD, DB_PORT, DB_USER } from '@/constants/constant';
import { IConfig } from '@/types/types';
import { DBError } from '@/utils/Error';
import { Pool, createPool } from 'mysql2/promise';

const config: IConfig = {
  host: DB_HOST!,
  port: parseInt(DB_PORT!),
  database: DB_NAME!,
  user: DB_USER!,
  password: DB_PASSWORD!,
  multipleStatements: true,
};

class DB {
  private static instance: DB | undefined;
  private pool: Pool;

  private constructor() {
    this.pool = createPool(config);
  }

  public static getInstance(): DB {
    if (!DB.instance) {
      DB.instance = new DB();
    }
    return DB.instance;
  }

  public async query(sql: string, values?: Array<any>): Promise<any> {
    let connection;
    try {
      connection = await this.pool.getConnection();
      const [result] = await connection.execute(sql, values);
      return result;
    } catch (err: unknown) {
      console.log(err);
      throw new DBError('DB Error');
    } finally {
      connection?.release();
    }
  }

  public async execute(sql: string, values?: Array<any>): Promise<any> {
    let connection;
    try {
      connection = await this.pool.getConnection();
      await connection.beginTransaction();
      await connection.execute(sql, values);
      await connection.commit();
    } catch (err: unknown) {
      await connection?.rollback();
      throw new DBError('DBError');
    } finally {
      connection?.release();
    }
  }
}

export const db = DB.getInstance();
