import { Request, Response } from "express";
import { UpdateUserService } from "../../services/user/UpdateUserService";

class UpdateUserController {
    async handle(req: Request, res: Response) {
        const user_id = req.user_id;
        const { name, email, password } = req.body;

        const updateUserService = new UpdateUserService();

        const { originalname, filename: image } = req.file;

        const user = await updateUserService.execute({
            user_id,
            name,
            email,
            password,
            image
        });

        return res.json(user);

    }
}

export { UpdateUserController }