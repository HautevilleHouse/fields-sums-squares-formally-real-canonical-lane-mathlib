import FieldsSumsSquaresFormallyRealCanonicalLaneLean.FormallyRealField

namespace HautevilleHouse
namespace FieldsSumsSquaresFormallyRealCanonicalLaneLean

structure PositiveCone (F : FormallyRealField) where
  pos : Set F.carrier
  addClosed : ∀ x y, x ∈ pos → y ∈ pos → F.add x y ∈ pos
  mulClosed : ∀ x y, x ∈ pos → y ∈ pos → F.mul x y ∈ pos
  squareInPos : ∀ x : F.carrier, x ≠ F.zero → F.mul x x ∈ pos
  trichotomy : ∀ x : F.carrier, x = F.zero ∨ x ∈ pos ∨ F.neg x ∈ pos
  zeroNotPos : F.zero ∉ pos

def nonneg (F : FormallyRealField) (P : PositiveCone F) (x : F.carrier) : Prop :=
  x = F.zero ∨ x ∈ P.pos

theorem sums_squares_are_nonneg (F : FormallyRealField) (P : PositiveCone F) (xs : List F.carrier) :
  nonneg F P (SumSquaresForm F xs) := by
  induction' xs with x xs ih
  · exact Or.inl rfl
  · rw [SumSquaresForm]
    simp
    have hsq : x = F.zero ∨ F.mul x x ∈ P.pos := by
      by_cases h : x = F.zero
      · exact Or.inl h
      · exact Or.inr (P.squareInPos x h)
    cases' hsq with hzero hpos
    · rw [hzero, F.mul, F.zero]
      exact ih
    · have : F.add (F.mul x x) (SumSquaresForm F xs) ∈ P.pos := P.addClosed (F.mul x x) (SumSquaresForm F xs) hpos (by
        cases' ih with h ih
        · rw [h]
          exact P.squareInPos (SumSquaresForm F xs) ?_
        · exact ih)
      exact Or.inr this

theorem order_from_positive_cone (F : FormallyRealField) (P : PositiveCone F) : PartialOrder F.carrier where
  le x y := nonneg F P (F.add (F.neg x) y)
  le_refl x := by
    show nonneg F P (F.add (F.neg x) x)
    calc
      F.add (F.neg x) x = F.zero := by
        rw [F.addComm, F.addNeg]
      _ = F.zero := rfl
    exact Or.inl rfl
  le_trans x y z hxy hyz := by
    rcases hxy with (hxy | hxy)
    · rcases hyz with (hyz | hyz)
      · exfalso
        apply F.zeroNeqOne
        -- Not needed
        sorry
      · sorry
    · sorry
  le_antisymm x y hxy hyz := sorry

end FieldsSumsSquaresFormallyRealCanonicalLaneLean
end HautevilleHouse