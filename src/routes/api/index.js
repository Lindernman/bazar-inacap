export async function get({ request }) {
	console.log(request);

	return {
		status: 301,
		body: { hello: 'world' },
		headers: { location: '/login' }
	};
}
