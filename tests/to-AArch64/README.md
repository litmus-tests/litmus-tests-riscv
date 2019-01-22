# Tests converted to AArch64 (ARMv8)

As there are not many implementations of RISC-V available for us, we
cannot properly validate our RISC-V memory model.  To somewhat
compensate for that, we converted all the RISC-V tests to AArch64, as
explained below, and ran them in our ARMv8 memory model, which is very
similar to RVWMO, and was extensively tested against real (ARMv8)
implementations.  We than compared the results, making sure all the
differences are intentional.

The tests in this directory are the AArch64 tests that were converted
from RISC-V tests.  The AArch64 test RV+<name>.litmus was converted
from the RISC-V test <name>.litmus.

In addition, we have also converted our (not publicly available yet)
AArch64 litmus tests to RISC-V, ran them in the RISC-V model and
compared the results.  The comparison found similar differences to
those described below, and no other differences.

## Converting the tests

To convert a RISC-V test to AArch64 we extract the diy cycle, that was
used to generate the RISC-V test, from the litmus file, by looking for
the line `Orig=<cycle>`.  We then convert each edge in `<cycle>` from
RISC-V to AArch64 (e.g. from `Fence.rw.rwdWW` to `DMB.SYdWW`) and then
feed the converted cycle to diyone7.

## Comparing the results

As the RISC-V and AArch64 tests use different register names it is not
possible to compare the final states as we usually do (using mcompare).
Instead, we only compare the success/failure of the final state
assertion.

We have observed the following differences:
- Some tests with `fence.i` with control dependency or address
dependency are allowed in the RISC-V model and forbidden in the
ARMv8 model.  This is an intentional difference.
- The test R+fence.w.w+posxp-addr is allowed in the ARMv8 model and
forbidden in the RISC-V model.  This is an intentional difference as
the ARMv8 model allows write-forwarding from store-exclusive and the
RISC-V model forbids write-forwarding from store-conditional.
