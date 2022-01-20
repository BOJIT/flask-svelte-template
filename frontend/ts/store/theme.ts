import { writable } from 'svelte/store';

/*----------------------------------------------------------------------------*/

type Theme = {
	mode: "light" | "dark" | "auto";
	state: "light" | "dark";
}

const DEFAULT_THEME: Theme = {
	mode: "dark",
	state: "dark"
};

const theme_store = writable(DEFAULT_THEME);

/*----------------------------------------------------------------------------*/

/* Handle window theme change without page refresh */
window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', () => {
	theme_store.update((theme: Theme) => { return theme });
});

/* Actual current theme is set based upon state property */
theme_store.subscribe((theme: Theme) => {
	/* Interpret theme mode */
	switch (theme.mode) {
		case "light":
			theme.state = "light";
			break;

		case "dark":
			theme.state = "dark";
			break;

		case "auto":
			if (window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches) {
				theme.state = "dark";
			} else {
				theme.state = "light";
			}
			break;
	}

	/* Set state based on mode */
	switch (theme.state) {
		case "light":
			document.body.classList.add("theme--light");
			document.body.classList.remove("theme--dark");
			break;

		case "dark":
			document.body.classList.add("theme--dark");
			document.body.classList.remove("theme--light");
			break;
	}
});

/*----------------------------------------------------------------------------*/

export default {
	subscribe: theme_store.subscribe,
	set: theme_store.set,
	update: theme_store.update
}
