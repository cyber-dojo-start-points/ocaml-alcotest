(* Nothing names this file in the run call in test_hiker.ml, so alcotest never
   reaches it. The check below would not hold if it ever did run, which is what
   makes the passing run evidence that it did not. It still has to compile. *)

let test_answer_size () =
  Alcotest.(check int) "never reached" 0 (Hiker.answer ())

let tests = [ Alcotest.test_case "answer size" `Quick test_answer_size ]
