import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FieldsSumsSquaresFormallyRealCanonicalLaneLean.SquaresFormallyRealRing

namespace HautevilleHouse
namespace FieldsSumsSquaresFormallyRealCanonicalLaneLean

structure StufeNumber (R : FormallyRealRing) where
  minimalS : ℕ
  minusOneIsSumOfSSquares : ∃ (c : Fin minimalS → R.carrier), R.neg R.one = R.sum (λ i => R.mul (c i) (c i)) minimalS
  minimality : ∀ (s : ℕ), (∃ (c : Fin s → R.carrier), R.neg R.one = R.sum (λ i => R.mul (c i) (c i)) s) → minimalS ≤ s
  minusOneIsSumOfSSquaresTerm : minusOneIsSumOfSSquares
  minimalityTerm : minimality

structure StufeEvidence {R : FormallyRealRing} (S : StufeNumber R) where
  minusOneIsSumOfSSquaresClosed : S.minusOneIsSumOfSSquares
  minimalityClosed : S.minimality

def StufeNumberClosed {R : FormallyRealRing} (S : StufeNumber R) : Prop :=
  S.minusOneIsSumOfSSquares ∧ S.minimality

theorem stufe_number_closed {R : FormallyRealRing} (S : StufeNumber R) (E : StufeEvidence S) :
    StufeNumberClosed S := by
  exact And.intro E.minusOneIsSumOfSSquaresClosed E.minimalityClosed

end FieldsSumsSquaresFormallyRealCanonicalLaneLean
end HautevilleHouse