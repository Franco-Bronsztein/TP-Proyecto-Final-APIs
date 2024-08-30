import iniciarSesionRepository from '../repository/iniciarSesion-Repository.js';

export default class iniciarsesionService {
    getByUserNameAndPasswordAsync = async (username, password) => {
        const repo = new iniciarSesionRepository();
        const returnArray = await repo.getByUserNameAndPasswordAsync(username, password);
        return returnArray;
    }
}
