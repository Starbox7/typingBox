import userController from "@/controllers/userController";
import { Router } from "express";

const userRouter: Router = Router();

userRouter
    .route('/users/signup')
    .post(userController.signup);

export default userRouter;