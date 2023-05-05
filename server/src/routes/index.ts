import { Router } from 'express';
import userRouter from './userRouter';
import positionRouter from './positionRouter';
import wordRouter from './wordRouter';
import shortRouter from './shortRouter';

const router: Router = Router();

router.use(userRouter);
router.use(positionRouter);
router.use(wordRouter);
router.use(shortRouter);

export default router;
