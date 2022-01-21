<script lang="ts">
	/* Initialise local storage */
	import storage from "store/storage";
	storage.init();

	/* State stores */
	import modal from "store/modal";
	import notification from "store/notification";

	/* Svelte components */
	import Notification from "s/components/Notification.svelte";
</script>

<h1>Hello World!</h1>
<button on:click={() => {
	notification.push({
		type: "error",
		title: "Hey there!",
		message: "test message",
		timeout: 10
	});
}}>TEST</button>

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
