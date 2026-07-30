import FieldsSumsSquaresFormallyRealCanonicalLaneLean.FormallyRealFields

namespace HautevilleHouse
namespace FieldsSumsSquaresFormallyRealCanonicalLaneLean

structure ArtinSchreierExtension where
  baseField : FormallyRealField
  algebraicExtension : FormallyRealField
  orderExtended : Prop
  realClosure : Prop
  uniqueOrder : Prop
  orderExtendedClosed : orderExtended
  realClosureClosed : realClosure
  uniqueOrderClosed : uniqueOrder

structure ArtinSchreierEvidence (A : ArtinSchreierExtension) where
  orderExtendedClosed : A.orderExtended
  realClosureClosed : A.realClosure
  uniqueOrderClosed : A.uniqueOrder

def ArtinSchreierClosed (A : ArtinSchreierExtension) : Prop :=
  A.orderExtended ∧ A.realClosure ∧ A.uniqueOrder

theorem artin_schreier_closed_from_evidence (A : ArtinSchreierExtension)
    (E : ArtinSchreierEvidence A) : ArtinSchreierClosed A := by
  exact And.intro E.orderExtendedClosed
    (And.intro E.realClosureClosed E.uniqueOrderClosed)

end FieldsSumsSquaresFormallyRealCanonicalLaneLean
end HautevilleHouse