import {Plugin} from "esbuild";
import {Options} from "minify-html-literals";

/**
 * Creates a plug-in that minifies HTML markup inside template literal strings.
 * @returns The newly created plug-in.
 */
export function minifyHtmlLiterals(options?: MinifyOptions): Plugin;

/**
 * Defines the options of the {@link minifyHtmlLiterals} plug-in.
 */
export type MinifyOptions = Options & Partial<{

	/**
	 * Pattern indicating which modules to process when the path matches.
	 */
	filter: RegExp;
}>;
