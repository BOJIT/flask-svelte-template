<script lang="ts">
	/* Initialise local storage */
	import storage from "store/storage";
	storage.init();

	/* State stores */
	import modal from "store/modal";

	/* Svelte components */
	import Notification from "s/components/Notification.svelte";
	import Navbar from "./components/Navbar.svelte";
	import Viewport from "./components/Viewport.svelte";
</script>

<Navbar/>

<Viewport/>

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
