import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FieldsSumsSquaresFormallyRealCanonicalLaneLean.SquaresFormallyRealRing

namespace HautevilleHouse
namespace FieldsSumsSquaresFormallyRealCanonicalLaneLean

structure OrderedFieldStructure (R : FormallyRealRing) where
  totalOrder : R.carrier → R.carrier → Prop
  totalOrderTotal : ∀ a b : R.carrier, totalOrder a b ∨ totalOrder b a
  totalOrderTrans : ∀ a b c : R.carrier, totalOrder a b → totalOrder b c → totalOrder a c
  totalOrderAntisymm : ∀ a b : R.carrier, totalOrder a b → totalOrder b a → a = b
  addCompatible : ∀ a b c : R.carrier, totalOrder a b → totalOrder (R.add a c) (R.add b c)
  mulCompatibleNonneg : ∀ a b c : R.carrier, totalOrder R.zero a → totalOrder b c → totalOrder (R.mul a b) (R.mul a c)
  positiveConeFromOrder : Set R.carrier
  positiveConeFromOrderDefined : ∀ a : R.carrier, positiveConeFromOrder a ↔ totalOrder R.zero a ∧ a ≠ R.zero
  sumOfSquaresNonnegative : ∀ a : R.carrier, (∃ (n : ℕ) (c : ℕ → R.carrier), a = R.sum (λ i => R.mul (c i) (c i)) n) → totalOrder R.zero a
  totalOrderTotalTerm : totalOrderTotal
  totalOrderTransTerm : totalOrderTrans
  totalOrderAntisymmTerm : totalOrderAntisymm
  addCompatibleTerm : addCompatible
  mulCompatibleNonnegTerm : mulCompatibleNonneg
  positiveConeFromOrderDefinedTerm : positiveConeFromOrderDefined
  sumOfSquaresNonnegativeTerm : sumOfSquaresNonnegative

structure OrderedFieldEvidence {R : FormallyRealRing} (O : OrderedFieldStructure R) where
  totalOrderTotalClosed : O.totalOrderTotal
  totalOrderTransClosed : O.totalOrderTrans
  totalOrderAntisymmClosed : O.totalOrderAntisymm
  addCompatibleClosed : O.addCompatible
  mulCompatibleNonnegClosed : O.mulCompatibleNonneg
  positiveConeFromOrderDefinedClosed : O.positiveConeFromOrderDefined
  sumOfSquaresNonnegativeClosed : O.sumOfSquaresNonnegative

def OrderedFieldStructureClosed {R : FormallyRealRing} (O : OrderedFieldStructure R) : Prop :=
  O.totalOrderTotal ∧ O.totalOrderTrans ∧ O.totalOrderAntisymm ∧ O.addCompatible ∧ O.mulCompatibleNonneg ∧ O.positiveConeFromOrderDefined ∧ O.sumOfSquaresNonnegative

theorem ordered_field_structure_closed {R : FormallyRealRing} (O : OrderedFieldStructure R) (E : OrderedFieldEvidence O) :
    OrderedFieldStructureClosed O := by
  exact And.intro E.totalOrderTotalClosed
    (And.intro E.totalOrderTransClosed
      (And.intro E.totalOrderAntisymmClosed
        (And.intro E.addCompatibleClosed
          (And.intro E.mulCompatibleNonnegClosed
            (And.intro E.positiveConeFromOrderDefinedClosed E.sumOfSquaresNonnegativeClosed)))))

end FieldsSumsSquaresFormallyRealCanonicalLaneLean
end HautevilleHouse