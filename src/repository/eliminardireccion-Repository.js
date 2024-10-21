import DBConfig from '../configs/db-configs.js';
import pkg from 'pg';

const { Client } = pkg;

export default class eliminarReseñaRepository {
    eliminarDireccionAsync = async (id, idUsuario) => {
        let success = false; 
        const client = new Client(DBConfig);
        try {
            await client.connect();
            console.log('Conectado a la base de datos');
            
            const sql = 'DELETE FROM direccion WHERE id = $1 AND idusuario = $2'; 
            const values = [id, idUsuario];

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
