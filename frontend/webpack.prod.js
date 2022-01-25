/* Get dependencies from webpack.common */
const path = require('path');
const webpack = require('webpack');
const common = require("./webpack.common");
const { merge } = require("webpack-merge");

/* Environment-specific dependencies */
const HtmlWebpackPlugin = require("html-webpack-plugin");
const sveltePreprocess = require('svelte-preprocess');
const TerserPlugin = require("terser-webpack-plugin");

let commitHash = require('child_process')
	.execSync('git rev-parse --short HEAD')
	.toString()
	.trim();

let gitTag = require('child_process')
	.execSync('git describe --tags')
	.toString()
	.trim();

module.exports = merge(common, {
	mode: "production",
	devtool: false,
	performance: {
		hints: false,
		maxEntrypointSize: 512000,
		maxAssetSize: 512000
	},
	optimization: {
		minimizer: [
			new TerserPlugin({
				extractComments: false,
			}),
			new HtmlWebpackPlugin({
				favicon: path.resolve(__dirname, './assets/favicon/icon_x48.png'),
				title: "flask-svelte-template",
				minify: {
					removeAttributeQuotes: true,
					collapseWhitespace: true,
					removeComments: true
				}
			})
		],
	},
	module: {
		rules: [
			{
				test: /\.svelte$/,
				use: {
					loader: 'svelte-loader',
					options: {
						compilerOptions: {
							dev: false
						},
						emitCss: true,
						hotReload: false,
						preprocess: sveltePreprocess({ sourceMap: false })
					}
				}
			},
		]
	},
	plugins: [
		new webpack.DefinePlugin({
			__COMMIT_HASH__: JSON.stringify(commitHash),
			__GIT_TAG__: JSON.stringify(gitTag),
			__MODE__: JSON.stringify("production")
		})
	]
});
