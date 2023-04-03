import User from "@/models/User";
import { IUser } from "@/types/types";
import { compare, genSalt, hash } from "bcrypt";

const userService = {
    checkDuplicatedID: async (id: string): Promise<void> => {
        if (!id) {
            throw new Error('is No id in body')
        }
        const user: IUser = await User.findUserById(id);
        if (user) {
            throw new Error('user already is exist');
        }
    },
    signup: async ({ id, password }: IUser): Promise<void> => {
        if (!id) {
            throw new Error('ID IS INVALID');
        }
        if (!password) {
            throw new Error('PASSWORD IS INVALID');
        }
        const salt: string = await genSalt(10);
        const hashed: string = await hash(password, salt);
        const user: IUser = {
            id: id,
            password: hashed
        };
        await User.signup(user);
    },
    findUserById: async (id: string): Promise<IUser> => {
        if (!id) {
            throw new Error(`ID IS INVALID`);
        }
        const user: IUser = await User.findUserById(id);
        if (!user) {
            throw new Error('USER NOT FOUND')
        }
        return user;
    },
    checkPassword: async (userPassword: string, dbPassword: string): Promise<void> => {
        if (!userPassword) {
            throw new Error('PASSWORD IS INVALID')
        }
        if (!dbPassword) {
            throw new Error('DB PASSWORD IS INVALID')
        }
        const validated: boolean = await compare(userPassword, dbPassword);
        if (!validated) {
            throw new Error('PASSWORD IS INVALID')
        }
    }
}

export default userService;