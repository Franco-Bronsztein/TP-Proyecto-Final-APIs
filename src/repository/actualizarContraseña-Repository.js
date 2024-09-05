import DBConfig from '../configs/db-configs.js'
import pkg from 'pg'


const { Client, Pool } = pkg;

export default class registroRepository {
    newPasswordUpdaterAsync = async (newPassword) => {
        let returnArray = null;
        const client = new Client(DBConfig);
        try {
            await client.connect();
            const sql = `UPDATE public."usuario"
            SET "password" = '${newPassword.password}'
            WHERE "mail" = '${newPassword.mail}';`;
            const result = await client.query(sql);
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
    "mail": "francobronsztein@gmail.com"
    "password": "Franco1233456"
}

*/