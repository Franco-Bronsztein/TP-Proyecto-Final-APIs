import DBConfig from '../configs/db-configs.js';
import pkg from 'pg';

const { Client } = pkg;

export default class PerfilRepository {
    getByIdAsync = async (id) => {
        let perfil = null;
        const client = new Client(DBConfig);
        try {
            await client.connect();
            const sql = 'SELECT * FROM public.usuario WHERE id = $1';
            const result = await client.query(sql, [id]);
            await client.end();
            if (result.rows.length > 0) {
                perfil = result.rows[0];
            }
        } catch (error) {
            console.error(error);
        }
        return perfil;
    }
}
