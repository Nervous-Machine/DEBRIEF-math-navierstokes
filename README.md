# DEBRIEF-math-navierstokes

A DEBRIEF mission record (protocol https://github.com/Nervous-Machine/DEBRIEF) for **The claimed finite-time blow-up of the unforced three-dimensional Navier–Stokes equations by Levent Alpöge and Tristan Buckmaster, released on 20 November 2026 as a paper and a Lean development**.

<!-- standing:begin -->
**Standing, 22 Nov 2026.** Stage: Registered. Needs next: The Lean development has not been built or kernel-checked by anyone outside the claimant ([what would close it](ASKS.md)).

| certified | accepted | refuted | open gaps | cycles filed | last cycle |
|---|---|---|---|---|---|
| 0 | 0 | 0 | 5 | 0 | 22 Nov 2026 |

| | |
|---|---|
| checked by machine | nobody yet |
| read by a person | nobody yet; no reading guide yet |
| elsewhere | [Clay Mathematics Institute](https://www.claymath.org/millennium/navier-stokes-equation/): Active · [DeepMind formal-conjectures, NavierStokes.lean](https://raw.githubusercontent.com/google-deepmind/formal-conjectures/main/FormalConjectures/Millennium/NavierStokes.lean): research open · [The certificate, per the claimants' README](https://raw.githubusercontent.com/tristanbuckmaster/navier-stokes/main/README.md): is not in this repository |
| related | [Navier–Stokes blow-up, forced (OpenAI)](https://github.com/Nervous-Machine/DEBRIEF-math-navierstokes-forced): the unforced case; removes the force this claim uses; same problem page · [Riemann Hypothesis (Alpöge, with Claude)](https://github.com/Nervous-Machine/DEBRIEF-math-riemann): same claimant (Alpöge), released the same morning |
| tooling | Claude Fable 5.2, Claude (version not stated), OpenAI Codex (agent), GPT-5.6 Sol, GPT-6 Astra · tier: mixed · not stated for this result; the pair's forced results date from August by the September statement (inferred: Alpöge is an Anthropic employee; Buckmaster's statement of 7 September calls the collaboration personal and names Claude, and Codex with GPT-5.6 Sol and GPT-6 Astra, for the pair's earlier forced results; the repository's commits of 20 November name Claude Fable 5.2; the tier of Buckmaster's access is not stated) |

Rendered from `ledger/` at regeneration; the full record is `SCORECARD.md`, what is owed is `ASKS.md`. Standing words: nothing has standing yet.
<!-- standing:end -->

This claim is on the public claims board, https://math-board.nervousmachine.com, which shows its stage, who has contributed, and what it needs next.

## The problem

Do smooth solutions of the three-dimensional incompressible Navier–Stokes equations, started from smooth data, stay smooth for all time, or can the velocity become unbounded in finite time? Fefferman's formulation accepts either answer: a proof of existence and smoothness, with no force on space (A) or on the torus (B), or a proof of breakdown, which may use a smooth force, on space (C) or on the torus (D). A third-party Lean formalization of all four alternatives exists in DeepMind's formal-conjectures; it lists (A) and (B) as open and, since September 2026, (C) and (D) as solved on the strength of OpenAI's forced construction. This claim is the unforced case: it would refute (A) and (B) as stated there.

Source: https://www.claymath.org/millennium/navier-stokes-equation/ (posed: one of the seven Clay Millennium Prize Problems (2000), formulated by Charles Fefferman as four alternatives: existence and smoothness on space (A) and on the torus (B), or breakdown on space (C) and on the torus (D)).

A third-party formalization of the problem statement exists: `FormalConjectures/Millennium/NavierStokes.lean` in github.com/google-deepmind/formal-conjectures at commit `2207c54d0dbe960de591d280f997b195bf3f6e28` (blob `c21ccbfb73a85a930970d3b93ad23bd4c97d082a`). It is the natural reference for whether a claimant's Lean theorem states this problem.

## The claim

**Levent Alpöge and Tristan Buckmaster**, using the Lean development's README says the formalization came first and a first draft of the paper was obtained from the Lean proof; the repository's two commits carry a Claude co-author line; Buckmaster's September statement on the pair's earlier results names Claude and OpenAI's Codex models, submitted 2026-11-20 at https://github.com/tristanbuckmaster/navier-stokes.

The paper's abstract says that smooth, compactly supported, divergence-free data on space, and smooth divergence-free data on the torus, exist whose solutions of the unforced three-dimensional Navier–Stokes equations blow up in finite time, converging in self-similar variables to a backward discretely self-similar solution and blowing up at its rate. Part one (its Theorem 1.1): a profile, a smooth nonzero solution of the self-similar equations that is periodic in self-similar time up to a linear isometry and has stated decay, implies this blow-up; the proof shows such a solution is stable up to finitely many directions. Part two (its Theorem 7.1): such a profile exists near an approximate one that satisfies explicit inequalities, the certificate. Appendix B describes the certificate's form; Appendix C the computation of the approximate profile. The certificate is not in the repository; the abstract gives its hash and says it will be released soon. That it satisfies the inequalities is checked, the authors say, by interval arithmetic at 128 bits with the Arb library through FLINT, which is not part of the formalization and not in the repository either. The Lean package is the working repository's, with one patch of 20 November applied to the cell-layer statements and dependent proofs, and the README says the patched package was not rebuilt when the repository was assembled. The README also says the formal proofs do not follow the paper's, that the formal statement of the certificate step stops at a weak profile where the paper obtains a smooth one, that the formal definition of a certificate asks more than the paper's in thirteen places, and that the rate and convergence in Theorem 1.1 are not part of the formal statements. The package has no licence file. The authors say in the paper's release that the write-up is unpolished and that after September they could not risk waiting.

Artifacts, pinned:

- a PDF write-up: https://github.com/tristanbuckmaster/navier-stokes/blob/ad53419de079eb8f95f60313473374624a348546/paper/finite-time-blow-up-navier-stokes.pdf (sha256 4a01929b2f8a595637bbbe1dfef9724e5de768d31283d62415ce045e2ed69901, 1615293 bytes, fetched 2026-11-22)
- a public repository: github.com/tristanbuckmaster/navier-stokes at commit ad53419de079eb8f95f60313473374624a348546 (2026-11-20); no licence file; 2270 Lean files; has a lakefile

Status on the problem page as of 2026-11-22: a paper and a Lean package in a personal GitHub repository; no preprint server, no journal, no referee report; the Clay page lists the problem as Active.

## What is owed

Each open gap is in `ASKS.md` with what closes it and who could act. In order:

1. **The Lean development has not been built or kernel-checked by anyone outside the claimant** (EG1): A rerun of the Lean build on an independent machine, written down first.
2. **Do the formal statements say what the problem asks?** (EG2): A reading of the formal statement against the problem as posed, by someone who did not write it.
3. **No independent mathematician has reported reading the proof, and there is no referee report** (EG3): Someone in the field reads it and says, under their name, what holds and what does not.
4. **The certificate the proof rests on is named by hash and not released** (EG4): The certificate and its checking program, released and pinned; then one independent rerun of the check.
5. **The formal statements stop short of the paper's, and the formal proofs do not follow the paper's** (EG5): A reading of the README's list of differences between the formal statements and the paper's, signed or refused one by one.

## Contributing

- **Rerun** (if there is a Lean development): copy `prereg_rerun.yaml`, fill in your predictions, register it with `tools/prereg.py register` from the protocol repository and commit it *before* running anything. Run. Report with the **Rerun report** issue form; it becomes a `rerun` cycle under your name.
- **Read**: a trace (reading guide) does not exist yet. Writing one is itself a `trace` cycle. Once it exists, the **Semantic read** form takes signatures and refusals.
- **Anything else**: open a plain issue.

Rules and templates: https://github.com/Nervous-Machine/DEBRIEF/blob/main/CONTRIBUTING.md. Every contribution is one dated cycle under your own name and goes into `CITATION.cff` and the next release.

## Layout

```
ledger/navierstokes.json   the ledger (protocol 0.1.0)
claim.yaml            the pinned claim this record was opened from
SCORECARD.md / ASKS.md  generated from the ledger
prereg_rerun.yaml     a pre-registration template for the first rerun (unregistered)
cycles/               contributed cycles, one file each
```

## Words

This record never calls the claim proved, verified or a theorem. It records what was claimed, what was checked by whom under what rule, and what is still open. Nothing here has standing until a cycle gives it one.
