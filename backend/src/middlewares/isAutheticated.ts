import { Request, Response, NextFunction } from 'express';
import { verify } from 'jsonwebtoken';
import prisma from '../prisma';

interface Payload {
    sub: string;

}

export function isAuthenticated(
    req: Request,
    res: Response,
    next: NextFunction
) {
    // recebimento do token
    const authToken = req.headers.authorization;

    if (!authToken) {
        return res.status(400).end();
    }


    const [, token] = authToken.split(" ");

    try {
         // validar token
         const { sub } = verify(
            token,
            process.env.JWT_SECRET
         ) as Payload;

        // Recuperar o id do token 
        req.user_id = sub;
        
        return next();

    } catch (err) {
        return res.status(401).end();
    }
}


// Middleware para verificar se o usuário é administrador
export async function isAdmin(
    req: Request,
    res: Response,
    next: NextFunction
) {
    // Verifica se o usuário está autenticado
    isAuthenticated(req, res, async () => {
        try {
            // Recuperar o ID do usuário a partir do token
            const userId = req.user_id;

            // Consultar o banco de dados para obter o papel do usuário
            const user = await prisma.user.findUnique({
                where: { id: userId },
                select: { role: true }
            });

            if (!user) {
                return res.status(404).json({ error: "Usuário não encontrado" });
            }

            // Verificar se o papel do usuário é "ADMIN"
            if (user.role !== 'ADMIN') {
                return res.status(403).json({ error: "Acesso negado, apenas para administrador." });
            }

            // Se for admin, permitir a continuação da requisição
            return next();
        } catch (err) {
            return res.status(500).json({ error: "Erro interno do servidor" });
        }
    });
}