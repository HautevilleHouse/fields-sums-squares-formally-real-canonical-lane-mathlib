import FieldsSumsSquaresFormallyRealCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FieldsSumsSquaresFormallyRealCanonicalLaneLean

def ConstrainedSumsSquaresClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_sums_squares_endgame (A : AdmissibleClass) :
    ConstrainedSumsSquaresClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FieldsSumsSquaresFormallyRealCanonicalLaneLean
end HautevilleHouse