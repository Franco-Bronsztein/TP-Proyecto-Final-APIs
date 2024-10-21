import DBConfig from '../configs/db-configs.js';
import pkg from 'pg';

const { Client } = pkg;

export default class eliminarReseñaRepository {
    eliminarReseñaAsync = async (comentario, idUsuario) => {
        let success = false; 
        const client = new Client(DBConfig);
        try {
            await client.connect();
            console.log('Conectado a la base de datos');
            
            const sql = 'DELETE FROM reseña WHERE comentario = $1 AND idusuario = $2'; // Ajuste en la consulta SQL
            const values = [comentario, idUsuario];

            const result = await client.query(sql, values);
            console.log(`Resultado de la consulta: ${result.rowCount} filas afectadas`);

            success = result.rowCount > 0;
        } catch (error) {
            console.log('Error en la consulta SQL:', error);
        } finally {
            await client.end();  
        }
        
        return success; 
    }
}

/*
{
    "userId": 3,      
    "pais": "Argentina",
    "ciudad": "Buenos Aires",
    "calle": "Bucarelli",
    "referencia": "1er Piso",
    "detalledeentrega": "1"

}
*/