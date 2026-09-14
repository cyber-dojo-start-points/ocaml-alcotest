(* alcotest captures whatever a test itself prints into its log directory, so
   a print inside test_answer below would not appear in the output at all. A
   print out here, before the tests are run, is what reaches the screen. *)

let () = prerr_endline "DEBUG working the answer out"

let test_answer () =
  Alcotest.(check int) "life, the universe, and everything" 42 (Hiker.answer ())

let () =
  Alcotest.run "hiker" [
    ("hiker", [ Alcotest.test_case "answer" `Quick test_answer ]);
  ]
