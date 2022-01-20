/* Main Script Entrypoint */

import 'styles/main.scss';
import Main from 'components/../Main.svelte';

const main = new Main({
	target: document.body
});

export default main;
