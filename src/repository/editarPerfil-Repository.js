import DBConfig from '../configs/db-configs.js';
import pkg from 'pg';

const { Client } = pkg;

export default class editarPerfilRepository {
    editarPerfilAsync = async (userData) => {
        let returnArray = null;
        const client = new Client(DBConfig);
        try {
            await client.connect();
            const sql = `UPDATE public."usuario"
                         SET "nombre" = $1, "apellido" = $2, "telefono" = $3, "password" = $4, "vendedor" = $5, "username" = $6, "fechaNac" = $7, "fotoPerfil" = $8
                         WHERE "mail" = $9;`;
            const values = [userData.nombre, userData.apellido, userData.telefono, userData.password, userData.vendedor, userData.username, userData.fechaNac, userData.fotoPerfil, userData.mail];
            const result = await client.query(sql, values);
            await client.end();
            returnArray = result.rowCount; // número de filas actualizadas
        } catch (error) {
            console.log(error);
        }
        return returnArray;
    };
}
