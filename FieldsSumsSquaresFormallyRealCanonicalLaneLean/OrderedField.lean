import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FieldsSumsSquaresFormallyRealCanonicalLaneLean

structure OrderedFieldStructure (F : FormallyRealField) where
  totalOrder : F → F → Prop
  orderReflexive : ∀ a : F, totalOrder a a
  orderTransitive : ∀ a b c : F, totalOrder a b → totalOrder b c → totalOrder a c
  orderAntisymmetric : ∀ a b : F, totalOrder a b → totalOrder b a → a = b
  total : ∀ a b : F, totalOrder a b ∨ totalOrder b a
  addCompatible : ∀ a b c : F, totalOrder a b → totalOrder (add a c) (add b c)
  mulPositive : ∀ a b : F, totalOrder zero a → totalOrder zero b → totalOrder zero (mul a b)
  squaresNonnegative : ∀ a : F, totalOrder zero (mul a a)
  positiveConeFromSquares : Set F
  positiveConeGeneratedBySumOfSquares : Prop

structure OrderedFieldEvidence {F : FormallyRealField} (O : OrderedFieldStructure F) where
  squaresNonnegativeClosed : O.squaresNonnegative
  positiveConeGeneratedBySumOfSquaresClosed : O.positiveConeGeneratedBySumOfSquares

def OrderedFieldClosed {F : FormallyRealField} (O : OrderedFieldStructure F) : Prop :=
  O.squaresNonnegative ∧ O.positiveConeGeneratedBySumOfSquares

theorem ordered_field_closed_from_evidence {F : FormallyRealField}
    (O : OrderedFieldStructure F) (E : OrderedFieldEvidence O) :
    OrderedFieldClosed O := by
  exact And.intro E.squaresNonnegativeClosed E.positiveConeGeneratedBySumOfSquaresClosed

end FieldsSumsSquaresFormallyRealCanonicalLaneLean
end HautevilleHouse