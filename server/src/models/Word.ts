import queries from '@/sql/word';
import { NotFoundError, QuerySyntexError } from '@/utils/Error';
import { IWord } from '@/types/types';
import { db } from '@/config/db';

const Word = {
  select: async (): Promise<IWord> => {
    try {
      const [word]: Array<IWord> = await db.query(queries.select);
      return word;
    } catch (err: unknown) {
      throw new QuerySyntexError('sql Error');
    }
  },
  init: async (): Promise<Array<IWord>> => {
    try {
      return await db.query(queries.init);
    } catch (err: unknown) {
      throw new QuerySyntexError('sql Error');
    }
  },
  insert: async ({ word }: IWord): Promise<void> => {
    try {
      await db.execute(queries.insert, [word]);
    } catch (err: unknown) {
      throw new QuerySyntexError(`${err}`);
    }
  },
};

export default Word;
