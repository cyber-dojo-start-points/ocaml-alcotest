
# alcotest ends every run with one summary line counting the whole suite:
#
#   Test Successful in 0.000s. 2 tests run.
#   1 failure! in 0.000s. 3 tests run.
#
# The counts come from there. The exit status cannot be used to tell red from
# amber, because a check that did not hold and a test that raised both exit 1,
# and both are summarised as a failure. What separates them is the detail
# alcotest prints above the summary.
#
# A check that did not hold prints ASSERT, then Expected: and Received:.
# Anything raised prints a bracketed lowercase word at the start of a line:
# [failure] for Failure, [invalid] for Invalid_argument, and [exception] for
# everything else, including exceptions of your own. Matching that shape rather
# than those three names keeps an exception nobody has met yet amber instead of
# quietly red, which is the house convention: a check that fails is red, and
# anything that stops a test from reaching its check is amber.
#
# The marker cannot be confused with a test's own output, because alcotest
# captures that into its log files rather than printing it. [OK] and [FAIL] are
# upper case, so they are not matched either.
#
# Both count words are singular at one and plural otherwise. When the compile
# fails there is no summary line at all, and the final else makes that amber.

lambda { |stdout,stderr,status|
  output = stdout + stderr

  return :amber if /^\[[a-z][a-z-]*\]/.match(output)
  return :red   if /^\d+ failures?! in .*\d+ tests? run\./.match(output)

  if m = /^Test Successful in .*?(\d+) tests? run\./.match(output)
    # A run that collected no tests proved nothing either way.
    return :amber if m[1] == '0'
    return :green
  end

  return :amber
}
