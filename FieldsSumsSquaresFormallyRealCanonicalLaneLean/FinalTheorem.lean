import FieldsSumsSquaresFormallyRealCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace FieldsSumsSquaresFormallyRealCanonicalLaneLean

def ConstrainedFieldsSumsSquaresClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_fields_sums_squares_endgame (A : AdmissibleClass) :
    ConstrainedFieldsSumsSquaresClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FieldsSumsSquaresFormallyRealCanonicalLaneLean
end HautevilleHouse