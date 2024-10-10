import direccionTodaRepository from '../repository/direccionToda-Repository.js'

export default class direccionTodaService{
    getByIdAsync = async (idusuario) => {
        const repo = new direccionTodaRepository();
        const returnArray = await repo.getByIdAsync(idusuario);
        return returnArray;
    }
}