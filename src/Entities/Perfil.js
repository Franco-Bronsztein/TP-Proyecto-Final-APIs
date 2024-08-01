export default class Perfil {
    constructor(id, nombre, apellido, telefono, mail, contrasena, vendedor) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.telefono = telefono;
        this.mail = mail;
        this.contrasena = contrasena;
        this.vendedor = vendedor;
    }

    toString() {
        return `Nombre: ${this.nombre}, Apellido: ${this.apellido}, Telefono: ${this.telefono}, Mail: ${this.mail}, Contraseña: ${this.contrasena}, Vendedor: ${this.vendedor}`;
    }
}
