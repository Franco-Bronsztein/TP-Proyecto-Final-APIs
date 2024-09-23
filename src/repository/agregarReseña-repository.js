import DBConfig from '../configs/db-configs.js';
import pkg from 'pg';

const { Client } = pkg;

export default class agregarAlCarritoRepository {
    agregarReseñaAsync = async (cantEstrellas, comentario, idUsuario, idLocal) => {
        let returnArray = null;
        comentario = "'" + comentario + "'"
        const client = new Client(DBConfig);
        try {
            await client.connect();

            const sql = `
                INSERT INTO public."reseña" ("idusuario", "idlocal", "comentario", "cantestrellas") 
                VALUES ($1, $2, $3, $4);
            `;
            const values = [idUsuario, idLocal, comentario, cantEstrellas]; 
            const result = await client.query(sql, values); 
            returnArray = result.rows; 
        } catch (error) {
            console.log('Error en la inserción de la reseña:', error);
        } finally {
            await client.end(); 
        }
        return returnArray;
    };
}



/*

{
    "idLocal" : 2,
    "idUsuario" :1,
    "cantEstrellas":2,
    "infoReseña" : "Esto es un ejemplo"
}

*/