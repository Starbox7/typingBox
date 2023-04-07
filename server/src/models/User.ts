import { db } from '@/config/db';
import quries from '@/sql';
import { IUser } from '@/types/types';
import { QuerySyntexError } from '@/utils/Error';

const User = {
  findUserById: async (id: string): Promise<IUser> => {
    try {
      const [result]: Array<IUser> = await db.query(quries.user.findUserBYId, [id]);
      return result;
    } catch (err: unknown) {
      throw new QuerySyntexError('sql Error');
    }
  },
  signup: async ({ id, password }: IUser): Promise<void> => {
    try {
      await db.execute(quries.user.signup, [id, password]);
    } catch (err: unknown) {
      throw new QuerySyntexError('SQL Error');
    }
  },
};
export default User;
