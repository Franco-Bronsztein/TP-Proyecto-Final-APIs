import recuperarContraseñaRepository from '../repository/actualizarContraseña-Repository.js';

export default class registroService {
    newPasswordUpdaterAsync = async (newPassword) => {
        const repo = new recuperarContraseñaRepository();
        const result = await repo.newPasswordUpdaterAsync(newPassword);
        return result;
    };
}
