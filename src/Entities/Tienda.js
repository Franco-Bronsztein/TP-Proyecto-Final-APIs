export default class Tienda {
    constructor(id, nombre, direccion, foto, cantestrellas){
        this.id = id;
        this.nombre = nombre;
        this.direccion = direccion; 
        this.foto = foto;
        this.cantestrellas = cantestrellas;
    }

    toString() {
        return `Nombre: ${this.nombre}, Id: ${this.id}, Dirección: ${this.direccion}, Foto: ${this.foto}, Cantestrellas: ${this.cantestrellas}`;
    }
}