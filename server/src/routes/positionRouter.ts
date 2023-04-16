import { Router } from 'express';
import positionController from '@/controllers/positionController';

const positionRouter: Router = Router();

positionRouter //
  .route('/positions/:level')
  .get(positionController.level);
positionRouter //
  .route('/positions/:level/init')
  .get(positionController.init);

export default positionRouter;
