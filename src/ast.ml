type t = Inc | Dec | Plus | Minus | Print | Input | Loop of t list

let rec string_of_ast = function
  | Inc -> ">"
  | Dec -> "<"
  | Plus -> "+"
  | Minus -> "-"
  | Print -> "."
  | Input -> ","
  | Loop l -> Format.(asprintf "[%a]" (pp_print_list pp) l)

and pp fmt node = Format.fprintf fmt "%s" @@ string_of_ast node
