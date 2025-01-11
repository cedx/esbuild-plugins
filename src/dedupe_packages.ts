import {Plugin} from "esbuild";

/**
 * Creates a plug-in that dedupes the specified packages.
 * @param packages The names of the packages to dedupe.
 * @returns The newly created plug-in.
 */
export function dedupePackages(...packages: Array<string>): Plugin;
