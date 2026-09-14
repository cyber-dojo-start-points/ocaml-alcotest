let test_fizz () =
  Alcotest.(check string) "three is Fizz" "Fizz" (Fizz_buzz.say 3)

let test_buzz () =
  Alcotest.(check string) "five is Buzz" "Buzz" (Fizz_buzz.say 5)

let () =
  Alcotest.run "fizz buzz" [
    ("fizz buzz", [
      Alcotest.test_case "fizz" `Quick test_fizz;
      Alcotest.test_case "buzz" `Quick test_buzz;
    ]);
  ]
