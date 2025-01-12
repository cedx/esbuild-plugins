import {coffeeScript} from "@cedx/esbuild-plugins";
import esbuild from "esbuild";

await esbuild.build({
	...theRestOfYourConfig,
	plugins: [coffeeScript()]
});
