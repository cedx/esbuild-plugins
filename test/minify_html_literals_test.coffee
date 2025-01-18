import {minifyHtmlLiterals} from "@cedx/esbuild-plugins"
import esbuild from "esbuild"
import {equal, ok} from "node:assert/strict"
import {Buffer} from "node:buffer"
import {join} from "node:path"
import {describe, it} from "node:test"

# Tests the features of the `minifyHtmlLiterals` plug-in.
describe "minifyHtmlLiterals", ->
	it "should minify `html` template literals from a template", ->
		bundle = await esbuild.build
			bundle: yes
			entryPoints: [join import.meta.dirname, "../res/html_template.js"]
			external: ["lit"],
			format: "esm"
			plugins: [minifyHtmlLiterals()]
			write: no

		{contents} = bundle.outputFiles[0]
		actual = Buffer.from(contents).toString()
		expected = """
			// res/html_template.js
			import { html } from "lit";
			var htmlTemplate = html`<p>Bonjour le monde !</p><input type="text"> <button type="button">Bouton</button>`;
			export {
				htmlTemplate
			};
		"""

		equal actual.trim(), expected.replaceAll("\t", "  ")
