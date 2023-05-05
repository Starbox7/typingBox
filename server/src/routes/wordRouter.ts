import { Router } from 'express';
import wordController from '@/controllers/wordController';

const wordRouter: Router = Router();

wordRouter //
  .route('/words')
  .get(wordController.select)
  .post(wordController.insert);
wordRouter //
  .route('/words/init')
  .get(wordController.init);

export default wordRouter;
