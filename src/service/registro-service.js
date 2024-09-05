import registroRepository from '../repository/registro-Repository.js';
import { SMTPClient } from 'smtp-client'; // Importa smtp-client

export default class registroService {
    registrarAsync = async (registroInfo) => {
        const repo = new registroRepository();
        const result = await repo.registrarseAsync(registroInfo);

        if (result) {
            // Si el registro fue exitoso, enviar un correo de bienvenida
            await this.enviarCorreoRegistro(registroInfo.mail);
        }

        return result;
    };

    // Función para enviar el correo de bienvenida
    enviarCorreoRegistro = async (correoUsuario) => {
        const client = new SMTPClient({
            host: 'smtp.gmail.com', // Servidor SMTP de Gmail
            port: 465, // Puerto SMTP para SSL
            secure: true, // `true` para conexiones SSL/TLS
            timeout: 60000, 
        });

        try {
            await client.connect();
            await client.greet({ hostname: 'localhost' }); // Puede ser tu dominio o 'localhost'
            await client.authLogin({
                username: 'francobronsztein@gmail.com', // Tu dirección de correo electrónico de Gmail
                password: 'mhpa icuc tzlm jrid', // Contraseña o contraseña de aplicación
            });
            await client.mail({ from: 'francobronsztein@gmail.com' }); // Dirección desde la cual envías el correo
            await client.rcpt({ to: correoUsuario }); // Dirección del destinatario
            await client.data(`Subject: ¡Bienvenido a nuestra app!\nTo: ${correoUsuario}\nContent-Type: text/html; charset=utf-8\n\n<h1>¡Bienvenido!</h1><p>Gracias por registrarte en nuestra aplicación. Estamos encantados de tenerte con nosotros!!</p>`);
            await client.quit();
            console.log('Correo enviado con éxito a:', correoUsuario);
        } catch (error) {
            console.error('Error al enviar el correo:', error);
        }
    };
}
