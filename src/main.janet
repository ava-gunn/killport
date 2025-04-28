#!/usr/bin/env janet
(use sh)
(import cmd)

(cmd/def "Print a friendly greeting"
         --greeting (optional :string "Hello")
         "What to say. Defaults to hello."
         name (optional :string "Anon"))

(printf "%s, %s!" greeting name)

# Compiled
# (cmd/main (cmd/fn
#             [--greeting (optional :string "Hello")
#              name (optional :string "Anon")]
#             (printf "%s, %s!" greeting name)))

# named arguments start with a hyphen
# (cmd/def --foo (required :string))

# positional arguments don't
# (cmd/def foo (required :number))

# arguments can be optional
# (cmd/def --foo (optional :file))

# you can specify multiple aliases for a named argument
# (cmd/def [--foo -f] (optional :string))

# as well as a separate name to use for the Janet variable
# (cmd/def [bar --foo] :number))

