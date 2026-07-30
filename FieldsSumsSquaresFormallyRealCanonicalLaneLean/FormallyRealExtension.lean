import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FieldsSumsSquaresFormallyRealCanonicalLaneLean

structure FormallyRealExtension (F : FormallyRealField) where
  extensionField : FormallyRealField
  embedding : F.carrier → extensionField.carrier
  embeddingPreservesStructure : Prop
  extensionFormallyRealAxiom : ∀ a : extensionField.carrier,
    (∃ b : extensionField.carrier,
      extensionField.add (extensionField.mul a a) (extensionField.mul b b) = extensionField.zero) → a = extensionField.zero

structure FormallyRealExtensionEvidence {F : FormallyRealField}
    (E : FormallyRealExtension F) where
  embeddingPreservesStructureClosed : E.embeddingPreservesStructure
  extensionFormallyRealAxiomClosed : E.extensionFormallyRealAxiom

def FormallyRealExtensionClosed {F : FormallyRealField}
    (E : FormallyRealExtension F) : Prop :=
  E.embeddingPreservesStructure ∧ E.extensionFormallyRealAxiom

theorem formally_real_extension_closed_from_evidence {F : FormallyRealField}
    (E : FormallyRealExtension F) (Ev : FormallyRealExtensionEvidence E) :
    FormallyRealExtensionClosed E := by
  exact And.intro Ev.embeddingPreservesStructureClosed Ev.extensionFormallyRealAxiomClosed

end FieldsSumsSquaresFormallyRealCanonicalLaneLean
end HautevilleHouse