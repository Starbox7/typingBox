import userController from "@/controllers/userController";
import { Router } from "express";

const userRouter: Router = Router();

userRouter
    .route('/users/signup')
    .post(userController.signup);
userRouter
    .route('/users/signin')//
    .get(userController.auto)
    .post(userController.signin)

export default userRouter;