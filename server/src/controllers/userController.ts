import userService from "@/service/userService";
import { IUser } from "@/types/types";
import StatusCode from "@/utils/StatusCode";
import { Response, Request } from "express";

const userController = {
    signup: async (req: Request, res: Response): Promise<Response> => {
        const { id, password }: IUser = req.body;
        try {
            await userService.checkDuplicatedID(id);
            await userService.signup({ id, password });
            return res.status(StatusCode.CREATED.status).json(StatusCode.CREATED);
        } catch (err: unknown) {
            return res.status(StatusCode.SERVER_ERROR.status).json({
                ...StatusCode.SERVER_ERROR,
                err: `${err}`
            });
        }
    }
}

export default userController;