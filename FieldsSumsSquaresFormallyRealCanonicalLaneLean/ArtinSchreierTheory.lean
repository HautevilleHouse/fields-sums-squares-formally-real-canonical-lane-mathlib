import FieldsSumsSquaresFormallyRealCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FieldsSumsSquaresFormallyRealCanonicalLaneLean

structure ArtinSchreierExtension (F : AdmissibleClass) where
  algebraicClosure : Type u
  realClosure : Type u
  orderingExtends : Prop
  realClosed : Prop
  embeddingIntoRealClosed : Prop
  orderingExtendsTerm : orderingExtends
  realClosedTerm : realClosed

def ArtinSchreierClosed (F : AdmissibleClass) (E : ArtinSchreierExtension F) : Prop :=
  E.orderingExtends ∧ E.realClosed ∧ E.embeddingIntoRealClosed

theorem artin_schreier_closed_from_evidence (F : AdmissibleClass) (E : ArtinSchreierExtension F) :
    ArtinSchreierClosed F E := by
  exact And.intro E.orderingExtendsTerm (And.intro E.realClosedTerm E.embeddingIntoRealClosed)

end FieldsSumsSquaresFormallyRealCanonicalLaneLean
end HautevilleHouse