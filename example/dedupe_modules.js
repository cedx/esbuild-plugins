import {dedupeModules} from "@cedx/esbuild-plugins";
import esbuild from "esbuild";

await esbuild.build({
	...theRestOfYourConfig,
	plugins: [dedupeModules(["bootstrap", "lit"])]
});
