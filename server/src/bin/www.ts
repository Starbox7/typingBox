import { SERVER_PORT, SERVER_URL } from '@/constants/constant';
import server from '@/server';

server.listen(parseInt(SERVER_PORT!), SERVER_URL!)