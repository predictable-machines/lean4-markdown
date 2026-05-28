import Lake
open Lake DSL

package markdown where
  version := v!"0.1.2"

@[default_target]
lean_lib Markdown where
  roots := #[`Markdown]
