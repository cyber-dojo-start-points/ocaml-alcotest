(* The check below holds, so the only thing standing between this run and a
   green light is how much it printed on the way there. *)

let () =
  for i = 1 to 4000 do
    Printf.printf "%04d probing the improbability drive\n" i
  done

let test_answer () =
  Alcotest.(check int) "life, the universe, and everything" 42 (Hiker.answer ())

let () =
  Alcotest.run "hiker" [
    ("hiker", [ Alcotest.test_case "answer" `Quick test_answer ]);
  ]
