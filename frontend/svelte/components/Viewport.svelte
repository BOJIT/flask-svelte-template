<script lang="ts">
	import Button from "s/components/Button.svelte";
</script>

<div class="viewport">
	<Button/>
	<Button/>
	<Button/>
</div>

<style lang="scss">
	@charset "utf-8";
	@use "scss/theme.scss";

	.viewport {
		height: 100%;
		@include theme.themed() {
			background-color: theme.t(theme.$background-secondary);
		}
	}

</style>
