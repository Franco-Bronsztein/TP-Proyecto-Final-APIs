import recuperarContraseñaRepository from '../repository/actualizarContraseña-Repository.js';

export default class actualizarContraseñaService {
    checkUserExistsAsync = async (mail) => {
        const repo = new recuperarContraseñaRepository();
        const user = await repo.checkUserExistsAsync(mail);
        return user !== null;
    };

    newPasswordUpdaterAsync = async (newPassword) => {
        const repo = new recuperarContraseñaRepository();
        const result = await repo.newPasswordUpdaterAsync(newPassword);
        return result;
    };
}
