import DBConfig from '../configs/db-configs.js';
import pkg from 'pg';

const { Client } = pkg;

export default class iniciarSesionRepository {
    getByUserNameAndPasswordAsync = async (username, password) => {
        let returnArray = null;
        const client = new Client(DBConfig);
        //username = "'" + username + "'" ;
        //password = "'" + password + "'";  
        try {
            await client.connect();
            console.log(username,password)
            //const values = [username, password];
            const result = await client.query(`SELECT * FROM public.usuario WHERE username = $1 AND password = $2`,[username, password]);
            await client.end();
            returnArray = result.rows;
            console.log(result)
        } catch (error) {
            console.log(error);
        }
        return returnArray;
    }
}
