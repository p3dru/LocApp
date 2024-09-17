import prismaClient from "../../prisma";
import { hash } from "bcryptjs";

interface UserRequest {
    user_id: string;
    name: string;
    email: string;
    password: string;
    image: string | null;

}


class UpdateUserService {
    async execute({user_id, name, email, password, image}: UserRequest){

        const passwordHash = await hash(password, 8);

        const user = await prismaClient.user.update({
            where:{
                id: user_id
            },
            data: {
                name: name,
                email:email,
                password:passwordHash,
                image:image
            },
            select:{
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

export { UpdateUserService }