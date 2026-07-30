import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FieldsSumsSquaresFormallyRealCanonicalLaneLean

structure SumOfSquaresStructure (F : FormallyRealField) where
  sosSet : Set F.carrier
  sosAdd : ∀ x y : F.carrier, x ∈ sosSet → y ∈ sosSet → F.add x y ∈ sosSet
  sosMul : ∀ x y : F.carrier, x ∈ sosSet → y ∈ sosSet → F.mul x y ∈ sosSet
  sosContainsSquares : ∀ x : F.carrier, F.mul x x ∈ sosSet
  sosConeSubset : sosSet ⊆ F.positiveCone

structure SumOfSquaresEvidence {F : FormallyRealField} (S : SumOfSquaresStructure F) where
  sosAddClosed : ∀ x y : F.carrier, x ∈ S.sosSet → y ∈ S.sosSet → F.add x y ∈ S.sosSet
  sosMulClosed : ∀ x y : F.carrier, x ∈ S.sosSet → y ∈ S.sosSet → F.mul x y ∈ S.sosSet
  sosContainsSquaresClosed : ∀ x : F.carrier, F.mul x x ∈ S.sosSet

end FieldsSumsSquaresFormallyRealCanonicalLaneLean
end HautevilleHouse