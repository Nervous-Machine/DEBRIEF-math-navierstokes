# Asks — The claimed finite-time blow-up of the unforced three-dimensional Navier–Stokes equations by Levent Alpöge and Tristan Buckmaster, released on 20 November 2026 as a paper and a Lean development

Each open gap below is a place a contribution can land. A contribution is one cycle in this repository's ledger, under your name. How to contribute, and the templates: https://github.com/Nervous-Machine/DEBRIEF/blob/main/CONTRIBUTING.md

## 1. The Lean development has not been built or kernel-checked by anyone outside the claimant (ledger id EG1)

The claimant reports a Lean development that compiles with standard axioms only. Nobody outside the claimant has reported building it.

Status: in cycle.

- **a pre-registered rerun: fetch at the pinned commit, build, confirm no sorry or admit, print the axioms** — contribution kind: rerun; who could act: anyone with a machine and a few hours.

Signal expected: a rerun cycle reporting build exit status, the sorry/admit scan and the axiom list for the main theorem. Resolution by: none registered.

## 2. Do the formal statements say what the problem asks? (ledger id EG2)

A Lean check establishes that the formal statement follows from its hypotheses. Whether that formal statement is the problem as posed is a separate question that a person has to answer. A third-party formalization of the problem statement exists, so part of this can be compared by machine.

Status: proposed.

- **a machine comparison of the claimant's main theorem with the third-party formal statement navier_stokes_existence_and_smoothness_R3 in google-deepmind/formal-conjectures, then a human read of any difference** — contribution kind: trace (a reading guide); who could act: anyone who can read Lean; the two statements are public.
- **two independent mathematicians read the formal statement against the problem as posed and sign, or refuse** — contribution kind: read; who could act: a mathematician in the problem's area, about an hour with a reading guide.

Signal expected: a trace cycle and two signed read cycles, or a refusal naming the difference. Resolution by: none registered.

## 3. No independent mathematician has reported reading the proof, and there is no referee report (ledger id EG3)

The claim was announced by Tristan Buckmaster on Mastodon and by the repository itself; the press reported it the same day. No independent reading, referee report or journal submission is on the public record.

Status: proposed.

- **a read cycle by a mathematician in the area who is not an author, signing or refusing each main step** — contribution kind: read; who could act: a mathematician in the problem's area.
- **a referee report or journal acceptance, recorded by date** — contribution kind: data; who could act: a journal; the record notes the date when it happens.

Signal expected: a signed or refused read cycle; a dated referee report. Resolution by: none registered.

## 4. The certificate the proof rests on is named by hash and not released (ledger id EG4)

The existence of the self-similar solution, and so the blow-up, rests on a certificate: an approximate solution satisfying explicit inequalities, checked by interval arithmetic outside the formalization. The paper gives the certificate's hash and says it will be released soon. Until it is, with the program that checks it, the formal development establishes only that a certificate of the stated form would imply blow-up.

Status: proposed.

- **the authors release the certificate, matching the hash 3f7a335b84b6c7631742cacc5343dfcd11cf72f5221ff79b2b9268790b4b22c5 given in the paper, and the interval-arithmetic program that checks it against the conditions of Appendix B, pinned by hash and date; then an independent rerun of that check** — contribution kind: data; who could act: the authors; then anyone with FLINT and Arb and a few hours.

Signal expected: a data cycle pinning the certificate and program, whose hash matches the paper's; then a rerun cycle reporting the check's result. Resolution by: none registered.

## 5. The formal statements stop short of the paper's, and the formal proofs do not follow the paper's (ledger id EG5)

By the development's own README, the formalization came first and the paper was rewritten with simpler arguments and citations in place of proofs, so the two share statements but not proofs; the certificate step is formalized only to a weak profile, with smoothness, closeness and rate left to the paper; and the formal definition of a certificate asks more than the paper's in thirteen places. Whether the formal theorems and the paper's are the same claims is a reading, item by item.

Status: proposed.

- **a reader with the paper and the Lean statement files checks each of the README's stated differences and signs or refuses that the formal theorems carry the paper's claims** — contribution kind: read; who could act: an analyst who reads Lean, a few hours with the README's list.

Signal expected: a read cycle listing each difference as immaterial, material or unresolved. Resolution by: none registered.
