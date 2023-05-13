import shortController from '@/controllers/shortController';
import { Router } from 'express';
// import shortController from

const shortRouter: Router = Router();

shortRouter //
  .route('/shorts')
  .get(shortController.select)
  .post(shortController.insert);

shortRouter //
  .route('/shorts/init')
  .get(shortController.init);

export default shortRouter;
