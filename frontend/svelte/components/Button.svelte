<script lang="ts">
	import Icon from 'svelte-awesome';
	import { faFileAlt } from '@fortawesome/free-solid-svg-icons';
</script>

<div>
	<button on:click={() => {

		}} class="button is-large is-clear">
		<span class="icon">
			<Icon data={faFileAlt} scale={1.75} />
		</span>
	</button>
</div>

<style lang="scss">
	@charset "utf-8";
	@use "scss/theme.scss";

	.button:focus {
		outline: none;
		box-shadow: none;
	}

	.button.is-clear {
		@include theme.themed() {
			background-color: theme.t(theme.$background-overlay);
		}
		border: none;
	}

	.button.is-clear:hover {
		@include theme.themed() {
			background-color: theme.t(theme.$background-overlay-hover);
		}
	}

	.icon {
		@include theme.themed() {
			color: theme.t(theme.$text-primary);
		}
	}
</style>
