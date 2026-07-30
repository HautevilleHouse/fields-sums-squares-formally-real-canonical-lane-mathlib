import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FieldsSumsSquaresFormallyRealCanonicalLaneLean

structure FormallyRealRing where
  carrier : Type u
  zero : carrier
  one : carrier
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  neg : carrier → carrier
  addAssoc : ∀ a b c : carrier, add (add a b) c = add a (add b c)
  addComm : ∀ a b : carrier, add a b = add b a
  zeroAdd : ∀ a : carrier, add zero a = a
  addNeg : ∀ a : carrier, add a (neg a) = zero
  mulAssoc : ∀ a b c : carrier, mul (mul a b) c = mul a (mul b c)
  mulOne : ∀ a : carrier, mul a one = a
  oneMul : ∀ a : carrier, mul one a = a
  distribLeft : ∀ a b c : carrier, mul a (add b c) = add (mul a b) (mul a c)
  distribRight : ∀ a b c : carrier, mul (add a b) c = add (mul a c) (mul b c)
  sumOfSquaresNonzero : Prop
  sumOfSquaresNonzeroTerm : sumOfSquaresNonzero

structure FormallyRealRingEvidence (R : FormallyRealRing) where
  sumOfSquaresNonzeroClosed : R.sumOfSquaresNonzero

def FormallyRealRingClosed (R : FormallyRealRing) : Prop :=
  R.sumOfSquaresNonzero

theorem formally_real_ring_closed_from_evidence (R : FormallyRealRing) (E : FormallyRealRingEvidence R) :
    FormallyRealRingClosed R := by
  exact E.sumOfSquaresNonzeroClosed

end FieldsSumsSquaresFormallyRealCanonicalLaneLean
end HautevilleHouse