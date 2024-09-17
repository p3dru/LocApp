import prismaClient from '../../prisma';
import { hash } from 'bcryptjs';

interface UserRequest {
    name: string;
    email: string;
    password: string;
    image: string | null;
    role: string | null;
}

class CreateUserService {
    async execute({ name, email, password, image, role }: UserRequest) {

        // verificar enviou um email

        if(!email){
            throw new Error("Email incorreto");
        }

        // Verificar se a matrícula já está cadastrada

        const userAlreadyExists = await prismaClient.user.findFirst({
            where: {
                email: email
            }
        });

        if(userAlreadyExists){
            throw new Error("User already exists");
        }

        // criptografar senha do usuário

        const passwordHash = await hash(password, 8);

        // Cria um usuário com o prismaClient

        const user = await prismaClient.user.create({
            data: {
                name: name,
                email: email,
                password: passwordHash,
                image: image,
                role: role
            },
            select: {
                id: true,
                name: true,
                email: true,
                image: true,
                role: true
            }
        });

        return user;
    }
}

export { CreateUserService }