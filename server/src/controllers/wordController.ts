import { Request, Response } from 'express';
import StatusCode from '@/utils/StatusCode';
import { IWord } from '@/types/types';
import wordService from '@/service/wordService';
import errorCatch from '@/utils/errorCatch';

const wordController = {
  select: async (req: Request, res: Response): Promise<Response> => {
    try {
      const word: IWord = await wordService.select();
      return res.status(StatusCode.OK.status).json(word);
    } catch (err: unknown) {
      return errorCatch(err, res);
    }
  },
  init: async (req: Request, res: Response): Promise<Response> => {
    try {
      const words: Array<IWord> = await wordService.init();
      return res.status(StatusCode.OK.status).json(words);
    } catch (err: unknown) {
      return errorCatch(err, res);
    }
  },
  insert: async (req: Request, res: Response): Promise<Response> => {
    const { word }: IWord = req.body;
    try {
      await wordService.insert({ word });
      return res.status(StatusCode.CREATED.status).json(StatusCode.CREATED);
    } catch (err: unknown) {
      return errorCatch(err, res);
    }
  },
};

export default wordController;
