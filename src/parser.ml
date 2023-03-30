open Angstrom
open Ast

let ws =
  skip_while (function '\x20' | '\x0a' | '\x0d' | '\x09' -> true | _ -> false)

let inc = char '>' *> return Inc
let dec = char '<' *> return Dec
let plus = char '+' *> return Plus
let minus = char '-' *> return Minus
let print = char '.' *> return Print
let input = char ',' *> return Input

let expr =
  fix (fun expr ->
      let loop = char '[' *> expr <* char ']' >>| fun l -> Loop l in
      many
      @@ ws
         *> choice ~failure_msg:"Invalid symbol"
              [ inc; dec; plus; minus; print; input; loop ])

let parse str = parse_string ~consume:All expr str
