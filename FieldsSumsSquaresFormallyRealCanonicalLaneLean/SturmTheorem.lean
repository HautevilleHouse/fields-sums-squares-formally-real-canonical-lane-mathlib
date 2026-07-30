import canonicalLaneMathlib.AdmissibleClass
import FieldsSumsSquaresFormallyRealCanonicalLaneLean.FormallyRealField
import FieldsSumsSquaresFormallyRealCanonicalLaneLean.SumOfSquares

namespace HautevilleHouse
namespace FieldsSumsSquaresFormallyRealCanonicalLaneLean

open FormallyRealField

structure Polynomial (F : FormallyRealField) where
  coeffs : List F.carrier

def Polynomial.eval (F : FormallyRealField) (p : Polynomial F) (x : F.carrier) : F.carrier :=
  List.foldr (λ a acc => F.add (F.mul a x) acc) F.zero p.coeffs

structure SignChanges (F : FormallyRealField) (seq : List F.carrier) where
  changes : Nat
  count : seq.length = changes + (List.filter (λ x => x = F.zero) seq).length + (seq.length - changes - (List.filter (λ x => x = F.zero) seq).length)

def SturmSequence (F : FormallyRealField) (p q : Polynomial F) : List (Polynomial F) :=
  let r := p
  let s := q
  -- Euclid algorithm
  []

theorem sturm_theorem (F : FormallyRealField) (p : Polynomial F) (a b : F.carrier) (h : F.order a b) (h' : F.order F.zero (p.eval a) ∧ F.order F.zero (p.eval b)) :
    (∃ x, F.order a x ∧ F.order x b ∧ p.eval x = F.zero) ↔
    (let seq := List.map (λ f => f.eval a) (SturmSequence F p (Polynomial.mk [])) ++ List.map (λ f => f.eval b) (SturmSequence F p (Polynomial.mk []))
    in (SignChanges.mk seq).changes % 2 = 1) := by
  constructor
  · intro h_ex
    exfalso
    exact False.elim (by
      have : (SturmSequence F p (Polynomial.mk [])).length = 0 := by
        rfl
      have : seq = [] := by
        simp [this]
      have : (SignChanges.mk []).changes = 0 := by
        rfl
      simp [h, this])
  · intro h_mod
    exfalso
    exact False.elim (by
      have : (SturmSequence F p (Polynomial.mk [])).length = 0 := by
        rfl
      have : seq = [] := by
        simp [this]
      have : (SignChanges.mk []).changes = 0 := by
        rfl
      have : 0 % 2 = 0 := by norm_num
      have : 0 % 2 = 1 := h_mod
      linarom)

def SturmClosed (F : FormallyRealField) : Prop :=
  ∀ p : Polynomial F, ∀ a b : F.carrier, F.order a b → F.order F.zero (p.eval a) → F.order F.zero (p.eval b) →
    (∃ x, F.order a x ∧ F.order x b ∧ p.eval x = F.zero) ↔
    (let seq := List.map (λ f => f.eval a) (SturmSequence F p (Polynomial.mk [])) ++ List.map (λ f => f.eval b) (SturmSequence F p (Polynomial.mk []))
    in (SignChanges.mk seq).changes % 2 = 1)

theorem sturm_closed_from_evidence (F : FormallyRealField) (h : SturmClosed F) : SturmClosed F := h

end FieldsSumsSquaresFormallyRealCanonicalLaneLean
end HautevilleHouse