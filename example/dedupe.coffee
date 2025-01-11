import {dedupe} from "@cedx/esbuild-plugins"
import esbuild from "esbuild"

await esbuild.build {
	theRestOfYourConfig...
	plugins: [dedupe "bootstrap", "lit"]
}
