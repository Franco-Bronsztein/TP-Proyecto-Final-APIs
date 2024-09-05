
import DBConfig from '../configs/db-configs.js';
import pkg from 'pg';

const { Client } = pkg;

export default class recuperarContraseñaRepository {
    getPaswwordOfuserAsync = async (mail) => {
        let returnArray = null;
        const client = new Client(DBConfig);
        try {
            await client.connect();
            const result = await client.query(`SELECT password FROM public.usuario WHERE mail = $1 `,[mail]);
            await client.end();
            returnArray = result.rows;
            console.log(result)
        } catch (error) {
            console.log(error);
        }
        return returnArray;
    }
}