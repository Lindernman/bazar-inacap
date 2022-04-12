import db from '$lib/db';
import bcrypt from 'bcryptjs';

export async function post({ request }) {
	try {
		let { nombre, email, password, repassword, rut } = await request.json();

		if (password == repassword) {
			//sigue
		} else {
			// error
		}

		let salt = bcrypt.genSaltSync(10);
		let hash = bcrypt.hashSync(password, salt);
	
		let { rows } = await db.query(
			'INSERT INTO users (name, email, password,passport_id) SELECT $1,$2,$3,$4 RETURNING id',
			[nombre, email, hash, rut]
		);

		return { body: { hellow: { nombre, email, password, repassword } } };
	} catch (error) {
		return {
			status: 422,
			body: { errors: 'Usuario ya existe' }
		};
	}
}

try {
} catch (error) {}
