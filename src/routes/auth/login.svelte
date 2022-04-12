<script>
	let email = 'ostap@mail.com';
	let password = 'inacap123';

	let error;

	async function loginUsuario() {
		let respuesta = await fetch('http://192.168.1.40:3002/api/login', {
			method: 'POST', // or 'PUT'
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({ email, password })
		});
		let resp = await respuesta.json();
		if (resp.errors) {
			error = resp.errors;
		}
	}
</script>

<div class="columns is-centered is-vcentered h-full">
	<div class="column is-8-tablet is-6-desktop is-5-widescreen">
		<div class="box has-background-black-ter">
			<div class="field">
				<label class="label has-text-white"> Email</label>
				<div class="control">
					<input
						class="input has-background-dark has-text-white"
						type="text"
						placeholder="e.g Alex Smith"
						bind:value={email}
					/>
				</div>
			</div>

			<div class="field">
				<label class="label has-text-white">Clave</label>
				<div class="control">
					<input
						class="input has-background-dark has-text-white"
						type="password"
						placeholder="e.g. alexsmith@gmail.com"
						bind:value={password}
					/>
				</div>
			</div>
			<button class="button is-success" on:click={loginUsuario}>Ingresar</button>
			<br />
			<div class="level">
				<div class="level-left">
					<div class="level-item">
						<a href="/auth/recover" class="mt-2 is-underlined">Se te olvido la clave?</a>
					</div>
				</div>
				<div class="level-right">
					<div class="level-item">
						<a href="/auth/register" class="mt-2 is-underlined">Registrarte</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
