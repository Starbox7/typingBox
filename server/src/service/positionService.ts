import { ParamsError, QueryResponseError, NotFoundError } from '@/utils/Error';
import Position from '@/models/Position';
import { IPosition } from '@/types/types';

const positionService = {
  select: (level: string): IPosition => {
    const lv: number = parseInt(level);
    if (isNaN(lv)) {
      throw new ParamsError(`PARAMS IS NOT NUMBER`);
    }
    const letter: string = Position.select(lv);
    if (!letter) {
      throw new NotFoundError(`LETTER IS NOT FOUND`);
    }
    return { position: letter } as IPosition;
  },
  init: (level: string): Array<IPosition> => {
    const lv: number = parseInt(level);
    if (isNaN(lv)) {
      throw new ParamsError(`PARAMS IS NOT NUMBER`);
    }
    const letters: Array<string> = Position.init(lv);
    if (!letters) {
      throw new NotFoundError(`LETTER IS NOT FOUND`);
    }
    if (2 != letters.length) {
      throw new QueryResponseError(`LETTERS.LENGTH IS NOT 2`);
    }
    return [{ position: letters[0] }, { position: letters[1] }] as Array<IPosition>;
  },
};

export default positionService;
