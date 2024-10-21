import DBConfig from '../configs/db-configs.js';
import pkg from 'pg';

const { Client } = pkg;

export default class guardarDireccionRepository {
    guardarDireccion = async (pais, ciudad, calle, referencia, detalledeentrega, userId) => {
        let returnArray = null;
        const client = new Client(DBConfig);
        try {
            await client.connect();
            
            // Incluir el userId en el INSERT
            const sql = `INSERT INTO public."direccion"(
                "pais", "ciudad", "calle", "referencia", "detalle", "idusuario") 
                VALUES ($1, $2, $3, $4, $5, $6) RETURNING *`;
                
            const values = [pais, ciudad, calle, referencia, detalledeentrega, userId]; 
            
            const result = await client.query(sql, values); 
            await client.end();
            
            returnArray = result.rows;
        } catch (error) {
            console.log('Error en guardarDireccion:', error);
        }
        return returnArray;
    };
}


/*

{
    "userId": 3,      
    "pais": "Argentina",
    "ciudad": "Buenos Aires",
    "calle": "Bucarelli",
    "referencia": "1er Piso",
    "detalle": "Piso 12"
}  

*/