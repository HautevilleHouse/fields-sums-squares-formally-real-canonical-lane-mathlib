import FieldsSumsSquaresFormallyRealCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace FieldsSumsSquaresFormallyRealCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.sumsOfSquaresZero

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.witnessedFormallyReal

end FieldsSumsSquaresFormallyRealCanonicalLaneLean
end HautevilleHouse