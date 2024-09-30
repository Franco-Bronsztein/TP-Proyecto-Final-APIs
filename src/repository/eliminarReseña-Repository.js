import DBConfig from '../configs/db-configs.js';
import pkg from 'pg';

const { Client } = pkg;

export default class eliminarReseñaRepository {
    eliminarReseñaAsync = async (idUsuario) => {
        let success = false; 
        const client = new Client(DBConfig);
        try {
            await client.connect();
            console.log('Conectado a la base de datos');
            const sql = `DELETE FROM reseña WHERE idUsuario = $1`;  // Verificar que este campo existe en tu tabla
            const values = [idUsuario];
            const result = await client.query(sql, values);
            console.log(`Resultado de la consulta: ${result.rowCount} filas afectadas`);
            success = result.rowCount > 0;  // rowCount indica cuántas filas se eliminaron
        } catch (error) {
            console.log('Error en la consulta SQL:', error);
        } finally {
            await client.end();  
        }
        return success;  // Retorna true si eliminó al menos una fila
    }
}
