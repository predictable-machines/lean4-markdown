# lean4-markdown

A standalone Lean 4 library for building and rendering Markdown documents.

## Features

- **Block-level elements**: h1–h6, paragraphs, code blocks, images, blockquotes, lists (ordered & unordered), horizontal rules, tables
- **Inline elements**: text, bold, italic, strikethrough, inline code, links
- **Type-safe tables**: Column count enforced at compile time via `Vector`
- **Composable documents**: `MarkdownTag` structure for element + children composition
- **Rendering**: Pure functions to render any Markdown structure to `String`
- **Typeclass**: `Markdown.Represent` for types that can be rendered as Markdown

## Installation

Add to your `lakefile.lean`:

```lean
require markdown from git
  "https://github.com/predictable-machines/lean4-markdown" @ "v0.1.0"
```

## Usage

```lean
import Markdown

open Markdown

-- Build a document
def myDoc : List MarkdownTag :=
  [ { element := .h1 "Hello" }
  , { element := .p [.text "This is ", .bold "Markdown", .text " from Lean 4."] }
  , { element := .pre (some "lean") "def hello := \"world\"" }
  ]

-- Render to string
#eval renderMarkdown myDoc

-- Implement Represent for your types
structure MyReport where
  title : String
  body : String

instance : Markdown.Represent MyReport where
  toMarkdown r :=
    [ { element := .h2 r.title }
    , { element := .p [.text r.body] }
    ]
```

## Requirements

- Lean 4 (v4.32.0 or compatible)

## License

MIT
