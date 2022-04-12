// @ts-nocheck
import db from '$lib/db';
import bcrypt from 'bcryptjs';
import { parse } from 'cookie';
export async function post({ request }) {
	let weas = parse(request.headers.get('cookie'));

	let { email, password } = await request.json();

	let user = await db.query('SELECT id, password, email FROM users WHERE email = $1', [email]);

	user = user.rows[0];
	const claveValida = await bcrypt.compareSync(password, user.password);

	if (claveValida) {
		return {
			headers: {
				'set-cookie': [`sesion=${user.id}; SameSite=Lax; Path=/;`]
			}
		};
	} else {
		return {};
	}
}
