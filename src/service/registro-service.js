import registroRepository from '../repository/registro-Repository.js'

export default class registroService {
    registrarAsync = async (registroInfo) => {
        const repo = new registroRepository();
        const result = await repo.registrarseAsync(registroInfo);
        return result;
    };
}