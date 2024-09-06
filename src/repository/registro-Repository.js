import DBConfig from '../configs/db-configs.js';
import pkg from 'pg';

const { Client } = pkg;

export default class registroRepository {
    // Método para verificar si un email ya está registrado
    verificarEmailAsync = async (email) => {
        const client = new Client(DBConfig);
        let existe = false;
        try {
            await client.connect();
            const sql = `SELECT COUNT(*) FROM public."usuario" WHERE "mail" = $1`;
            const result = await client.query(sql, [email]);
            existe = result.rows[0].count > 0;
        } catch (error) {
            console.error(error);
        } finally {
            await client.end();
        }
        return existe;
    };

    // Método para verificar si un username ya está registrado
    verificarUsernameAsync = async (username) => {
        const client = new Client(DBConfig);
        let existe = false;
        try {
            await client.connect();
            const sql = `SELECT COUNT(*) FROM public."usuario" WHERE "username" = $1`;
            const result = await client.query(sql, [username]);
            existe = result.rows[0].count > 0;
        } catch (error) {
            console.error(error);
        } finally {
            await client.end();
        }
        return existe;
    };

    // Método para registrar un usuario
    registrarseAsync = async (registroInfo) => {
        const client = new Client(DBConfig);
        let returnArray = null;
        try {
            await client.connect();
            const sql = `INSERT INTO public."usuario"(
                "nombre", "apellido", "telefono", "mail", "password", "username", "vendedor", "fechaNac") 
                VALUES ($1, $2, $3, $4, $5, $6, $7, $8)`;
            const result = await client.query(sql, [
                registroInfo.nombre,
                registroInfo.apellido,
                registroInfo.telefono,
                registroInfo.mail,
                registroInfo.password,
                registroInfo.username,
                registroInfo.vendedor,
                registroInfo.fechaNac
            ]);
            returnArray = result.rows;
        } catch (error) {
            console.error(error);
        } finally {
            await client.end();
        }
        return returnArray;
    };
}

/* 
{
    "nombre": "Valen",
    "apellido": "Vugin",
    "telefono": 541123417834,
    "mail": "valenvug@gmail.com",
    "password": "Valen1234",
    "username": "Valenvug",
    "vendedor": false,
    "fechaNac": "2024-09-03"
}
*/
