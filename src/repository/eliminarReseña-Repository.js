import DBConfig from '../configs/db-configs.js';
import pkg from 'pg';

const { Client } = pkg;

export default class eliminarReseñaRepository {
    eliminarReseñaAsync = async (idReseña) => {
        let success = false; 
        const client = new Client(DBConfig);
        try {
            await client.connect();
            console.log('Conectado a la base de datos');
            
            const sql = 'DELETE FROM reseña WHERE id = $1'; // Corrección de la consulta SQL
            const values = [idReseña];

            const result = await client.query(sql, values);
            console.log(`Resultado de la consulta: ${result.rowCount} filas afectadas`); // Corrección de la cadena

            success = result.rowCount > 0;
        } catch (error) {
            console.log('Error en la consulta SQL:', error);
        } finally {
            await client.end();  
        }
        
        return success; 
    }
}
