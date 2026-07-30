import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FieldsSumsSquaresFormallyRealCanonicalLaneLean

structure RealClosedFieldStructure (F : FormallyRealField) where
  intermediateValueProperty : Prop
  oddDegreePolynomialRoot : Prop
  orderingUnique : Prop
  algebraicClosure : Prop

structure RealClosedFieldEvidence {F : FormallyRealField} (R : RealClosedFieldStructure F) where
  intermediateValuePropertyClosed : R.intermediateValueProperty
  oddDegreePolynomialRootClosed : R.oddDegreePolynomialRoot
  orderingUniqueClosed : R.orderingUnique
  algebraicClosureClosed : R.algebraicClosure

def RealClosedFieldClosed {F : FormallyRealField} (R : RealClosedFieldStructure F) : Prop :=
  R.intermediateValueProperty ∧ R.oddDegreePolynomialRoot ∧
  R.orderingUnique ∧ R.algebraicClosure

theorem real_closed_field_closed_from_evidence {F : FormallyRealField}
    (R : RealClosedFieldStructure F) (E : RealClosedFieldEvidence R) :
    RealClosedFieldClosed R := by
  exact And.intro E.intermediateValuePropertyClosed
    (And.intro E.oddDegreePolynomialRootClosed
      (And.intro E.orderingUniqueClosed E.algebraicClosureClosed))

end FieldsSumsSquaresFormallyRealCanonicalLaneLean
end HautevilleHouse