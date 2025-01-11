import {minifyHtml} from "@cedx/esbuild-plugins"
import esbuild from "esbuild"

await esbuild.build {
	theRestOfYourConfig...
	plugins: [minifyHtml()]
}
