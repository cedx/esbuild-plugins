import {Plugin} from "esbuild";

/**
 * Creates a plug-in that minifies HTML markup inside template literal strings.
 * @returns The newly created plug-in.
 */
export function minifyHtmlLiterals(): Plugin;
