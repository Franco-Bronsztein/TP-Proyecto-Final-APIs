import editarPerfilRepository from '../repository/editarPerfil-Repository.js';

export default class editarPerfilService {
    editarPerfilAsync = async (userData) => {
        const repo = new editarPerfilRepository();
        const result = await repo.editarPerfilAsync(userData);
        return result;
    };
}
