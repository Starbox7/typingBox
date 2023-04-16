import { Request, Response } from 'express';
import StatusCode from '@/utils/StatusCode';
import positionService from '@/service/positionService';
import errorCatch from '@/utils/errorCatch';
import { IPosition } from '@/types/types';

const positionController = {
  level: (req: Request, res: Response): Response => {
    const level: string = req.params.level;
    try {
      const position: IPosition = positionService.select(level);
      return res.status(StatusCode.OK.status).json(position);
    } catch (err: unknown) {
      return errorCatch(err, res);
    }
  },
  init: (req: Request, res: Response): Response => {
    const level: string = req.params.level;
    try {
      const positions: Array<IPosition> = positionService.init(level);
      return res.status(StatusCode.OK.status).json(positions);
    } catch (err: unknown) {
      return errorCatch(err, res);
    }
  },
};

export default positionController;
