import DBConfig from '../configs/db-configs.js'
import pkg from 'pg'


const { Client, Pool } = pkg;

export default class ProductosRepository {
    getByIdAsync = async (id) => {
        let returnArray = null;
        const client = new Client(DBConfig);
        try {
            await client.connect();
            const sql = `SELECT * FROM public."productos" WHERE idlocal = $1`;
            const values = [id]
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
