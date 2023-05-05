import { Router } from 'express';
// import shortController from

const shortRouter: Router = Router();

shortRouter //
  .route('shorts')
  .get(/** select */)
  .post(/** insert */);

shortRouter //
  .route('shorts')
  .get(/** select */);

export default shortRouter;
