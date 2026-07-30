import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FieldsSumsSquaresFormallyRealCanonicalLaneLean

structure ArtinSchreierPackage (F : FormallyRealField) where
  realClosure : Type u
  realClosureField : FormallyRealField
  embedding : F.carrier → realClosureField.carrier
  property : ∀ x : F.carrier, x ∈ F.positiveCone ↔ (∃ y : realClosureField.carrier, embedding x = realClosureField.mul y y)

structure ArtinSchreierEvidence {F : FormallyRealField} (A : ArtinSchreierPackage F) where
  propertyClosed : ∀ x : F.carrier, x ∈ F.positiveCone ↔ (∃ y : A.realClosureField.carrier, A.embedding x = A.realClosureField.mul y y)

end FieldsSumsSquaresFormallyRealCanonicalLaneLean
end HautevilleHouse