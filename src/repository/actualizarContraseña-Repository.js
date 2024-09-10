import DBConfig from '../configs/db-configs.js';
import pkg from 'pg';

const { Client } = pkg;

export default class registroRepository {
    checkUserExistsAsync = async (mail) => {
        const client = new Client(DBConfig);
        let user = null;
        try {
            await client.connect();
            const sql = 'SELECT * FROM public."usuario" WHERE mail = $1';
            const result = await client.query(sql, [mail]);
            user = result.rows[0];
        } catch (error) {
            console.error(error);
        } finally {
            await client.end();
        }
        return user;
    };

    newPasswordUpdaterAsync = async (newPassword) => {
        const client = new Client(DBConfig);
        let success = false;
        try {
            await client.connect();
            const sql = 'UPDATE public."usuario" SET "password" = $1 WHERE mail = $2';
            const result = await client.query(sql, [newPassword.password, newPassword.mail]);
            success = result.rowCount > 0;
        } catch (error) {
            console.error(error);
        } finally {
            await client.end();
        }
        return success;
    };
}



/*

{
    "mail": "francobronsztein@gmail.com"
    "password": "Franco1233456"
}

*/