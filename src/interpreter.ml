open Ast

let rec interp tape current_cell =
  let rec loop = function
    | [] -> current_cell
    | node :: nodes as ast ->
        if tape.(current_cell) = 0 then current_cell
        else
          let current_cell = inner node in
          let loop_cell = interp tape current_cell nodes in
          if loop_cell == 0 then loop_cell else loop ast
  and inner = function
    | Inc -> current_cell + 1
    | Dec -> current_cell - 1
    | Plus ->
        tape.(current_cell) <- tape.(current_cell) + 1;
        current_cell
    | Minus ->
        Array.set tape current_cell @@ (tape.(current_cell) - 1);
        current_cell
    | Print ->
        let char = Uchar.of_int @@ tape.(current_cell) |> Uchar.to_char in
        Format.printf "%c%!" char;
        current_cell
    | Input -> read_int ()
    | Loop l -> loop l
  in
  function
  | [] -> current_cell
  | node :: nodes ->
      let current_cell = inner node in
      interp tape current_cell nodes
