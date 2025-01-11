import {Plugin} from "esbuild";

/**
 * Creates a plugin that minifies HTML markup inside template literal strings.
 * @returns The newly created plugin.
 */
export function minifyHtml(): Plugin;
