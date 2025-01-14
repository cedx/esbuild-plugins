import {Plugin} from "esbuild";
import {Options} from "minify-html-literals";

/**
 * Creates a plug-in that minifies HTML markup inside template literal strings.
 * @param options The plug-in options.
 * @returns The newly created plug-in.
 */
export function minifyHtmlLiterals(options?: PluginOptions): Plugin;

/**
 * Defines the options of the {@link minifyHtmlLiterals} plug-in.
 */
export type PluginOptions = Options & Partial<{

	/**
	 * The pattern indicating which modules to process when the path matches.
	 */
	filter: RegExp;
}>;
