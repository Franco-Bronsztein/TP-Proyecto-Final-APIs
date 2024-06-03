export default class Usuario {
    constructor(id,nombre,direccion,foto,cantestrellas){
        this.id = id;
        this.nombre = nombre;
        this.direccoin = direccion;
        this.foto = foto;
        this.cantestrellas = cantestrellas;
    }
    toString() {
        return `Nombre: ${this.nombre}, Id: ${this.id}, Direccion: ${this.direccion}, Foto: ${this.foto}, Cantestrellas: ${this.cantestrellas}`
    }
}