import DBConfig from '../configs/db-configs.js'
import pkg from 'pg'


const { Client, Pool } = pkg;

export default class registroRepository {
    registrarseAsync = async (registroInfo) => {
        let returnArray = null;
        const client = new Client(DBConfig);
        try {
            await client.connect();
            const sql = `INSERT INTO public."usuario"(
                "nombre", "apellido", "telefono", "mail","password","username","vendedor","fechaNac") VALUES ('${registroInfo.nombre}','${registroInfo.apellido}',${registroInfo.telefono},'${registroInfo.mail}','${registroInfo.password}','${registroInfo.username}',${registroInfo.vendedor},'${registroInfo.fechaNac}')`;
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