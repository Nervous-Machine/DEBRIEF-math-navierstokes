#!/usr/bin/env bash
# DEBRIEF-math-navierstokes cycle 1: pre-registered build of tristanbuckmaster/navier-stokes at ad53419d. Runs inside the VM only.
OUT=$HOME/ns_cycle1; SRC=$HOME/untrusted/alpoge-ns; COMMIT=ad53419de079eb8f95f60313473374624a348546
mkdir -p "$OUT"; cd "$HOME" || exit 1
log(){ echo "$(date -u +%FT%TZ) $*" >> "$OUT/progress.log"; }
log "start"
{ uname -a; nproc; free -g; df -h "$HOME" | tail -1; elan --version; lean --version 2>/dev/null; lake --version; git --version; } > "$OUT/env.txt" 2>&1
# R1 clone into a new, empty, untrusted directory
if [ -e "$SRC" ]; then log "R1: $SRC exists; refusing to reuse"; exit 2; fi
mkdir -p "$SRC" && git clone -q https://github.com/tristanbuckmaster/navier-stokes "$SRC/navier-stokes" >> "$OUT/R1.txt" 2>&1
cd "$SRC/navier-stokes" || { log "R1: clone failed"; exit 2; }
git checkout -q "$COMMIT" >> "$OUT/R1.txt" 2>&1
{ echo "HEAD $(git rev-parse HEAD)"; echo "pinned $COMMIT"; echo "ls-tree sha256 $(git ls-tree -r HEAD | sha256sum | cut -d' ' -f1)"; echo "ls-tree entries $(git ls-tree -r HEAD | wc -l)"
  echo "lean files under lean/ (excluding .lake): $(find lean -name '*.lean' -not -path '*/.lake/*' | wc -l)"; echo "lean lines: $(find lean -name '*.lean' -not -path '*/.lake/*' -print0 | xargs -0 cat | wc -l)"
  echo "toolchain: $(cat lean/lean-toolchain)"; grep -n 'rev' lean/lakefile.toml; } >> "$OUT/R1.txt" 2>&1
log "R1 done: $(git rev-parse HEAD)"
cd lean || exit 2
# R2 Mathlib cache
/usr/bin/time -v lake exe cache get > "$OUT/R2.log" 2> "$OUT/R2_time.txt"; echo "R2 exit $?" >> "$OUT/R2.log"; log "R2 done: $(tail -1 "$OUT/R2.log")"
# R3 build
/usr/bin/time -v lake build > "$OUT/R3_build.log" 2> "$OUT/R3_time.txt"; R3=$?; echo "R3 exit $R3" >> "$OUT/R3_build.log"
grep -c '^error' "$OUT/R3_build.log" > "$OUT/R3_errors.txt"; grep -c 'warning:' "$OUT/R3_build.log" > "$OUT/R3_warnings.txt"
log "R3 done: exit $R3, errors $(cat "$OUT/R3_errors.txt"), warnings $(cat "$OUT/R3_warnings.txt")"
# R4 scan
{ echo "## statement files (top-level *.lean)"; for p in '\bsorry\b' '\badmit\b' 'native_decide' '^\s*axiom\b' 'implemented_by' '@\[extern' '\bunsafe\b' '^\s*opaque\b'; do echo "### pattern $p"; grep -nE "$p" ./*.lean | grep -v '^./Solution.lean' ; done
  echo "## Breakdown/ and Solution.lean"; for p in '\bsorry\b' '\badmit\b' 'native_decide' '^\s*axiom\b' 'implemented_by' '@\[extern' '\bunsafe\b' '^\s*opaque\b'; do echo "### pattern $p"; grep -rnE "$p" Breakdown Solution.lean; done; } > "$OUT/R4.txt" 2>&1
log "R4 done"
# R5, R6, R7: lean files written outside the untrusted tree
lake env lean "$HOME/nm-scripts/NS_Axioms.lean" > "$OUT/R5.txt" 2> "$OUT/R5.err"; echo "exit $?" >> "$OUT/R5.txt"; log "R5 done: $(tail -1 "$OUT/R5.txt")"
for m in Challenge ExtendedCoerciveChallenge CellLayerTheorems FractionalCellSystemChallenge FractionalCertificateChallenge FractionalChallenge; do
  lake env lean "$HOME/nm-scripts/NS_Stmt_$m.lean" > "$OUT/R6_stmt_$m.txt" 2> "$OUT/R6_stmt_$m.err"; echo "exit $?" >> "$OUT/R6_stmt_$m.txt"
done
lake env lean "$HOME/nm-scripts/NS_Sol_Types.lean" > "$OUT/R6_solution.txt" 2> "$OUT/R6_solution.err"; echo "exit $?" >> "$OUT/R6_solution.txt"
cat "$OUT"/R6_stmt_*.txt | grep -v '^exit' > "$OUT/R6_statements_all.txt"; grep -v '^exit' "$OUT/R6_solution.txt" > "$OUT/R6_solution_all.txt"
diff <(sort "$OUT/R6_statements_all.txt") <(sort "$OUT/R6_solution_all.txt") > "$OUT/R6_diff.txt"; echo "diff exit $?" >> "$OUT/R6_diff.txt"
log "R6 done: $(tail -1 "$OUT/R6_diff.txt")"
lake env lean "$HOME/nm-scripts/NS_R7.lean" > "$OUT/R7.txt" 2> "$OUT/R7.err"; echo "exit $?" >> "$OUT/R7.txt"; log "R7 done"
( cd "$OUT" && sha256sum *.txt *.log *.err > cycle1-logs.sha256 )
du -sh "$SRC" > "$OUT/disk.txt"; log "all done"; touch "$OUT/DONE"
