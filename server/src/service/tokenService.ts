import { JWT_ACCESS, JWT_REFRESH } from "@/constants/constant"
import { JwtPayload, sign, verify } from "jsonwebtoken";;

const tokenService = {
    createAccess: (idx: number, id: string): string => {
        if (!idx) {
            throw new Error('IDX IS NOT VALID')
        }
        if (!id) {
            throw new Error('ID IS NOT NALID')
        }
        return sign(
            {
                idx,
                id,
            },
            JWT_ACCESS!,
            {
                expiresIn: '1m'
            }
        )
    },
    createRefresh: (idx: number, id: string): string => {
        if (!idx) {
            throw new Error('IDX IS NOT VALID')
        }
        if (!id) {
            throw new Error('ID IS NOT NALID')
        }
        return sign(
            {
                idx,
                id,
            },
            JWT_REFRESH!,
            {
                expiresIn: '15d'
            }
        )
    },
    validate: (token: string): void => {
        if (!token) {
            throw new Error('TOKEN IS NOT FOUND')
        }
    },
    verifyAccess: () => { },
    verifyRefresh: (token: string): JwtPayload => {
        try {
            return verify(token, JWT_REFRESH!) as JwtPayload;
        } catch (err: unknown) {
            throw new Error('REFRESH TOKEN IS EXPIRE')
        }
    }
}

export default tokenService