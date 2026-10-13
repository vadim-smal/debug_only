"""Metadata rule carrying the debug_only flag; read by tools/gen_libs_list.sh via bazel query."""

LibInfo = provider(fields = ["debug_only", "entry_points"])

def _lib_info_impl(ctx):
    return [LibInfo(debug_only = ctx.attr.debug_only, entry_points = ctx.attr.entry_points)]

lib_info = rule(
    implementation = _lib_info_impl,
    attrs = {
        "debug_only": attr.bool(mandatory = True),
        "entry_points": attr.string_list(),
    },
)
