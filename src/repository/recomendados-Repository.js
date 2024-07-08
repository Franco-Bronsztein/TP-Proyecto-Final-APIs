import DBConfig from '../configs/db-configs.js'
import pkg from 'pg'


const { Client, Pool } = pkg;

export default class recomendadosRepository {
    getByIdAsync = async (idusuario) => {
        let returnArray = null;
        const client = new Client(DBConfig);
        try {
            await client.connect();
            const sql = `SELECT L.nombre, L.direccion, L.foto, L.cantestrellas 
            FROM local L 
            JOIN public."Recomendados" R ON L.id = R.idlocal 
            WHERE R.idusuario = 1;`;
            const values = [idusuario]
            console.log(values)
            const result = await client.query(sql,values);
            await client.end();
            returnArray = result.rows;
            console.log(result)
        } catch (error) {
            console.log(error);
        }
        return returnArray;
    } 
}
