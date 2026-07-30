import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FieldsSumsSquaresFormallyRealCanonicalLaneLean

structure OrderedFieldExtension (F : FormallyRealField) where
  extension : Type u
  extensionField : FormallyRealField
  embed : F.carrier → extensionField.carrier
  orderEmbedding : ∀ x : F.carrier, x ∈ F.positiveCone → embed x ∈ extensionField.positiveCone

structure OrderedFieldExtensionEvidence {F : FormallyRealField} (E : OrderedFieldExtension F) where
  orderEmbeddingClosed : ∀ x : F.carrier, x ∈ F.positiveCone → E.embed x ∈ E.extensionField.positiveCone

end FieldsSumsSquaresFormallyRealCanonicalLaneLean
end HautevilleHouse