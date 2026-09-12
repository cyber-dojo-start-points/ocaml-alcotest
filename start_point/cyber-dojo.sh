set -e

# Where the compiler's own files go. They are put outside your files so that
# the .cmi and .cmo it makes for every module do not appear beside the code you
# wrote. Error messages still name your files, because those are what the
# compiler is given.
readonly OBJS=/tmp/objs
readonly LOGS=/tmp/alcotest
mkdir -p "${OBJS}" "${LOGS}"

# Every .ml file, at any depth. A file nothing refers to yet is compiled all
# the same, so one you are partway through writing reports its error here
# rather than being passed over in silence.
readonly SOURCES=$(find . -name '*.ml' | sort)

# One -I per directory holding a .ml, so a module in one directory can refer to
# a module in another, including directories you add later.
INCLUDES=()
for dir in $(find . -name '*.ml' -exec dirname {} \; | sort --unique); do
  INCLUDES+=(-I "${dir}")
done

# OCaml compiles a module before the modules that refer to it, so the files
# have to be put in dependency order first. ocamldep works that order out by
# reading them. Its complaints are silenced because the compiler below reports
# the same thing, once, and in full.
readonly ORDERED=$(ocamlfind ocamldep -package alcotest -sort "${INCLUDES[@]}" ${SOURCES} 2>/dev/null)

for ml in ${ORDERED}; do
  ocamlfind ocamlc -package alcotest -c "${INCLUDES[@]}" -I "${OBJS}" \
    -o "${OBJS}/$(basename "${ml}" .ml).cmo" "${ml}"
done

# Bytecode rather than native code. A test run pays for the compile every time
# and the tests themselves take well under a millisecond, so the compiler that
# finishes soonest is the one that makes the whole run quickest.
ocamlfind ocamlc -package alcotest -linkpkg -I "${OBJS}" \
  $(for ml in ${ORDERED}; do echo "${OBJS}/$(basename "${ml}" .ml).cmo"; done) \
  -o "${OBJS}/tests"

# All your tests run in ONE process, so alcotest counts every one of them into
# a single summary line. -o keeps its log directory out of your files.
#
# --show-errors prints what went wrong in every test that failed. Without it
# only the first one is explained, so a second failure further down tells you
# nothing but its name.
echo
"${OBJS}/tests" --show-errors -o "${LOGS}"
