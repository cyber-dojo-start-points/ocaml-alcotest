let test_answer_size () =
  Alcotest.(check int) "the answer, counted in digits" 3
    (String.length (string_of_int (Hiker.answer ())))

let test_answer_fits () =
  Alcotest.(check bool) "the answer fits in a byte" true (Hiker.answer () < 256)

let tests = [
  Alcotest.test_case "answer size" `Quick test_answer_size;
  Alcotest.test_case "answer fits" `Quick test_answer_fits;
]
