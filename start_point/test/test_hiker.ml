(* This is the one place the tests are run from. alcotest does not go looking
   for test files, so a test only runs once it is named in the list below.
   Adding a test file means adding it here too, the way alcotest_checks.ml is
   added. A file you add and do not name here still has to compile, so a
   mistake in it is reported rather than passed over. *)

let test_answer () =
  Alcotest.(check int) "life, the universe, and everything" 42 (Hiker.answer ())

let () =
  Alcotest.run "hiker" [
    ("hiker", [ Alcotest.test_case "answer" `Quick test_answer ]);
    ("alcotest checks", Alcotest_checks.tests);
  ]
