import {dedupeModules} from "@cedx/EsbuildPlugins";
import esbuild from "esbuild";

const buildOptions = { /* Your configuration. */ };
await esbuild.build({
	...buildOptions,
	plugins: [dedupeModules(["bootstrap", "lit"])]
});
