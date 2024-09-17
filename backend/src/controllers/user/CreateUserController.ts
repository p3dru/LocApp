import { Request, Response } from 'express';
import { CreateUserService } from '../../services/user/CreateUserService'

class CreateUserController {
    async handle(req: Request, res: Response) {
        const { name, email, password, role } = req.body;

        const createUserService = new CreateUserService();

        console.log(req.file)

        const { originalname, filename: image } = req.file;

        const user = await createUserService.execute({
            name,
            email,
            password,
            image,
            role,
        });

        return res.json(user);
    }
}

export { CreateUserController }