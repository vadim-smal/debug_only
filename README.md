# debug_only example

Minimal repro of the `libs_list.gen.bzl` / `debug_only` setup.

- `Features/{LibA,LibB,LibDebug}`: dummy `swift_library` + `lib_info` (`LibDebug` has `debug_only = True`).
- `tools/gen_libs_list.sh`: queries `lib_info` rules, writes `App/Wiring/libs_list.gen.bzl`.
- `App/Wiring/libs.bzl`: splits into `DEFAULT_LIBS` / `DEBUG_LIBS`.
- `App/Wiring:LinkedLibs`: adds debug-only libs via `select` on `//configs:debug_enabled`.

```
tools/gen_libs_list.sh            # generate
tools/gen_libs_list.sh --dry-run  # check
bazelisk build //App           # debug (default) -> includes LibDebug
bazelisk build //App --with_debug=false
bazelisk cquery 'deps(//App/Wiring:LinkedLibs, 1)' --with_debug=false
```
