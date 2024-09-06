import iniciarSesionRepository from '../repository/iniciarSesion-Repository.js';

export default class iniciarsesionService {
    getByUserNameAndPasswordAsync = async (username, password) => {
        const repo = new iniciarSesionRepository();
        const user = await repo.getUserByUsernameAsync(username);
        
        if (user.length === 0) {
            return { status: 'USER_NOT_FOUND' };
        }

        const isPasswordCorrect = user[0].password === password;

        if (isPasswordCorrect) {
            return { status: 'SUCCESS', user: user[0] };
        } else {
            return { status: 'INCORRECT_PASSWORD' };
        }
    }
}
