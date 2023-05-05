import Word from '@/models/Word';
import { IWord } from '@/types/types';
import { BodyError, NotFoundError, QueryResponseError } from '@/utils/Error';

const wordService = {
  select: async (): Promise<IWord> => {
    const word: IWord = await Word.select();
    if (!word) {
      throw new NotFoundError(`WORD IS NOT FOUND`);
    }
    return word;
  },
  init: async (): Promise<Array<IWord>> => {
    const words = await Word.init();
    if (!words) {
      throw new NotFoundError(`WORDS IS NOT FOUND`);
    }
    if (2 !== words.length) {
      throw new QueryResponseError(`WORDS.LENGTH IS NOT 2`);
    }
    return words;
  },
  insert: async ({ word }: IWord): Promise<void> => {
    if (!word) {
      throw new BodyError(`WORD IS INVALID`);
    }
    await Word.insert({ word });
  },
};

export default wordService;
