import process from "node:process"
import {packageDirectory} from "pkg-dir"

# Creates a plug-in that dedupes the specified packages.
export dedupeModules = (modules, options = {}) ->
	name: "DedupeModules"
	setup: (build) ->
		{resolveDir = null} = options
		build.onStart ->
			resolveDir ?= await packageDirectory() or process.cwd()
			return
		build.onResolve namespace: "file", filter: new RegExp("^(#{packages.join "|"})(/|$)"), (args) ->
			await build.resolve args.path, kind: args.kind, resolveDir: resolveDir
		return
