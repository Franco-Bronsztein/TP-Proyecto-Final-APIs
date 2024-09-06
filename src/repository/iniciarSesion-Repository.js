import DBConfig from '../configs/db-configs.js';
import pkg from 'pg';

const { Client } = pkg;

export default class iniciarSesionRepository {
    getUserByUsernameAsync = async (username) => {
        let returnArray = [];
        const client = new Client(DBConfig);
        try {
            await client.connect();
            const result = await client.query(`SELECT * FROM public.usuario WHERE username = $1`, [username]);
            returnArray = result.rows;
        } catch (error) {
            console.log(error);
        } finally {
            await client.end();
        }
        return returnArray;
    }
}
