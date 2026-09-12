(* Every check alcotest gives you, in one test.

   It checks literals rather than hiker, so it goes on passing while you
   rewrite everything around it. Its subject is the vocabulary itself, not the
   kata. Delete it once you know these by heart.

   Note that it counts: it adds one to the number of tests run.

   check takes a testable saying how to compare and how to print. int, string,
   bool, char and unit are ready made; list, array, option, pair and result
   build one out of another; float takes the tolerance to allow. *)

let test_checks () =
  Alcotest.(check int) "int" 42 (6 * 7);
  Alcotest.(check string) "string" "hiker" ("hi" ^ "ker");
  Alcotest.(check bool) "bool" true (4 = 4);
  Alcotest.(check char) "char" 'a' 'a';
  Alcotest.(check unit) "unit" () ();
  Alcotest.(check (float 0.001)) "float, within a tolerance" 1.0 0.9999;
  Alcotest.(check (list int)) "list" [ 1; 2 ] [ 1; 2 ];
  Alcotest.(check (array int)) "array" [| 1; 2 |] [| 1; 2 |];
  Alcotest.(check (option int)) "option" (Some 42) (Some 42);
  Alcotest.(check (pair int string)) "pair" (1, "a") (1, "a");
  Alcotest.(check (result int string)) "result" (Ok 42) (Ok 42);
  Alcotest.(check (neg int)) "neg, which passes when they differ" 42 43;
  Alcotest.check_raises "raises" (Failure "boom") (fun () -> failwith "boom")

let tests = [ Alcotest.test_case "checks" `Quick test_checks ]
