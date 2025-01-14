import {Plugin} from "esbuild";

/**
 * Creates a plug-in that dedupes the specified modules.
 * @param modules The list of modules to dedupe.
 * @param options The plug-in options.
 * @returns The newly created plug-in.
 */
export function dedupeModules(modules: Array<string>, options?: PluginOptions): Plugin;

/**
 * Defines the options of the {@link dedupeModules} plug-in.
 */
export type PluginOptions = Partial<{

	/**
	 * The path of the file system directory to use when resolving an import path.
	 */
	resolveDir: string;
}>;
