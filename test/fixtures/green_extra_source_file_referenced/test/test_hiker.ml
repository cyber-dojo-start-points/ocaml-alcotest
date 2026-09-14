let test_answer () =
  Alcotest.(check int) "life, the universe, and everything" 42 (Hiker.answer ())

let test_answer_checksum () =
  Alcotest.(check int) "the answer, cast down to one digit" 6
    (Hiker.answer_checksum ())

let () =
  Alcotest.run "hiker" [
    ("hiker", [
      Alcotest.test_case "answer" `Quick test_answer;
      Alcotest.test_case "answer checksum" `Quick test_answer_checksum;
    ]);
  ]
