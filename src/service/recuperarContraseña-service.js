import recuperarContraseñaRepository from '../repository/recuperarContraseña-Repository.js';

export default class iniciarsesionService {
    getPaswwordOfuserAsync = async (mail) => {
        const repo = new recuperarContraseñaRepository();
        const returnArray = await repo.getPaswwordOfuserAsync(mail);
        return returnArray;
    }
}
