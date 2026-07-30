import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FieldsSumsSquaresFormallyRealCanonicalLaneLean

structure SumOfSquaresDecomposition (F : FormallyRealField) where
  numerator : F.carrier
  denominator : F.carrier
  decomposition : List (F.carrier → F.carrier)  -- summand squaring functions
  equalityHolds : Prop

structure SumOfSquaresDecompositionEvidence {F : FormallyRealField}
    (D : SumOfSquaresDecomposition F) where
  equalityHoldsClosed : D.equalityHolds

def SumOfSquaresDecompositionClosed {F : FormallyRealField}
    (D : SumOfSquaresDecomposition F) : Prop :=
  D.equalityHolds

theorem sum_of_squares_decomposition_closed_from_evidence {F : FormallyRealField}
    (D : SumOfSquaresDecomposition F) (E : SumOfSquaresDecompositionEvidence D) :
    SumOfSquaresDecompositionClosed D := by
  exact E.equalityHoldsClosed

end FieldsSumsSquaresFormallyRealCanonicalLaneLean
end HautevilleHouse