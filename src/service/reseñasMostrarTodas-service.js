import mostrarReseñasRepository from '../repository/mostrarReseñas-Repository.js'

export default class reseñasMostrarService{
    getByIdAsync = async (idlocal) => {
        const repo = new mostrarReseñasRepository();
        const returnArray = await repo.getByIdAsync(idlocal);
        return returnArray;
    }
}