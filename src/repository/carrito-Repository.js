import DBConfig from '../configs/db-configs.js'
import pkg from 'pg'


const { Client, Pool } = pkg;

export default class carritoRepository {
    getByIdAsync = async (idusuario) => {
        let returnArray = null;
        const client = new Client(DBConfig);
        try {
            await client.connect();
            const sql = `
            SELECT p.nombre,p.preciooriginal,p.precioxpagina,p.descripcion,p.cantdisponible
            FROM productos p
            JOIN public."carrito" c ON p.id = c.idpaquete
            join public."usuario" u ON c.idusuario = u.id
            WHERE p.id = c.idpaquete AND u.id = c.idusuario and u.id = $1;`;
            const values = [idusuario]
            const result = await client.query(sql,values);
            await client.end();
            returnArray = result.rows;
        } catch (error) {
            console.log(error);
        }
        return returnArray;
    } 
}