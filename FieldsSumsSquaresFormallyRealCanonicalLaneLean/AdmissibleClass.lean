import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FieldsSumsSquaresFormallyRealCanonicalLaneLean

structure AdmissibleClass where
  field : Type u
  charZero : Prop
  formallyReal : Prop
  sumsOfSquaresZero : Prop
  witnessedFormallyReal : sumsOfSquaresZero

def admittedClosure (A : AdmissibleClass) : Prop :=
  fieldHasOrdering A.field ∧ A.formallyReal

end FieldsSumsSquaresFormallyRealCanonicalLaneLean
end HautevilleHouse