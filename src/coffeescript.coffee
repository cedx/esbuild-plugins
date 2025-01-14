import {compile} from "coffeescript"
import {Buffer} from "node:buffer"
import {readFile} from "node:fs/promises"
import {EOL} from "node:os"

# Creates a plug-in that compiles CoffeeScript files.
export coffeeScript = (options = {}) ->
	name: "CoffeeScript"
	setup: (build) ->
		{filter = /\.(lit)?coffee$/i, compileOptions...} = options
		build.onLoad {filter}, (args) ->
			contents = await readFile args.path, "utf8"
			{js, v3SourceMap} = compile contents, Object.assign compileOptions, sourceMap: on
			loader: "js"
			contents: "#{js}#{EOL}//# sourceMappingURL=data:application/json;charset=utf-8;base64,#{Buffer.from(v3SourceMap).toString "base64"}"
		return
