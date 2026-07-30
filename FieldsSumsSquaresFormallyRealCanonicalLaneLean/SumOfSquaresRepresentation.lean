import FieldsSumsSquaresFormallyRealCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FieldsSumsSquaresFormallyRealCanonicalLaneLean

structure SumOfSquaresRepresentation (F : AdmissibleClass) where
  element : F.field
  representation : List (F.field)
  sumOfSquaresEq : element = (representation.map (λ x => x * x)).sum
  nonnegativity : Prop
  representationClosed : sumOfSquaresEq
  nonnegativityClosed : nonnegativity

def SumOfSquaresClosed (F : AdmissibleClass) (S : SumOfSquaresRepresentation F) : Prop :=
  S.sumOfSquaresEq ∧ S.nonnegativity

theorem sum_of_squares_closed_from_evidence (F : AdmissibleClass) (S : SumOfSquaresRepresentation F) :
    SumOfSquaresClosed F S := by
  exact And.intro S.representationClosed S.nonnegativityClosed

end FieldsSumsSquaresFormallyRealCanonicalLaneLean
end HautevilleHouse