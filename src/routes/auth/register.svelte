<script>
	let nombre = 'Ostap Demcenco';
	let email = 'ostap@mail.com';
	let password = 'inacap123';
	let repassword = 'inacap123';
	let rut = '11.111.111-1';
	let error;

	async function registroUsuario() {
		let respuesta = await fetch('http://192.168.1.40:3002/api/register', {
			method: 'POST', // or 'PUT'
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({ nombre, email, password, repassword, rut })
		});
		let resp = await respuesta.json();
		if (resp.errors) {
			error = resp.errors;
		}
	}
</script>

<div class="columns is-centered is-vcentered h-full">
	<div class="column is-8-tablet is-6-desktop is-5-widescreen">
		{#if error}
			<div class="is-size-4 has-text-danger">
				{error}
			</div>
			<!-- content here -->
		{/if}
		<div class="box has-background-black-ter">
			<div class="field">
				<label class="label has-text-white">Nombre Completo</label>
				<div class="control">
					<input
						class="input has-background-dark has-text-white"
						type="text"
						bind:value={nombre}
						placeholder="e.g Alex Smith"
					/>
				</div>
			</div>
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
				<label class="label has-text-white"> RUT</label>
				<div class="control">
					<input
						class="input has-background-dark has-text-white"
						type="text"
						placeholder="e.g Alex Smith"
						bind:value={rut}
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
			<div class="field">
				<label class="label has-text-white">Repite tu Clave</label>
				<div class="control">
					<input
						class="input has-background-dark has-text-white"
						type="password"
						placeholder="e.g. alexsmith@gmail.com"
						bind:value={repassword}
					/>
				</div>
			</div>
			<button class="button is-success" on:click={registroUsuario}>Registrarse</button>
			<br />
			<div class="level">
				<div class="level-left">
					<div class="level-item">
						<a href="/auth/recover" class="mt-2 is-underlined">Se te olvido la clave?</a>
					</div>
				</div>
				<div class="level-right">
					<div class="level-item">
						<a href="/auth/login" class="mt-2 is-underlined">Iniciar Sesion</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
