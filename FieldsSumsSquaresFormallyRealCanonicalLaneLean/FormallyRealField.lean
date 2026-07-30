import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FieldsSumsSquaresFormallyRealCanonicalLaneLean

structure FormallyRealField where
  carrier : Type u
  zero : carrier
  one : carrier
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  neg : carrier → carrier
  inv : carrier → carrier
  addAssoc : ∀ a b c : carrier, add (add a b) c = add a (add b c)
  addComm : ∀ a b : carrier, add a b = add b a
  zeroAdd : ∀ a : carrier, add zero a = a
  addNeg : ∀ a : carrier, add a (neg a) = zero
  mulAssoc : ∀ a b c : carrier, mul (mul a b) c = mul a (mul b c)
  mulComm : ∀ a b : carrier, mul a b = mul b a
  oneMul : ∀ a : carrier, mul one a = a
  mulInv : ∀ a : carrier, a ≠ zero → mul a (inv a) = one
  leftDistrib : ∀ a b c : carrier, mul a (add b c) = add (mul a b) (mul a c)
  rightDistrib : ∀ a b c : carrier, mul (add a b) c = add (mul a c) (mul b c)
  zeroNeOne : zero ≠ one
  positiveCone : Set carrier
  coneAdd : ∀ x y : carrier, x ∈ positiveCone → y ∈ positiveCone → add x y ∈ positiveCone
  coneMul : ∀ x y : carrier, x ∈ positiveCone → y ∈ positiveCone → mul x y ∈ positiveCone
  coneContainsSquares : ∀ x : carrier, mul x x ∈ positiveCone
  coneLinear : ∀ x : carrier, x = zero ∨ x ∈ positiveCone ∨ neg x ∈ positiveCone
  coneZeroExcluded : zero ∉ positiveCone

structure FormallyRealFieldEvidence (F : FormallyRealField) where
  positiveConeClosed : F.positiveCone = Set.range (λ (x : F.carrier) => F.mul x x)
  coneAddClosed : ∀ x y : F.carrier, x ∈ F.positiveCone → y ∈ F.positiveCone → F.add x y ∈ F.positiveCone
  coneMulClosed : ∀ x y : F.carrier, x ∈ F.positiveCone → y ∈ F.positiveCone → F.mul x y ∈ F.positiveCone
  coneLinearClosed : ∀ x : F.carrier, x = F.zero ∨ x ∈ F.positiveCone ∨ F.neg x ∈ F.positiveCone

end FieldsSumsSquaresFormallyRealCanonicalLaneLean
end HautevilleHouse