import process from "node:process"
import {fileURLToPath} from "node:url"
import {packageDirectory} from "pkg-dir"

# Creates a plug-in that dedupes the specified packages.
export dedupe = (packages...) ->
	name: "dedupe"
	setup: (build) ->
		paths = new Map
		build.onResolve namespace: "file", filter: new RegExp("^#{packages.join "|"}$"), (args) -> path: paths.get args.path
		build.onStart ->
			options = kind: "import-statement", resolveDir: await packageDirectory() or process.cwd()
			resolutions = await Promise.all packages.map (pkg) -> build.resolve pkg, options
			for [index, pkg] from packages.entries()
				{errors, path} = resolutions[index]
				paths.set pkg, if errors.length then fileURLToPath import.meta.resolve pkg else path
			return
		return
