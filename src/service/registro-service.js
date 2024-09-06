import registroRepository from '../repository/registro-Repository.js';
import { SMTPClient } from 'smtp-client';

export default class registroService {
    registrarAsync = async (registroInfo) => {
        const repo = new registroRepository();

        // Verificar si el email ya está registrado
        const emailExistente = await repo.verificarEmailAsync(registroInfo.mail);
        if (emailExistente) {
            return { error: 'El email ya está registrado' };
        }

        // Verificar si el username ya está registrado
        const usernameExistente = await repo.verificarUsernameAsync(registroInfo.username);
        if (usernameExistente) {
            return { error: 'El nombre de usuario ya está registrado' };
        }

        // Registrar el nuevo usuario
        const result = await repo.registrarseAsync(registroInfo);

        if (result) {
            // Si el registro fue exitoso, enviar un correo de bienvenida
            await this.enviarCorreoRegistro(registroInfo.mail);
        }

        return result;
    };

    enviarCorreoRegistro = async (correoUsuario) => {
        const client = new SMTPClient({
            host: 'smtp.gmail.com',
            port: 465,
            secure: true,
            timeout: 60000,
        });

        try {
            await client.connect();
            await client.greet({ hostname: 'localhost' });
            await client.authLogin({
                username: 'francobronsztein@gmail.com',
                password: 'mhpa icuc tzlm jrid',
            });
            await client.mail({ from: 'francobronsztein@gmail.com' });
            await client.rcpt({ to: correoUsuario });
            await client.data(`Subject: ¡Bienvenido a nuestra app!\nTo: ${correoUsuario}\nContent-Type: text/html; charset=utf-8\n\n<h1>¡Bienvenido!</h1><p>Gracias por registrarte en nuestra aplicación. Estamos encantados de tenerte con nosotros!!</p>`);
            await client.quit();
            console.log('Correo enviado con éxito a:', correoUsuario);
        } catch (error) {
            console.error('Error al enviar el correo:', error);
        }
    };
}
