<script lang="ts">
	/* Initialise local storage */
	import storage from "store/storage";
	storage.init();

	/* State stores */
	import modal from "store/modal";

	/* Svelte components */
	import Header from "./components/Header.svelte";
	import Footer from "./components/Footer.svelte";
	import Viewport from "./components/Viewport.svelte";
	import Notification from "s/components/Notification.svelte";
</script>

<div class="content">
	<Header/>

	<Viewport/>

	<Footer/>
</div>

<!-- Modal Overlay -->
{#if $modal}
	{#if $modal.props }
		<svelte:component this={$modal.component} {...$modal.props} />
	{:else}
		<svelte:component this={$modal} />
	{/if}
{/if}

<!-- Notifications -->
<Notification/>

<style lang="scss">
	@charset "utf-8";
	@use "scss/theme.scss";

	.content {
		display: flex;
		flex-direction: column;
		width: 100vw;
		height: 100vh;
	}

</style>
