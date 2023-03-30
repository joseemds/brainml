let tape_length = 32000
let tape = Array.make tape_length 0

let _ =
  let input =
    ">++++++++[<+++++++++>-]<.\n\
     >++++[<+++++++>-]<+.\n\
     +++++++..\n\
     +++.\n\
     >>++++++[<+++++++>-]<++.\n\
     ------------.\n\
     >++++++[<+++++++++>-]<+.\n\
     <.\n\
     +++.\n\
     ------.\n\
     --------.\n\
     >>>++++[<++++++++>-]<+."
  in
  let ast = Result.get_ok @@ Parser.parse input in
  Interpreter.interp tape 0 ast
