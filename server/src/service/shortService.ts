import Short from '@/models/Short';
import { IShort } from '@/types/types';
import { BodyError, NotFoundError, QueryResponseError } from '@/utils/Error';

const shortService = {
  insert: async ({ name, short }: IShort): Promise<void> => {
    if (!short) {
      throw new BodyError(`SHORT IS INVALID`);
    }
    await Short.insert({ name, short });
  },
  select: async (): Promise<IShort> => {
    const short: IShort = await Short.select();
    if (!short) {
      throw new NotFoundError('SHORT IS NOT FOUND');
    }
    return short;
  },
  init: async (): Promise<Array<IShort>> => {
    const shorts = await Short.init();
    if (!shorts) {
      throw new NotFoundError('SHORTS IS NOT FOUND');
    }
    if (2 !== shorts.length) {
      throw new QueryResponseError(`WORDS.LENGTH IS NOT 2`);
    }
    return shorts;
  },
};

export default shortService;
