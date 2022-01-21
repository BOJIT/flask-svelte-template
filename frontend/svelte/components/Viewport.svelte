<script lang="ts">

</script>

<div class="viewport">
	<h1> tests</h1>
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
