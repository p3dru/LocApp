import express, { Request, Response, NextFunction } from "express";

import 'express-async-errors';
import compression from 'compression';
import cors from 'cors';
import path from "path";

import { router } from './routers';


const app = express();

// Tipo de dados
app.use(express.json());

// Receber requisições de qualquer IP ou Url
app.use(cors());

// Compressão dos dados
app.use(compression());

// Rotas
app.use(router);

// View images
app.use(
    '/files',
    express.static(path.resolve(__dirname, '..', 'tmp'))
);

// Tratamento de erros 
app.use((err: Error, req: Request, res: Response, next: NextFunction) => {
    if(err instanceof Error){
        // Se for uma instância do tipo error;
        return res.status(400).json({
            error: err.message
        });
    }

    return res.status(500).json({
        status: 'error',
        message: 'Internal server error'
    });
});

app.listen(process.env.PORT, () => console.log('Servidor online...'));