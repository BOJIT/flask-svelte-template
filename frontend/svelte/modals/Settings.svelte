<script lang="ts">
	/* Font-Awesome Icons */
	import Icon from 'svelte-awesome';
	import { faAdjust, faMoon, faSun } from '@fortawesome/free-solid-svg-icons';

	/* State stores */
	import theme from "store/theme";

	/* Svelte components */
	import Modal from "s/components/Modal.svelte";
	import Tabs from "s/components/Tabs.svelte";

	/* Global functions */
	import env from "global/env";

	export let index = 0;

	let tabs: string[] = [
		"Global",
		"About"
	];
</script>

<Modal title={"Settings"} confirm={false}>
	<Tabs tabs={tabs} bind:index={index}/>

	<!-- Global Tab -->
	<div class="tab-group">
		<div class="my-2 tab" style="visibility: {(tabs[index] === 'Global') ? 'visible' : 'hidden' }">
			<h2>Colour Scheme</h2>
			<br>
			<div class="field has-addons">
				<p class="control">
					<button on:click={() => {
						$theme.mode = "light";
					}} class="button" class:selected={$theme.mode == "light"}>
						<span class="icon"><Icon data={faSun} /></span>
						<span>Light</span>
					</button>
				</p>
				<p class="control">
					<button on:click={() => {
						$theme.mode = "auto";
					}} class="button" class:selected={$theme.mode == "auto"}>
						<span class="icon"><Icon data={faAdjust} /></span>
						<span>Auto</span>
					</button>
				</p>
				<p class="control">
					<button on:click={() => {
						$theme.mode = "dark";
					}} class="button" class:selected={$theme.mode == "dark"}>
						<span class="icon"><Icon data={faMoon} /></span>
						<span>Dark</span>
					</button>
				</p>
			</div>
		</div>
		<!-- About -->
		<div class="my-2 tab" style="visibility: {(tabs[index] === 'About') ? 'visible' : 'hidden' }">
			<h2>About</h2>
			<hr>
			<h3>Current Release: <b>{env.__GIT_TAG__}</b></h3>
			<hr>
		</div>
	</div>
</Modal>

<style lang="scss">
	@charset "utf-8";
	@use "scss/theme.scss";

	.tab-group {
		display: grid;
		grid-template-columns: 1fr;
		grid-template-rows: 1fr;
	}

	.tab {
		grid-column: 1;
		grid-row: 1;
	}
</style>
