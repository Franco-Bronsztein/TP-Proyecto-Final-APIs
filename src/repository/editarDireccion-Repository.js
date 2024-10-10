import DBConfig from '../configs/db-configs.js';
import pkg from 'pg';

const { Client } = pkg;

export default class editarDireccionRepository {
    editarDireccionAsync = async (direccionData) => {
        let returnArray = null;
        const client = new Client(DBConfig);
        try {
            await client.connect();
            const sql = `
            UPDATE public."direccion"
            SET "pais" = $1, 
                "ciudad" = $2, 
                "calle" = $3, 
                "detalle" = $4,
                "referencia" = $5,
            WHERE "idusuario" = $6;
            `;

            const values = [
                direccionData.pais, 
                direccionData.ciudad, 
                direccionData.calle, 
                direccionData.detalle, 
                direccionData.idetiqueta,
                direccionData.referencia,
                direccionData.idusuario
            ];

            const result = await client.query(sql, values);
            await client.end();
            returnArray = result.rows;
        } catch (error) {
            console.log(error);
        }
        return returnArray;
    };
}


/*

{
    "pais" : "argentina",
   "ciudad" : "ddd",
"calle" : "ddd",
 "detalle" : "ffff", 
          "referencia" : "ddddd",
                "idusuario" : 2,
}

*/