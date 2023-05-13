import userController from '@/controllers/userController';
import { Auth } from '@/middleware/Auth';
import { Router } from 'express';

const userRouter: Router = Router();

userRouter.route('/users/signup').post(userController.signup);
userRouter
  .route('/users/signin') //
  .get(userController.auto)
  .post(userController.signin);

userRouter.route('/ping').all(Auth.checkAccess, Auth.checkRefresh);
userRouter.route('/ping').all((req, res) => res.json('pong'));

export default userRouter;
