export default class Tienda {
    constructor(id, nombre, direccion, foto, cantestrellas, confiteria){
        this.id = id;
        this.nombre = nombre;
        this.direccion = direccion; 
        this.foto = foto;
        this.cantestrellas = cantestrellas;
        this.confiteria = confiteria;
    }

    toString() {
        return `Nombre: ${this.nombre}, Id: ${this.id}, Dirección: ${this.direccion}, Foto: ${this.foto}, Cantestrellas: ${this.cantestrellas} , Confiteria: ${this.confiteria}`;
    }
}