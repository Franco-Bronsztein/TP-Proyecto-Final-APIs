import DBConfig from '../configs/db-configs.js';
import pkg from 'pg';

const { Client } = pkg;

export default class iniciarSesionRepository {
    getByUserNameAndPasswordAsync = async (username, password) => {
        let returnArray = null;
        const client = new Client(DBConfig);
        username = "'" + username + "'" ;
        password = "'" + password + "'";
        try {
            await client.connect();
            //const values = [username, password];
            const result = await client.query(`SELECT * FROM usuario WHERE username = $1 AND contraseÃ±a = $2`,[username, password]);
            await client.end();
            returnArray = result.rows;
        } catch (error) {
            console.log(error);
        }
        return returnArray;
    }
}
