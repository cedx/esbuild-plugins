import {Options} from "coffeescript";
import {Plugin} from "esbuild";

/**
 * Creates a plug-in that compiles CoffeeScript files.
 * @param options The plug-in options.
 * @returns The newly created plug-in.
 */
export function coffeeScript(options?: CoffeeScriptOptions): Plugin;

/**
 * Defines the options of the {@link coffeeScript} plug-in.
 */
export type CoffeeScriptOptions = Options & Partial<{

	/**
	 * The pattern indicating which modules to process when the path matches.
	 */
	filter: RegExp;
}>;
