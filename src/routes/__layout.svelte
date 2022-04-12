<script>
	import Footer from '$lib/components/Footer.svelte';
	import Navbar from '$lib/components/Navbar.svelte';
</script>

<body class=" h-screen is-flex is-flex-direction-column has-background-dark has-text-white">
	<div class="h-12">
		<Navbar />
	</div>
	<!-- EL SLOT SON LAS RUTAS -->
	<div class=" is-flex is-flex-direction-column  p-5 h-full">
		<slot />
	</div>
	<div class="mt-auto">
		<Footer />
	</div>
</body>

<style>
	.maincl {
		display: flex;
		flex-direction: column;
	}
	.h-screen {
		height: 100vh;
	}
	:global(.h-full) {
		height: 100%;
	}
	:global(.m-auto) {
		margin: auto;
	}
	.mt-auto {
		margin-top: auto;
	}
	.w-full {
		width: 100%;
	}
	.h-12 {
		height: 4em;
	}
</style>
