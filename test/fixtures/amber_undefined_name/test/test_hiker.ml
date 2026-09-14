let test_answer () =
  Alcotest.(check int) "life, the universe, and everything" 42 (Hiker.ansewr ())

let () =
  Alcotest.run "hiker" [
    ("hiker", [ Alcotest.test_case "answer" `Quick test_answer ]);
  ]
