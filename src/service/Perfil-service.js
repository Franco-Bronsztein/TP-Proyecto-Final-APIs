import PerfilRepository from '../repository/Perfil-Repository.js';

export default class PerfilService {
    constructor() {
        this.repo = new PerfilRepository();
    }

    getByIdAsync = async (id) => {
        const perfil = await this.repo.getByIdAsync(id);
        return perfil;
    }
}
