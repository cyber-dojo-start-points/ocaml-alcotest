let test_answer_size () =
  Alcotest.(check bool) "the answer fits in a byte" true (Hiker.answer () < 256

let tests = [ Alcotest.test_case "answer size" `Quick test_answer_size ]
