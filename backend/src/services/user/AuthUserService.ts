import prismaClient from '../../prisma';
import { compare } from "bcryptjs";
import { sign } from "jsonwebtoken";

interface AuthRequest {
    email: string;
    password: string;
}

class AuthUserService {
    async execute({ email, password }: AuthRequest) {

        // Verificar se a matrícula existe.
        const user = await prismaClient.user.findFirst({
            where: {
                email: email
            }
        });

        if (!user) {
            throw new Error("User/password incorrect");
        }

        // Verificar se a senha está correta.
        const passwordMatch = await compare(password, user.password);

        if (!passwordMatch) {
            throw new Error("User/password incorrect");
        }

        // geração de token JWT e devolver os dados do usuário 
        // id, name, email, registration, address, phone, genery
        const token = sign({
            name: user.name,
            email: user.email,
        },
            process.env.JWT_SECRET,
            {
                subject: user.id,
                expiresIn: '30d'
            }
        );

        return {
            id: user.id,
            name: user.name,
            email: user.email,
            image: user.image,
            role: user.role,
            token: token
        };
    }
}

export { AuthUserService }