let test_answer () =
  Alcotest.(check int) "life, the universe, and everything" 42 (Hiker.answer ())

let () =
  Alcotest.run "hiker" [
    ("hiker", [ Alcotest.test_case "answer" `Quick test_answer ]);
    ("answer size", Test_answer_size.tests);
  ]
