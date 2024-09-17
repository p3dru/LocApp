import { Router } from 'express';
import multer from 'multer';

import { CreateUserController } from './controllers/user/CreateUserController';
import { AuthUserController } from './controllers/user/AuthUserController';
import { DetailUserController } from './controllers/user/DetailUserController';


import { isAuthenticated } from "./middlewares/isAutheticated";
import { UpdateUserController } from './controllers/user/UpdateUserController';

import uploadConfig from './config/multer';


const router = Router();

const upload = multer(uploadConfig.upload("./tmp"));

// ROTAS USER 

// cadastro do usuário
router.post('/users', upload.single('file'), new CreateUserController().handle);
// login do usuário
router.post('/session', new AuthUserController().handle);
// detalhes do usuário - perfil
router.get('/me', isAuthenticated, new DetailUserController().handle);
// atualizar dados do usuário
router.put('/me', isAuthenticated, upload.single('file'),  new UpdateUserController().handle);


// ROTAS ARQUIVOS ESTÁTICOS
// /files/nome_do_arquivo
export { router };