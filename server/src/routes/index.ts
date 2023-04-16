import { Router } from 'express';
import userRouter from './userRouter';
import positionRouter from './positionRouter';

const router: Router = Router();

router.use(userRouter);
router.use(positionRouter);

export default router;
