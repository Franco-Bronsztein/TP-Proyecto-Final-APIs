import DBConfig from '../configs/db-configs.js';
import pkg from 'pg';

const { Client } = pkg;

export default class mostrarReseñasRepository {
    getByIdAsync = async (idlocal) => {
        let returnArray = null;
        const client = new Client(DBConfig);
        try {
            await client.connect();
            const sql = `SELECT * FROM reseña WHERE idLocal = $1`;
            const values = [idlocal];
            const result = await client.query(sql, values);
            returnArray = result.rows;
        } catch (error) {
            console.log('Error en la consulta:', error);
        } finally {
            await client.end();  // Asegurarse de cerrar la conexión en el bloque finally
        }
        return returnArray;
    }
}
