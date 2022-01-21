<script lang="ts">
	import { fly } from 'svelte/transition';

	/* Font Awesome */
	import Icon from 'svelte-awesome';
	import { faPlay, faStop, faEdit, faFileAlt, faFolderOpen, faCopy, faCog, faBars, faChartLine} from '@fortawesome/free-solid-svg-icons';

	/* Burger Menu */
	let visible = false;

	/* Function to detect a click outside the burger menu */
	let blacklist: any = {};
	function clickOutside(node: Node) {
		const handleClick = (event: Event) => {
			if (!node.contains(event.target as Node)) {
				for (const [, el] of Object.entries(blacklist) as any) {
					if (!el.contains(event.target as Node)) {
						visible = false;
					}
				}
			}
		};
		document.addEventListener("click", handleClick, true);
		return {
			destroy() {
				document.removeEventListener("click", handleClick, true);
			}
		};
	}
</script>

<!-- Navbar -->
<div class="nav is-primary" role="navigation" aria-label="main navigation">
	<!-- Navbar Left-Hand Side -->

	<div class="nav-left">
		<h1>flask-svelte-template</h1>
	</div>

	<!-- Navbar Right-Hand Side -->
	<div class="nav-right">

		<!-- File Controls -->
		<button on:click={() => {
			}} class="button desktop is-medium is-clear">
			<span class="icon">
				<Icon data={faFileAlt} scale={1.6} />
			</span>
		</button>

		<button on:click={() => {
			}} class="button desktop is-medium is-clear">
			<span class="icon">
				<Icon data={faFolderOpen} scale={1.6} />
			</span>
		</button>

		<button on:click={() => {
			}} class="button desktop is-medium is-clear">
			<span class="icon">
				<Icon data={faCopy} scale={1.6} />
			</span>
		</button>

		<div class="divider"><hr></div>

		<!-- Settings -->
		<button on:click={() => {
			}} class="button desktop is-medium is-clear">
			<span class="icon">
				<Icon data={faCog} scale={1.6} />
			</span>
		</button>

		<!-- Burger Menu -->
		<button bind:this={blacklist.trigger} on:click={() => {
				visible = !visible;
			}} class="button mobile is-medium is-clear">
			<span class="icon">
				<Icon data={faBars} scale={1.6} />
			</span>
		</button>
	</div>
</div>

<!-- Burger Menu -->
{#if visible }
	<div class="burger-container">
		<div transition:fly="{{ y:-100 }}" use:clickOutside class="burger">
			<button on:click={() => {
					visible = false;
				}} class="button burger-entry">
				<span class="icon-text">
					<span class="icon mr-2">
						<Icon data={faFileAlt} />
					</span>
					<h1>New Patch</h1>
				</span>
			</button>
			<hr>
			<button on:click={() => {
					visible = false;
				}} class="button">
				<span class="icon-text">
					<span class="icon mr-2">
						<Icon data={faFolderOpen} />
					</span>
					<h1>Open Patch</h1>
				</span>
			</button>
			<hr>
			<button on:click={() => {
					visible = false;
				}} class="button">
				<span class="icon-text">
					<span class="icon mr-2">
						<Icon data={faCopy} />
					</span>
					<h1>Duplicate Patch</h1>
				</span>
			</button>
			<hr>
			<button on:click={() => {
					visible = false;
				}} class="button">
				<span class="icon-text">
					<span class="icon mr-2">
						<Icon data={faCog} />
					</span>
					<h1>Settings</h1>
				</span>
			</button>
		</div>
	</div>
{/if}

<style lang="scss">
	@charset "utf-8";
	@use "scss/theme.scss";

	.divider {
		width: 1px;
		display: flex;
		margin-left: 4px;
		margin-right: 4px;
		margin-top: 0px;
		margin-bottom: 0px;
		@include theme.themed() {
			background-color: theme.t(theme.$text-primary);
		}

		hr {
			@include theme.themed() {
				background-color: theme.t(theme.$text-primary);
			}
		}
	}

	/* Navbar Styling */
	.nav {
		flex: 0 0 auto;
		display: flex;
		justify-content: flex-end;
		align-items: center;
		width: 100%;
		@include theme.themed() {
			background-color: theme.t(theme.$background-primary);
		}
		z-index: 20;
	}

	.nav-left {
		flex: 0 0 auto;
		margin-left: 4px;
		margin-right: 4px;
	}

	.nav-right {
		display: flex;
		width: auto;
		justify-content: flex-end;
		align-items: center;
		flex: 1 0 auto;
		padding-right: 4px;
	}

	.nav h1 {
		font-size: 2rem;
		font-weight: 50;
		font-family: "comfortaa";
		@include theme.themed() {
			color: theme.t(theme.$text-primary);
		}
	}

	.nav .button {
		margin: 4px;
	}

	/* Burger Menu Styling */
	.burger-container {
		position: relative;
	}

	.burger {
		width: 100%;
		@include theme.themed() {
			background-color: theme.t(theme.$background-overlay);
		}
		position: absolute;
		z-index: 15;
	}

	.burger > hr {
		margin: 1px;
		height: 1px;
	}

	.burger h1 {
		font-size: 1.5rem;
		font-weight: 20;
		font-family: "comfortaa";
		@include theme.themed() {
			color: theme.t(theme.$text-primary);
		}
	}

	.burger .button {
		width: 100%;
		border: none;
		background: none;
	}

	.burger .button:hover {
		@include theme.themed() {
			background-color: theme.t(theme.$background-overlay-hover);
		}
		transition: background-color 0.1s ease;
	}

	/* Button Styling */
	.button:focus {
		outline: none;
		box-shadow: none;
	}

	.button.is-info {
		@include theme.themed() {
			background-color: theme.t(theme.$background-info);
		}
	}

	.button.is-success {
		@include theme.themed() {
			background-color: theme.t(theme.$background-success);
		}
	}

	.button.is-warning {
		@include theme.themed() {
			background-color: theme.t(theme.$background-warning);
		}
	}

	.button.is-danger {
		@include theme.themed() {
			background-color: theme.t(theme.$background-error);
		}
	}

	.button.is-clear {
		background-color: transparent;
		border: none;
	}

	.button:not(.is-clear):hover {
		filter: brightness(85%);
		transition: filter 0.2s ease;
	}

	.button.is-clear:hover {
		background-color: rgba(83, 83, 83, 0.5);
		transition: background-color 0.2s ease;
	}

	.icon {
		@include theme.themed() {
			color: theme.t(theme.$text-primary);
		}
	}

	/* Mobile/Desktop Display Overflow */
	.mobile {
		display: none;
	}

	.desktop {
		display: block;
	}

	@media screen and (max-width: (768px)) {
		.mobile {
			display: block !important;
		}

		.desktop {
			display: none !important;
		}
	}
</style>
