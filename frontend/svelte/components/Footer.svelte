<script lang="ts">

</script>

<footer>
	<h2>Footer</h2>
</footer>

<style lang="scss">
	@charset "utf-8";
	@use "scss/theme.scss";

	footer {
		flex: 0 0 auto;
		align-self: end;
		width: 100%;
		@include theme.themed() {
			background-color: theme.t(theme.$background-primary);
		}
		z-index: 20;
	}
</style>
