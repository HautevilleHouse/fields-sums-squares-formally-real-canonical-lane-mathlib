import FieldsSumsSquaresFormallyRealCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FieldsSumsSquaresFormallyRealCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  fieldHasOrdering A.field

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.witnessedFormallyReal

end FieldsSumsSquaresFormallyRealCanonicalLaneLean
end HautevilleHouse