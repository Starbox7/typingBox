import tokenService from "@/service/tokenService";
import userService from "@/service/userService";
import { IUser } from "@/types/types";
import StatusCode from "@/utils/StatusCode";
import { Response, Request } from "express";
import { JwtPayload } from "jsonwebtoken";

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
    },
    signin: async (req: Request, res: Response): Promise<Response> => {
        const { id, password }: IUser = req.body;
        try {
            const find: IUser = await userService.findUserById(id);
            await userService.checkPassword(password, find.password);
            const newAccessToken = tokenService.createAccess(find.idx!, find.id);
            const newRefreshToken = tokenService.createRefresh(find.idx!, find.id);
            return res.status(StatusCode.OK.status).json({
                ...StatusCode.OK,
                accessToken: newAccessToken,
                refreshToken: newRefreshToken
            });
        } catch (err: unknown) {
            return res.status(StatusCode.SERVER_ERROR.status).json({
                ...StatusCode.SERVER_ERROR,
                err: `${err}`
            });
        }
    },
    auto: async (req: Request, res: Response): Promise<Response> => {
        const refreshToken: string = req.get('refreshToken') ?? '';
        try {
            tokenService.validate(refreshToken);
            const { idx, id }: JwtPayload = tokenService.verifyRefresh(refreshToken);
            await userService.findUserById(id);
            const newAccessToken = tokenService.createAccess(idx, id);
            const newRefreshToken = tokenService.createRefresh(idx, id);
            return res.status(StatusCode.OK.status).json({
                ...StatusCode.OK,
                accessToken: newAccessToken,
                refreshToken: newRefreshToken
            });
        } catch (err: unknown) {
            console.error(err);
            return res.status(StatusCode.SERVER_ERROR.status).json({
                ...StatusCode.SERVER_ERROR,
                err: `${err}`
            });
        }
    }
}

export default userController;