import DBConfig from '../configs/db-configs.js';
import pkg from 'pg';

const { Client } = pkg;

export default class editarPerfilRepository {
    editarPerfilAsync = async (userData) => {
        let returnArray = null;
        const client = new Client(DBConfig);
        try {
            await client.connect();
            console.log(userData)
            const sql = `UPDATE public."usuario"
            SET "nombre" = '${userData.nombre}', "apellido" = '${userData.apellido}', "telefono" = ${userData.telefono}, "password" = '${userData.password}', "vendedor" = ${userData.vendedor}, "username" = '${userData.username}', "fechaNac" = '${userData.fechaNac}', "fotoPerfil" = '${userData.fotoPerfil}', "mail" = '${userData.mail}'
            WHERE "id"= ${userData.id} ;`
            const result = await client.query(sql);
            await client.end();
            returnArray = result.rows;
        } catch (error) {
            console.log(error);
        }
        return returnArray;
    };
}
