let test_answer () =
  Alcotest.(check int) "life, the universe, and everything" 42 (Hiker.answer ())

let test_name () =
  Alcotest.(check string) "the name of the guide" "hiker" (Hiker.name ())

let test_crew () =
  Alcotest.(check int) "how many are aboard" 4 (Hiker.crew ())

let () =
  Alcotest.run "hiker" [
    ("hiker", [
      Alcotest.test_case "answer" `Quick test_answer;
      Alcotest.test_case "name" `Quick test_name;
      Alcotest.test_case "crew" `Quick test_crew;
    ]);
  ]
