import express, { Express, urlencoded, json } from 'express';
import morgan from 'morgan';
import cors from 'cors';
import router from './routes';

const server: Express = express();

server.use(json());
server.use(urlencoded({ extended: true }));
server.use(morgan("dev"));
server.use(cors());

server.use(router);

export default server;