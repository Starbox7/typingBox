import queries from '@/sql/short';
import { QuerySyntexError } from '@/utils/Error';
import { IShort } from '@/types/types';
import { db } from '@/config/db';
import { init } from 'list';

const Short = {
  insert: async ({ name, short }: IShort): Promise<void> => {
    try {
      await db.execute(queries.insert, [name, short]);
    } catch (err: unknown) {
      throw new QuerySyntexError(`${err}`);
    }
  },
  select: async (): Promise<IShort> => {
    try {
      const [short]: Array<IShort> = await db.query(queries.select);
      return short;
    } catch (err: unknown) {
      throw new QuerySyntexError('sql Error');
    }
  },
  init: async (): Promise<Array<IShort>> => {
    try {
      return await db.query(queries.init);
    } catch (err: unknown) {
      throw new QuerySyntexError('sql Error');
    }
  },
};

export default Short;
