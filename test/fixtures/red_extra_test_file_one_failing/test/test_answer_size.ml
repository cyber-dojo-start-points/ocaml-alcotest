let test_answer_size () =
  Alcotest.(check int) "the answer, counted in digits" 3
    (String.length (string_of_int (Hiker.answer ())))

let tests = [ Alcotest.test_case "answer size" `Quick test_answer_size ]
