import DBConfig from '../configs/db-configs.js'
import pkg from 'pg'


const { Client, Pool } = pkg;

export default class direccionRepository {
    getByIdAsync = async (idusuario) => {
        let returnArray = null;
        const client = new Client(DBConfig);
        console.log(idusuario)
        try {
            await client.connect();
            const sql = `SELECT ubicacion FROM direccion         WHERE idusuario = $1`;
            const values = [idusuario]
            console.log(values)
            const result = await client.query(sql,values);
            await client.end();
            returnArray = result.rows;
            console.log(returnArray)
        } catch (error) {
            console.log(error);
        }
        return returnArray;
    } 
}
